import {
  DELIVERY_FEE_CENTS,
  FREE_DELIVERY_THRESHOLD_CENTS,
  deliverySlots,
  products,
} from "./catalogue";

const MAX_UNIQUE_ITEMS = products.length;
const MAX_QUANTITY_PER_PRODUCT = 24;

export type ValidatedCheckoutItem = {
  productId: number;
  productName: string;
  unitPriceCents: number;
  quantity: number;
};

export type ValidatedCheckout = {
  checkoutToken: string;
  items: ValidatedCheckoutItem[];
  deliverySlot: (typeof deliverySlots)[number];
  customer: {
    name: string;
    email: string;
    address: string;
    instructions: string;
  };
  subtotalCents: number;
  deliveryFeeCents: number;
  totalCents: number;
};

export class CheckoutValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CheckoutValidationError";
  }
}

export function validateCheckout(input: unknown): ValidatedCheckout {
  if (!isRecord(input)) throw new CheckoutValidationError("Invalid order details");

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
    const product = products.find((candidate) => candidate.id === productId);
    if (!product) throw new CheckoutValidationError("Your basket contains an unknown product");
    return {
      productId,
      productName: product.name,
      unitPriceCents: product.priceCents,
      quantity,
    };
  });

  const deliverySlot = cleanString(input.deliverySlot, 40, "Choose a delivery time");
  if (!deliverySlots.includes(deliverySlot as (typeof deliverySlots)[number])) {
    throw new CheckoutValidationError("Choose a valid delivery time");
  }

  if (!isRecord(input.customer)) throw new CheckoutValidationError("Enter your delivery details");
  const name = cleanString(input.customer.name, 100, "Enter your full name");
  const email = cleanString(input.customer.email, 254, "Enter your email address").toLowerCase();
  const address = cleanString(input.customer.address, 200, "Enter your delivery address");
  const instructions = optionalString(input.customer.instructions, 300);

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    throw new CheckoutValidationError("Enter a valid email address");
  }
  if (address.length < 5) throw new CheckoutValidationError("Enter a valid delivery address");

  const subtotalCents = items.reduce(
    (total, item) => total + item.unitPriceCents * item.quantity,
    0,
  );
  const deliveryFeeCents = subtotalCents >= FREE_DELIVERY_THRESHOLD_CENTS ? 0 : DELIVERY_FEE_CENTS;

  return {
    checkoutToken,
    items,
    deliverySlot: deliverySlot as (typeof deliverySlots)[number],
    customer: { name, email, address, instructions },
    subtotalCents,
    deliveryFeeCents,
    totalCents: subtotalCents + deliveryFeeCents,
  };
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
    throw new CheckoutValidationError("Delivery instructions are too long");
  }
  return value.trim();
}
