import type { Metadata } from "next";
import Storefront from "../storefront";

export const metadata: Metadata = {
  title: "About us",
  description: "Visit Liquor Stax Craigieburn at 119 Highlander Drive.",
};

export default function AboutPage() {
  return <Storefront page="about" />;
}
