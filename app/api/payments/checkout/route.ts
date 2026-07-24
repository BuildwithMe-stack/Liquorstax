import { NextRequest, NextResponse } from "next/server";
import { CATALOGUE_PREVIEW_ONLY, MAINTENANCE_FEE_CENTS } from "@/lib/catalogue";
import { getPublicCatalogueData } from "@/lib/admin-data";
import { CheckoutValidationError, validateCheckout } from "@/lib/checkout";
import {
  CheckoutTokenConflictError,
  DeliverySlotUnavailableError,
  InventoryUnavailableError,
  attachStripeSession,
  createPendingPaymentOrder,
  isDatabaseConfigured,
  releasePendingPaymentOrder,
} from "@/lib/database";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const MAX_REQUEST_BYTES = 32_000;
const CHECKOUTS_PER_MINUTE = 8;
const rateBuckets = new Map<string, { count: number; resetAt: number }>();

export async function POST(request: NextRequest) {
  if (process.env.COMMERCE_LIVE !== "true" || CATALOGUE_PREVIEW_ONLY) {
    return NextResponse.json(
      { error: "Payments remain in owner-sample mode until current prices and stock are approved" },
      { status: 409 },
    );
  }
  if (!process.env.STRIPE_SECRET_KEY) {
    return NextResponse.json({ error: "Secure payment is not configured" }, { status: 503 });
  }
  if (!process.env.STRIPE_WEBHOOK_SECRET) {
    return NextResponse.json({ error: "Payment confirmation is not configured" }, { status: 503 });
  }
  if (!process.env.STRIPE_CONNECTED_ACCOUNT_ID) {
    return NextResponse.json({ error: "The Liquor Stax Stripe account is not connected" }, { status: 503 });
  }
  if (!process.env.APP_BASE_URL) {
    return NextResponse.json({ error: "The canonical checkout website URL is not configured" }, { status: 503 });
  }
  if (!isDatabaseConfigured()) {
    return NextResponse.json({ error: "The order database must be connected before payments go live" }, { status: 503 });
  }
  if (process.env.SHOPFRONT_INVENTORY_SYNC_LIVE !== "true") {
    return NextResponse.json(
      { error: "Verified Shopfront inventory sync is required before payments can go live" },
      { status: 503 },
    );
  }
  const licenceNumber = process.env.LIQUOR_LICENCE_NUMBER?.trim();
  if (
    !licenceNumber
    || process.env.NEXT_PUBLIC_LIQUOR_LICENCE_NUMBER?.trim() !== licenceNumber
    || process.env.LCV_OFF_PREMISES_NOTIFIED !== "true"
  ) {
    return NextResponse.json(
      { error: "Liquor licence display and off-premises ordering approval must be confirmed before checkout" },
      { status: 503 },
    );
  }
  const capacity = Number(process.env.DELIVERY_CAPACITY_PER_WINDOW);
  if (!Number.isInteger(capacity) || capacity < 1 || capacity > 100) {
    return NextResponse.json({ error: "Delivery capacity is not configured" }, { status: 503 });
  }
  if (!process.env.RESEND_API_KEY || !process.env.EMAIL_FROM || !process.env.OWNER_DISPATCH_EMAIL) {
    return NextResponse.json({ error: "Order email and owner alerts are not configured" }, { status: 503 });
  }

  const rateLimit = takeCheckoutRateLimit(clientAddress(request));
  if (!rateLimit.allowed) {
    return NextResponse.json(
      { error: "Too many checkout attempts. Please wait a minute and try again." },
      { status: 429, headers: { "retry-after": String(rateLimit.retryAfterSeconds) } },
    );
  }

  const contentLength = Number(request.headers.get("content-length") ?? 0);
  if (Number.isFinite(contentLength) && contentLength > MAX_REQUEST_BYTES) {
    return NextResponse.json({ error: "Order request is too large" }, { status: 413 });
  }

  let orderNumber: string | undefined;
  let stripeSessionId: string | undefined;
  try {
    const raw = await request.text();
    if (Buffer.byteLength(raw, "utf8") > MAX_REQUEST_BYTES) {
      return NextResponse.json({ error: "Order request is too large" }, { status: 413 });
    }
    const input = JSON.parse(raw) as unknown;
    const databaseCatalogue = await getPublicCatalogueData();
    const order = validateCheckout(input, databaseCatalogue.products);
    if ((order.receiptPreference === "sms" || order.receiptPreference === "both") && !twilioConfigured()) {
      return NextResponse.json({ error: "SMS receipts are not configured yet. Choose email." }, { status: 503 });
    }
    orderNumber = await createPendingPaymentOrder(order, capacity);
    const session = await createStripeCheckout(order, orderNumber);
    stripeSessionId = session.id;
    await attachStripeSession(orderNumber, session.id);
    return NextResponse.json({ url: session.url, orderNumber });
  } catch (error) {
    if (stripeSessionId) await expireStripeSession(stripeSessionId).catch(() => undefined);
    if (orderNumber) await releasePendingPaymentOrder(orderNumber).catch(() => undefined);
    if (error instanceof CheckoutValidationError) {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    if (error instanceof DeliverySlotUnavailableError) {
      return NextResponse.json({ error: error.message }, { status: 409 });
    }
    if (error instanceof CheckoutTokenConflictError || error instanceof InventoryUnavailableError) {
      return NextResponse.json({ error: error.message }, { status: 409 });
    }
    console.error("Unable to create secure checkout", error);
    return NextResponse.json({ error: "Secure checkout is temporarily unavailable" }, { status: 503 });
  }
}

async function createStripeCheckout(
  order: ReturnType<typeof validateCheckout>,
  orderNumber: string,
): Promise<{ id: string; url: string }> {
  const baseUrl = validatedBaseUrl(process.env.APP_BASE_URL!);
  const form = new URLSearchParams({
    mode: "payment",
    success_url: `${baseUrl}/cart?payment=success&session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${baseUrl}/cart?payment=cancelled`,
    customer_email: order.customer.email,
    client_reference_id: orderNumber,
    "payment_method_types[0]": "card",
    "phone_number_collection[enabled]": "true",
    billing_address_collection: "required",
    "invoice_creation[enabled]": "true",
    "metadata[order_number]": orderNumber,
    "metadata[checkout_token]": order.checkoutToken,
    "metadata[delivery_method]": order.deliveryMethod,
    "metadata[delivery_slot]": order.deliverySlot,
    "metadata[receipt_preference]": order.receiptPreference,
    "payment_intent_data[metadata][order_number]": orderNumber,
    "payment_intent_data[metadata][delivery_method]": order.deliveryMethod,
    "payment_intent_data[application_fee_amount]": String(MAINTENANCE_FEE_CENTS),
    expires_at: String(Math.floor(Date.now() / 1000) + 30 * 60),
  });

  order.items.forEach((item, index) => {
    form.set(`line_items[${index}][quantity]`, String(item.quantity));
    form.set(`line_items[${index}][price_data][currency]`, "aud");
    form.set(`line_items[${index}][price_data][unit_amount]`, String(item.unitPriceCents));
    form.set(`line_items[${index}][price_data][tax_behavior]`, "inclusive");
    form.set(`line_items[${index}][price_data][product_data][name]`, item.productName);
  });
  if (order.deliveryFeeCents) {
    const index = order.items.length;
    form.set(`line_items[${index}][quantity]`, "1");
    form.set(`line_items[${index}][price_data][currency]`, "aud");
    form.set(`line_items[${index}][price_data][unit_amount]`, String(order.deliveryFeeCents));
    form.set(`line_items[${index}][price_data][tax_behavior]`, "inclusive");
    form.set(
      `line_items[${index}][price_data][product_data][name]`,
      order.deliveryMethod === "express" ? "Express delivery" : "Australia Post next-business-day dispatch",
    );
  }
  const maintenanceIndex = order.items.length + (order.deliveryFeeCents ? 1 : 0);
  form.set(`line_items[${maintenanceIndex}][quantity]`, "1");
  form.set(`line_items[${maintenanceIndex}][price_data][currency]`, "aud");
  form.set(`line_items[${maintenanceIndex}][price_data][unit_amount]`, String(order.maintenanceFeeCents));
  form.set(`line_items[${maintenanceIndex}][price_data][tax_behavior]`, "inclusive");
  form.set(`line_items[${maintenanceIndex}][price_data][product_data][name]`, "Order maintenance fee");

  const response = await fetch("https://api.stripe.com/v1/checkout/sessions", {
    method: "POST",
    signal: AbortSignal.timeout(20_000),
    headers: {
      authorization: `Bearer ${process.env.STRIPE_SECRET_KEY}`,
      "stripe-account": process.env.STRIPE_CONNECTED_ACCOUNT_ID!,
      "content-type": "application/x-www-form-urlencoded",
      "idempotency-key": `checkout/${orderNumber}/2`,
    },
    body: form,
  });
  const payload = await response.json() as { id?: string; url?: string; error?: { message?: string } };
  if (!response.ok || !payload.id || !payload.url) {
    throw new Error(payload.error?.message || "Payment provider rejected the checkout session");
  }
  return { id: payload.id, url: payload.url };
}

async function expireStripeSession(sessionId: string): Promise<void> {
  await fetch(`https://api.stripe.com/v1/checkout/sessions/${encodeURIComponent(sessionId)}/expire`, {
    method: "POST",
    signal: AbortSignal.timeout(20_000),
    headers: {
      authorization: `Bearer ${process.env.STRIPE_SECRET_KEY}`,
      "stripe-account": process.env.STRIPE_CONNECTED_ACCOUNT_ID!,
    },
  });
}

function validatedBaseUrl(value: string): string {
  const url = new URL(value);
  if (process.env.NODE_ENV === "production" && url.protocol !== "https:") {
    throw new Error("APP_BASE_URL must use HTTPS in production");
  }
  return url.origin;
}

function twilioConfigured(): boolean {
  return Boolean(
    process.env.TWILIO_ACCOUNT_SID &&
    process.env.TWILIO_AUTH_TOKEN &&
    (process.env.TWILIO_MESSAGING_SERVICE_SID || process.env.TWILIO_FROM_E164),
  );
}

function clientAddress(request: NextRequest): string {
  return request.headers.get("x-real-ip")?.trim()
    || request.headers.get("x-vercel-forwarded-for")?.split(",")[0]?.trim()
    || request.headers.get("x-forwarded-for")?.split(",").at(-1)?.trim()
    || "unknown";
}

function takeCheckoutRateLimit(key: string): { allowed: boolean; retryAfterSeconds: number } {
  const now = Date.now();
  if (rateBuckets.size >= 10_000) {
    for (const [bucketKey, bucket] of rateBuckets) {
      if (bucket.resetAt <= now) rateBuckets.delete(bucketKey);
    }
    if (rateBuckets.size >= 10_000 && !rateBuckets.has(key)) {
      const oldestKey = rateBuckets.keys().next().value as string | undefined;
      if (oldestKey) rateBuckets.delete(oldestKey);
    }
  }
  const current = rateBuckets.get(key);
  if (!current || current.resetAt <= now) {
    rateBuckets.set(key, { count: 1, resetAt: now + 60_000 });
    return { allowed: true, retryAfterSeconds: 0 };
  }
  if (current.count >= CHECKOUTS_PER_MINUTE) {
    return { allowed: false, retryAfterSeconds: Math.max(1, Math.ceil((current.resetAt - now) / 1000)) };
  }
  current.count += 1;
  return { allowed: true, retryAfterSeconds: 0 };
}
