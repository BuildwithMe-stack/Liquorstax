import type { Metadata } from "next";
import Storefront from "./storefront";

export const metadata: Metadata = {
  title: "Liquor Stax Craigieburn — Your local shop, delivered",
  description:
    "Browse local offers, member picks and the Liquor Stax Craigieburn catalogue with express delivery or Australia Post dispatch.",
};

export default function Home() {
  return <Storefront page="home" />;
}
