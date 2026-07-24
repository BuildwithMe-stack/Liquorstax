import { NextRequest, NextResponse } from "next/server";
import { getPublicCatalogueData } from "@/lib/admin-data";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const FEED_HEADERS = [
  "id",
  "title",
  "description",
  "availability",
  "condition",
  "price",
  "link",
  "image_link",
  "brand",
  "google_product_category",
  "custom_label_0",
] as const;

/**
 * A conservative Meta-style product feed. It deliberately contains only
 * sellable products that have an exact, locally hosted bottle image; the
 * CSS range artwork used in the storefront is not presented as product media.
 */
export async function GET(request: NextRequest) {
  try {
    const catalogue = await getPublicCatalogueData();
    const origin = catalogueOrigin(request);
    const rows = catalogue.products
      .filter((product) => (
        !product.placeholder
        && product.priceCents > 0
        && (product.inventoryQuantity ?? 0) > 0
        && Boolean(product.imageSrc)
        && !product.imageIsIllustrative
        && isSafeLocalImage(product.imageSrc)
      ))
      .map((product) => [
        String(product.id),
        product.name,
        `${product.brand} · ${product.detail}`,
        "in stock",
        "new",
        `${(product.priceCents / 100).toFixed(2)} AUD`,
        `${origin}/products?q=${encodeURIComponent(product.name)}`,
        `${origin}${product.imageSrc}`,
        product.brand,
        "Food, Beverages & Tobacco > Beverages > Alcoholic Beverages",
        "18+ only",
      ]);
    const csv = [FEED_HEADERS, ...rows]
      .map((row) => row.map(csvCell).join(","))
      .join("\r\n");

    return new NextResponse(`${csv}\r\n`, {
      headers: {
        "cache-control": "no-store",
        "content-disposition": "inline; filename=liquor-stax-facebook-catalogue.csv",
        "content-type": "text/csv; charset=utf-8",
      },
    });
  } catch (error) {
    console.error("Facebook catalogue feed failed", error);
    return NextResponse.json(
      { error: "The catalogue feed is temporarily unavailable" },
      { status: 503, headers: { "cache-control": "no-store" } },
    );
  }
}

function catalogueOrigin(request: NextRequest): string {
  const configured = process.env.APP_BASE_URL?.trim();
  if (configured) {
    try {
      const url = new URL(configured);
      if (url.protocol === "https:" || url.protocol === "http:") return url.origin;
    } catch {
      // The request origin is an acceptable preview fallback.
    }
  }
  return request.nextUrl.origin;
}

function isSafeLocalImage(value: string): boolean {
  return /^\/catalogue\/stock\/[A-Za-z0-9._-]+$/.test(value);
}

function csvCell(value: string): string {
  const clean = /^[=+\-@]/.test(value) ? `'${value}` : value;
  return `"${clean.replaceAll('"', '""')}"`;
}
