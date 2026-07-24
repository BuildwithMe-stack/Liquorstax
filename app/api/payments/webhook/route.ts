import { createHmac, timingSafeEqual } from "node:crypto";
import { NextRequest, NextResponse } from "next/server";
import { confirmStripePayment, markOrderNotificationsSent, markStripeSessionUnavailable } from "@/lib/database";
import { sendPaidOrderNotifications } from "@/lib/notifications";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";
const MAX_WEBHOOK_BYTES = 512_000;

type StripeCheckoutSession = {
  id: string;
  payment_status?: string;
  amount_total?: number | null;
  currency?: string | null;
  payment_intent?: string | { id?: string } | null;
};

type StripeEvent = {
  id: string;
  type: string;
  account?: string;
  data?: { object?: StripeCheckoutSession };
};

export async function POST(request: NextRequest) {
  const secret = process.env.STRIPE_WEBHOOK_SECRET;
  if (!secret) return NextResponse.json({ error: "Webhook is not configured" }, { status: 503 });
  const connectedAccountId = process.env.STRIPE_CONNECTED_ACCOUNT_ID;
  if (!connectedAccountId) {
    return NextResponse.json({ error: "Connected-account webhook is not configured" }, { status: 503 });
  }
  const contentLength = Number(request.headers.get("content-length") ?? 0);
  if (Number.isFinite(contentLength) && contentLength > MAX_WEBHOOK_BYTES) {
    return NextResponse.json({ error: "Webhook payload is too large" }, { status: 413 });
  }
  const payload = await request.text();
  if (Buffer.byteLength(payload, "utf8") > MAX_WEBHOOK_BYTES) {
    return NextResponse.json({ error: "Webhook payload is too large" }, { status: 413 });
  }
  const signature = request.headers.get("stripe-signature");
  if (!signature || !verifyStripeSignature(payload, signature, secret)) {
    return NextResponse.json({ error: "Invalid webhook signature" }, { status: 400 });
  }

  let event: StripeEvent;
  try {
    event = JSON.parse(payload) as StripeEvent;
  } catch {
    return NextResponse.json({ error: "Invalid webhook payload" }, { status: 400 });
  }
  if (!event.account || event.account !== connectedAccountId) {
    return NextResponse.json({ error: "Unexpected connected account" }, { status: 400 });
  }

  try {
    if (event.type === "checkout.session.completed" || event.type === "checkout.session.async_payment_succeeded") {
      const session = event.data?.object;
      if (session?.id && session.payment_status === "paid") {
        const paymentIntentId = typeof session.payment_intent === "string"
          ? session.payment_intent
          : session.payment_intent?.id || "";
        if (!paymentIntentId) throw new Error("Paid Stripe session did not include a payment intent");
        const order = await confirmStripePayment(
          session.id,
          paymentIntentId,
          session.amount_total,
          session.currency,
        );
        if (order) {
          await sendPaidOrderNotifications(order);
          await markOrderNotificationsSent(order.orderNumber, order.notificationClaimToken);
        }
      }
    } else if (event.type === "checkout.session.expired") {
      const session = event.data?.object;
      if (session?.id) await markStripeSessionUnavailable(session.id, "payment_expired");
    } else if (event.type === "checkout.session.async_payment_failed") {
      const session = event.data?.object;
      if (session?.id) await markStripeSessionUnavailable(session.id, "payment_failed");
    }
  } catch (error) {
    // A non-2xx response asks Stripe to retry the signed event. Resend uses
    // stable idempotency keys, while the database keeps payment confirmation
    // idempotent across those retries.
    console.error("Payment webhook processing failed", error);
    return NextResponse.json({ error: "Webhook processing failed" }, { status: 503 });
  }

  return NextResponse.json({ received: true });
}

function verifyStripeSignature(payload: string, header: string, secret: string): boolean {
  const values = header.split(",").map((part) => part.trim().split("="));
  const timestamp = values.find(([key]) => key === "t")?.[1];
  const signatures = values.filter(([key]) => key === "v1").map(([, value]) => value);
  if (!timestamp || !signatures.length || !/^\d+$/.test(timestamp)) return false;
  const age = Math.abs(Math.floor(Date.now() / 1000) - Number(timestamp));
  if (age > 300) return false;
  const expected = createHmac("sha256", secret).update(`${timestamp}.${payload}`).digest("hex");
  const expectedBuffer = Buffer.from(expected, "hex");
  return signatures.some((signature) => {
    if (!/^[0-9a-f]{64}$/i.test(signature)) return false;
    const supplied = Buffer.from(signature, "hex");
    return supplied.length === expectedBuffer.length && timingSafeEqual(supplied, expectedBuffer);
  });
}
