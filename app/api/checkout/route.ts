import { createHmac, randomUUID, timingSafeEqual } from "node:crypto";
import { NextRequest, NextResponse } from "next/server";
import { CheckoutValidationError, validateCheckout } from "@/lib/checkout";
import {
  InsufficientAccountCreditError,
  getAccountBalanceCents,
  isDatabaseConfigured,
  placeDatabaseOrder,
} from "@/lib/database";
import { DEMO_ACCOUNT_OPENING_BALANCE_CENTS } from "@/lib/catalogue";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const DEMO_BALANCE_COOKIE = "liquor_stax_demo_balance";
const MAX_REQUEST_BYTES = 32_000;

type DemoAccountState = {
  balanceCents: number;
  lastCheckoutToken?: string;
  lastOrderNumber?: string;
  lastSubtotalCents?: number;
  lastDeliveryFeeCents?: number;
  lastTotalCents?: number;
};

export async function GET(request: NextRequest) {
  if (!isDatabaseConfigured()) {
    return NextResponse.json({
      accountId: "stax-1001",
      balanceCents: readDemoState(request).balanceCents,
      mode: "demo",
    });
  }

  try {
    return NextResponse.json({
      accountId: "stax-1001",
      balanceCents: await getAccountBalanceCents(),
      mode: "database",
    });
  } catch (error) {
    console.error("Unable to load the customer account", error);
    return NextResponse.json({ error: "Account service is temporarily unavailable" }, { status: 503 });
  }
}

export async function POST(request: NextRequest) {
  const contentLength = Number(request.headers.get("content-length") ?? 0);
  if (Number.isFinite(contentLength) && contentLength > MAX_REQUEST_BYTES) {
    return NextResponse.json({ error: "Order request is too large" }, { status: 413 });
  }

  let input: unknown;
  try {
    const requestBody = await request.text();
    if (Buffer.byteLength(requestBody, "utf8") > MAX_REQUEST_BYTES) {
      return NextResponse.json({ error: "Order request is too large" }, { status: 413 });
    }
    input = JSON.parse(requestBody) as unknown;
  } catch {
    return NextResponse.json({ error: "Invalid order details" }, { status: 400 });
  }

  try {
    const order = validateCheckout(input);

    if (!isDatabaseConfigured()) {
      const demoState = readDemoState(request);
      if (demoState.lastCheckoutToken === order.checkoutToken && demoState.lastOrderNumber) {
        return NextResponse.json({
          orderNumber: demoState.lastOrderNumber,
          subtotalCents: demoState.lastSubtotalCents,
          deliveryFeeCents: demoState.lastDeliveryFeeCents,
          totalCents: demoState.lastTotalCents,
          balanceCents: demoState.balanceCents,
          mode: "demo",
        });
      }
      if (demoState.balanceCents < order.totalCents) {
        return NextResponse.json({ error: "Insufficient account credit" }, { status: 402 });
      }

      const orderNumber = createOrderNumber();
      const nextState: DemoAccountState = {
        balanceCents: demoState.balanceCents - order.totalCents,
        lastCheckoutToken: order.checkoutToken,
        lastOrderNumber: orderNumber,
        lastSubtotalCents: order.subtotalCents,
        lastDeliveryFeeCents: order.deliveryFeeCents,
        lastTotalCents: order.totalCents,
      };
      const response = NextResponse.json({
        orderNumber,
        subtotalCents: order.subtotalCents,
        deliveryFeeCents: order.deliveryFeeCents,
        totalCents: order.totalCents,
        balanceCents: nextState.balanceCents,
        mode: "demo",
      });
      response.cookies.set(DEMO_BALANCE_COOKIE, encodeDemoState(nextState), {
        httpOnly: true,
        maxAge: 60 * 60 * 24 * 30,
        path: "/",
        sameSite: "lax",
        secure: process.env.NODE_ENV === "production",
      });
      return response;
    }

    const result = await placeDatabaseOrder(order);
    return NextResponse.json({
      orderNumber: result.orderNumber,
      subtotalCents: order.subtotalCents,
      deliveryFeeCents: order.deliveryFeeCents,
      totalCents: order.totalCents,
      balanceCents: result.balanceCents,
      mode: "database",
    });
  } catch (error) {
    if (error instanceof CheckoutValidationError) {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    if (error instanceof InsufficientAccountCreditError) {
      return NextResponse.json({ error: error.message }, { status: 402 });
    }

    console.error("Checkout failed", error);
    return NextResponse.json({ error: "Account service is temporarily unavailable" }, { status: 503 });
  }
}

function readDemoState(request: NextRequest): DemoAccountState {
  const encoded = request.cookies.get(DEMO_BALANCE_COOKIE)?.value;
  if (!encoded) return { balanceCents: DEMO_ACCOUNT_OPENING_BALANCE_CENTS };

  const [payload, suppliedSignature] = encoded.split(".");
  const expectedSignature = signDemoPayload(payload ?? "");
  const supplied = Buffer.from(suppliedSignature ?? "");
  const expected = Buffer.from(expectedSignature);
  if (supplied.length !== expected.length || !timingSafeEqual(supplied, expected)) {
    return { balanceCents: DEMO_ACCOUNT_OPENING_BALANCE_CENTS };
  }

  try {
    const state = JSON.parse(Buffer.from(payload, "base64url").toString("utf8")) as DemoAccountState;
    if (
      !Number.isInteger(state.balanceCents) ||
      state.balanceCents < 0 ||
      state.balanceCents > DEMO_ACCOUNT_OPENING_BALANCE_CENTS
    ) {
      return { balanceCents: DEMO_ACCOUNT_OPENING_BALANCE_CENTS };
    }
    return state;
  } catch {
    return { balanceCents: DEMO_ACCOUNT_OPENING_BALANCE_CENTS };
  }
}

function encodeDemoState(state: DemoAccountState): string {
  const payload = Buffer.from(JSON.stringify(state)).toString("base64url");
  return `${payload}.${signDemoPayload(payload)}`;
}

function signDemoPayload(payload: string): string {
  // This cookie only protects the zero-value preview account. Real balances are
  // stored in Postgres whenever DATABASE_URL (or POSTGRES_URL) is configured.
  const secret = process.env.DEMO_ACCOUNT_SECRET || "liquor-stax-preview-account";
  return createHmac("sha256", secret).update(payload).digest("base64url");
}

function createOrderNumber(): string {
  return `LS-${randomUUID().replaceAll("-", "").slice(0, 12).toUpperCase()}`;
}
