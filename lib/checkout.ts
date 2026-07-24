import {
  AUSPOST_NEXT_DAY_DEFAULT_FEE_CENTS,
  MAINTENANCE_FEE_CENTS,
  products,
  type Product,
} from "./catalogue";
import {
  isValidAustraliaPostDeliverySlot,
  isValidDeliverySlot,
} from "./delivery";
import {
  DeliveryQuoteError,
  verifyExpressDeliveryQuote,
} from "./delivery-quote";

const MAX_UNIQUE_ITEMS = 50;
const MAX_QUANTITY_PER_PRODUCT = 24;

export type DeliveryMethod = "express" | "normal";

export type ValidatedCheckoutItem = {
  productId: number;
  productName: string;
  unitPriceCents: number;
  quantity: number;
};

export type ValidatedCheckout = {
  checkoutToken: string;
  ageConfirmed: true;
  items: ValidatedCheckoutItem[];
  deliveryMethod: DeliveryMethod;
  deliverySlot: string;
  deliveryDate: string;
  deliveryQuoteToken: string;
  destinationPlaceId: string;
  distanceMeters: number;
  durationSeconds: number;
  deliveryRateCentsPerKm: number;
  paymentMethod: "card" | "apple_pay" | "google_pay";
  receiptPreference: "email" | "sms" | "both";
  customer: {
    name: string;
    email: string;
    phone: string;
    address: string;
    instructions: string;
  };
  subtotalCents: number;
  deliveryFeeCents: number;
  maintenanceFeeCents: number;
  gstIncludedCents: number;
  totalCents: number;
};

export class CheckoutValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CheckoutValidationError";
  }
}

/**
 * Validates a checkout exclusively from server-owned catalogue and delivery
 * data. A DB-backed catalogue can be supplied by the API route; browser prices,
 * route distances, fees, GST and totals are deliberately ignored.
 */
export function validateCheckout(
  input: unknown,
  productCatalogue: readonly Product[] = products,
): ValidatedCheckout {
  if (!isRecord(input)) throw new CheckoutValidationError("Invalid order details");

  if (input.ageConfirmed !== true) {
    throw new CheckoutValidationError("Confirm that you are 18 or over before ordering alcohol");
  }

  const checkoutToken = cleanString(input.checkoutToken, 64, "Invalid checkout token");
  if (!/^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(checkoutToken)) {
    throw new CheckoutValidationError("Invalid checkout token");
  }

  const rawItems = input.items;
  if (!Array.isArray(rawItems) || rawItems.length === 0 || rawItems.length > MAX_UNIQUE_ITEMS) {
    throw new CheckoutValidationError("Your basket is empty or too large");
  }

  const quantities = new Map<number, number>();
  for (const rawItem of rawItems) {
    if (!isRecord(rawItem)) throw new CheckoutValidationError("Invalid basket item");
    const productId = Number(rawItem.productId);
    const quantity = Number(rawItem.quantity);
    if (!Number.isInteger(productId) || !Number.isInteger(quantity) || quantity < 1) {
      throw new CheckoutValidationError("Invalid basket quantity");
    }

    const nextQuantity = (quantities.get(productId) ?? 0) + quantity;
    if (nextQuantity > MAX_QUANTITY_PER_PRODUCT) {
      throw new CheckoutValidationError("A maximum of 24 units is allowed per product");
    }
    quantities.set(productId, nextQuantity);
  }

  const items = Array.from(quantities, ([productId, quantity]) => {
    const product = productCatalogue.find((candidate) => candidate.id === productId);
    if (!product) throw new CheckoutValidationError("Your basket contains an unknown product");
    if (product.placeholder || !Number.isInteger(product.priceCents) || product.priceCents < 1) {
      throw new CheckoutValidationError(`${product.name} is awaiting confirmed stock and cannot be purchased yet`);
    }
    if (
      (product.inventoryQuantity !== undefined
        && (!Number.isInteger(product.inventoryQuantity) || product.inventoryQuantity < 1))
      || (process.env.COMMERCE_LIVE === "true" && !Number.isInteger(product.inventoryQuantity))
    ) {
      throw new CheckoutValidationError(`${product.name} is out of stock or has no verified inventory`);
    }
    if (product.inventoryQuantity !== undefined && quantity > product.inventoryQuantity) {
      throw new CheckoutValidationError(
        `Only ${product.inventoryQuantity} unit${product.inventoryQuantity === 1 ? "" : "s"} of ${product.name} are available`,
      );
    }
    return {
      productId,
      productName: product.name,
      unitPriceCents: product.priceCents,
      quantity,
    };
  });

  const deliveryMethod = cleanString(input.deliveryMethod ?? "express", 20, "Choose a delivery method");
  if (!isDeliveryMethod(deliveryMethod)) throw new CheckoutValidationError("Choose express or normal delivery");

  const deliverySlot = cleanString(input.deliverySlot, 40, "Choose a delivery date");
  if (!isValidDeliverySlot(deliverySlot)) {
    throw new CheckoutValidationError("Choose a valid delivery date and time");
  }
  const deliveryDate = deliverySlot.split("|")[0] ?? "";

  const paymentMethod = cleanString(input.paymentMethod ?? "card", 20, "Choose a payment method");
  if (!isPaymentMethod(paymentMethod)) throw new CheckoutValidationError("Choose a valid payment method");

  const receiptPreference = cleanString(input.receiptPreference ?? "email", 10, "Choose a receipt option");
  if (!isReceiptPreference(receiptPreference)) throw new CheckoutValidationError("Choose a valid receipt option");

  if (!isRecord(input.customer)) throw new CheckoutValidationError("Enter your delivery details");
  const name = cleanString(input.customer.name, 100, "Enter your full name");
  const email = cleanString(input.customer.email, 254, "Enter your email address").toLowerCase();
  const phone = normalizeAustralianMobile(cleanString(input.customer.phone, 24, "Enter your mobile number"));
  const enteredAddress = cleanString(input.customer.address, 300, "Enter your delivery address");
  const instructions = optionalString(input.customer.instructions, 300);
  const enteredPlaceId = optionalString(input.customer.placeId, 256);

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    throw new CheckoutValidationError("Enter a valid email address");
  }
  if (!/\b\d{4}\b/.test(enteredAddress) || !/\b\d+[A-Za-z]?(?:[-/]\d+[A-Za-z]?)?\s+[A-Za-z]/.test(enteredAddress)) {
    throw new CheckoutValidationError("Enter a full Australian street address");
  }

  let address = enteredAddress;
  let deliveryQuoteToken = "";
  let destinationPlaceId = enteredPlaceId;
  let distanceMeters = 0;
  let durationSeconds = 0;
  let deliveryRateCentsPerKm = 0;
  let deliveryFeeCents: number;

  if (deliveryMethod === "express") {
    if (isValidAustraliaPostDeliverySlot(deliverySlot)) {
      throw new CheckoutValidationError("Choose an express delivery window");
    }
    deliveryQuoteToken = cleanString(input.deliveryQuoteToken, 4_000, "Check your express delivery address");
    try {
      const quote = verifyExpressDeliveryQuote(deliveryQuoteToken);
      address = quote.address;
      destinationPlaceId = quote.placeId;
      distanceMeters = quote.distanceMeters;
      durationSeconds = quote.durationSeconds;
      deliveryRateCentsPerKm = quote.rateCentsPerKm;
      deliveryFeeCents = quote.deliveryFeeCents;
    } catch (error) {
      if (error instanceof DeliveryQuoteError) {
        throw new CheckoutValidationError(error.message);
      }
      throw error;
    }
  } else {
    if (!isValidAustraliaPostDeliverySlot(deliverySlot)) {
      throw new CheckoutValidationError("Normal delivery is available only for the next business day");
    }
    deliveryFeeCents = configuredAustraliaPostFee();
  }

  const subtotalCents = items.reduce(
    (total, item) => total + item.unitPriceCents * item.quantity,
    0,
  );
  const maintenanceFeeCents = MAINTENANCE_FEE_CENTS;
  const totalCents = subtotalCents + deliveryFeeCents + maintenanceFeeCents;
  const gstIncludedCents = Math.round(totalCents / 11);

  return {
    checkoutToken,
    ageConfirmed: true,
    items,
    deliveryMethod,
    deliverySlot,
    deliveryDate,
    deliveryQuoteToken,
    destinationPlaceId,
    distanceMeters,
    durationSeconds,
    deliveryRateCentsPerKm,
    paymentMethod,
    receiptPreference,
    customer: { name, email, phone, address, instructions },
    subtotalCents,
    deliveryFeeCents,
    maintenanceFeeCents,
    gstIncludedCents,
    totalCents,
  };
}

