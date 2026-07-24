import { NextRequest, NextResponse } from "next/server";
import { CATALOGUE_PREVIEW_ONLY } from "@/lib/catalogue";
import { getPaymentSessionStatus, isDatabaseConfigured } from "@/lib/database";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET(request: NextRequest) {
  if (process.env.COMMERCE_LIVE !== "true" || CATALOGUE_PREVIEW_ONLY) {
    return NextResponse.json({ error: "Payment status is not available in sample mode" }, { status: 404 });
  }
  if (!isDatabaseConfigured()) {
    return NextResponse.json({ error: "Order status is temporarily unavailable" }, { status: 503 });
  }

  const sessionId = request.nextUrl.searchParams.get("session_id") || "";
  if (!/^cs_(?:test|live)_[A-Za-z0-9]{10,200}$/.test(sessionId)) {
    return NextResponse.json({ error: "Invalid payment session" }, { status: 400 });
  }

  try {
    const order = await getPaymentSessionStatus(sessionId);
    if (!order) return NextResponse.json({ error: "Order not found" }, { status: 404 });
    return NextResponse.json(order, { headers: { "cache-control": "no-store" } });
  } catch (error) {
    console.error("Unable to verify payment status", error);
    return NextResponse.json({ error: "Order status is temporarily unavailable" }, { status: 503 });
  }
}
