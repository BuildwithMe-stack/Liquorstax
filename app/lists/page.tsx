import type { Metadata } from "next";
import Storefront from "../storefront";

export const metadata: Metadata = {
  title: "My lists",
  description: "Save Liquor Stax favourites for your next order.",
};

export default function ListsPage() {
  return <Storefront page="lists" />;
}
