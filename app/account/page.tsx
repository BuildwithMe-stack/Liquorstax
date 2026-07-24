import type { Metadata } from "next";
import Storefront from "../storefront";

export const metadata: Metadata = {
  title: "Account",
  description: "Manage your Liquor Stax profile, previous orders and receipt preferences.",
};

export default function AccountPage() {
  return <Storefront page="account" />;
}
