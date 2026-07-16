import type { Metadata } from "next";
import Storefront from "./storefront";

export const metadata: Metadata = {
  title: "Liquor Stax — Drinks delivered on your time",
  description:
    "Shop Liquor Stax Craigieburn spirits, premix and local specials with scheduled delivery.",
};

export default function Home() {
  return <Storefront />;
}