function configuredAustraliaPostFee(): number {
  const raw = process.env.AUSPOST_NEXT_DAY_FEE_CENTS?.trim();
  if (!raw) {
    if (process.env.COMMERCE_LIVE === "true") {
      throw new CheckoutValidationError("Australia Post pricing must be configured before normal delivery can go live");
    }
    return AUSPOST_NEXT_DAY_DEFAULT_FEE_CENTS;
  }
  const fee = Number(raw);
  if (!Number.isInteger(fee) || fee < 0 || fee > 100_000) {
    throw new CheckoutValidationError("Australia Post delivery pricing is not configured correctly");
  }
  if (process.env.COMMERCE_LIVE === "true") {
    const publicFee = Number(process.env.NEXT_PUBLIC_AUSPOST_NEXT_DAY_FEE_CENTS);
    if (!Number.isInteger(publicFee) || publicFee !== fee) {
      throw new CheckoutValidationError("Displayed and server Australia Post fees must match before normal delivery can go live");
    }
  }
  return fee;
}

function isDeliveryMethod(value: string): value is DeliveryMethod {
  return value === "express" || value === "normal";
}

function isPaymentMethod(value: string): value is ValidatedCheckout["paymentMethod"] {
  return value === "card" || value === "apple_pay" || value === "google_pay";
}

function isReceiptPreference(value: string): value is ValidatedCheckout["receiptPreference"] {
  return value === "email" || value === "sms" || value === "both";
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}

function cleanString(value: unknown, maxLength: number, message: string): string {
  if (typeof value !== "string") throw new CheckoutValidationError(message);
  const cleaned = value.trim();
  if (!cleaned || cleaned.length > maxLength) throw new CheckoutValidationError(message);
  return cleaned;
}

function optionalString(value: unknown, maxLength: number): string {
  if (value === undefined || value === null || value === "") return "";
  if (typeof value !== "string" || value.trim().length > maxLength) {
    throw new CheckoutValidationError("Delivery details are too long");
  }
  return value.trim();
}

function normalizeAustralianMobile(value: string): string {
  const compact = value.replace(/[\s()-]/g, "");
  if (/^04\d{8}$/.test(compact)) return `+61${compact.slice(1)}`;
  if (/^614\d{8}$/.test(compact)) return `+${compact}`;
  if (/^\+614\d{8}$/.test(compact)) return compact;
  throw new CheckoutValidationError("Enter a valid Australian mobile number");
}
