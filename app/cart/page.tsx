import type { Metadata } from "next";
import Storefront from "../storefront";

export const metadata: Metadata = {
  title: "Cart & delivery",
  description: "Review your cart, select a delivery window and continue to secure payment.",
};

export default function CartPage() {
  return <Storefront page="cart" />;
}
