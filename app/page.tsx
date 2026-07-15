import type { Metadata } from "next";
import Storefront from "./storefront";

export const metadata: Metadata = {
  title: "Liquor Stax — Drinks delivered on your time",
  description:
    "Shop wine, beer, spirits and premix with scheduled delivery across Melbourne.",
};

export default function Home() {
  return <Storefront />;
}
