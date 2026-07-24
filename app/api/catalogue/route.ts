import { NextResponse } from "next/server";
import { getPublicCatalogueData } from "../../../lib/admin-data";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  try {
    const data = await getPublicCatalogueData();
    // Source IDs are useful only for server-side stock merges. Do not expose
    // supplier/export identifiers in the public catalogue response.
    const publicData = {
      ...data,
      products: data.products.map(({ sourceProductId: _sourceProductId, ...product }) => product),
    };
    return NextResponse.json(publicData, {
      headers: {
        "cache-control": "public, s-maxage=30, stale-while-revalidate=120",
      },
    });
  } catch (error) {
    console.error("Public catalogue request failed", error);
    return NextResponse.json(
      { error: "The current catalogue is temporarily unavailable" },
      { status: 503, headers: { "cache-control": "no-store" } },
    );
  }
}
