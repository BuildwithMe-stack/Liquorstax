import { createHmac, randomUUID, timingSafeEqual } from "node:crypto";
import { NextRequest, NextResponse } from "next/server";
import { CheckoutValidationError, validateCheckout } from "@/lib/checkout";
import { CATALOGUE_PREVIEW_ONLY, DEMO_ACCOUNT_OPENING_BALANCE_CENTS, products } from "@/lib/catalogue";
import { getPublicCatalogueData } from "@/lib/admin-data";

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
  lastMaintenanceFeeCents?: number;
  lastGstIncludedCents?: number;
  lastTotalCents?: number;
};

export async function GET(request: NextRequest) {
  if (!sampleCheckoutEnabled()) {
    return NextResponse.json({ error: "Sample checkout is disabled" }, { status: 404 });
  }
  return NextResponse.json({
    accountId: "owner-sample",
    balanceCents: readDemoState(request).balanceCents,
    mode: "demo",
  });
}

export async function POST(request: NextRequest) {
  // This endpoint can only create browser-local, zero-value sample orders. It
  // must never become an alternate path around Stripe when commerce is live.
  if (!sampleCheckoutEnabled()) {
    return NextResponse.json({ error: "Sample checkout is disabled" }, { status: 404 });
  }

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
    const databaseCatalogue = await getPublicCatalogueData();
    const dynamicIds = new Set(databaseCatalogue.products.map((product) => product.id));
    const order = validateCheckout(input, [
      ...products.filter((product) => !dynamicIds.has(product.id)),
      ...databaseCatalogue.products,
    ]);
    const demoState = readDemoState(request);
    if (demoState.lastCheckoutToken === order.checkoutToken && demoState.lastOrderNumber) {
      return NextResponse.json({
        orderNumber: demoState.lastOrderNumber,
        subtotalCents: demoState.lastSubtotalCents,
        deliveryFeeCents: demoState.lastDeliveryFeeCents,
        maintenanceFeeCents: demoState.lastMaintenanceFeeCents,
        gstIncludedCents: demoState.lastGstIncludedCents,
        totalCents: demoState.lastTotalCents,
        balanceCents: demoState.balanceCents,
        mode: "demo",
      });
    }
    if (demoState.balanceCents < order.totalCents) {
      return NextResponse.json({ error: "Insufficient sample credit" }, { status: 402 });
    }

    const orderNumber = createOrderNumber();
    const nextState: DemoAccountState = {
      balanceCents: demoState.balanceCents - order.totalCents,
      lastCheckoutToken: order.checkoutToken,
      lastOrderNumber: orderNumber,
      lastSubtotalCents: order.subtotalCents,
      lastDeliveryFeeCents: order.deliveryFeeCents,
      lastMaintenanceFeeCents: order.maintenanceFeeCents,
      lastGstIncludedCents: order.gstIncludedCents,
      lastTotalCents: order.totalCents,
    };
    const response = NextResponse.json({
      orderNumber,
      subtotalCents: order.subtotalCents,
      deliveryFeeCents: order.deliveryFeeCents,
      maintenanceFeeCents: order.maintenanceFeeCents,
      gstIncludedCents: order.gstIncludedCents,
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
  } catch (error) {
    if (error instanceof CheckoutValidationError) {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    console.error("Sample checkout failed", error);
    return NextResponse.json({ error: "Sample checkout is temporarily unavailable" }, { status: 503 });
  }
}

function sampleCheckoutEnabled(): boolean {
  return CATALOGUE_PREVIEW_ONLY && process.env.COMMERCE_LIVE !== "true";
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
  // This cookie protects only the zero-value owner sample. It is never read by
  // the live Stripe checkout path.
  const secret = process.env.DEMO_ACCOUNT_SECRET || "liquor-stax-preview-account";
  return createHmac("sha256", secret).update(payload).digest("base64url");
}

function createOrderNumber(): string {
  return `LS-${randomUUID().replaceAll("-", "").slice(0, 12).toUpperCase()}`;
}
