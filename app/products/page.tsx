import type { Metadata } from "next";
import { alcoholTypes } from "../../lib/catalogue";
import Storefront from "../storefront";

export const metadata: Metadata = {
  title: "Products",
  description: "Browse Liquor Stax products by wine, whisky, premix, spirits, beer, cider and promotions.",
};

export default async function ProductsPage({
  searchParams,
}: {
  searchParams: Promise<{ type?: string | string[]; q?: string | string[]; offer?: string | string[] }>;
}) {
  const params = await searchParams;
  const rawType = Array.isArray(params.type) ? params.type[0] : params.type;
  const query = Array.isArray(params.q) ? params.q[0] : params.q;
  const offer = Array.isArray(params.offer) ? params.offer[0] : params.offer;
  const type = rawType && (alcoholTypes as readonly string[]).includes(rawType) ? rawType : "All";
  return (
    <Storefront
      page="products"
      initialProductType={type}
      initialProductQuery={(query || "").slice(0, 100)}
      initialSaleOnly={offer === "sale"}
    />
  );
}
