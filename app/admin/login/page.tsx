import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { getAdminSession } from "../../../lib/admin-auth";

export const metadata: Metadata = {
  title: "Owner sign in",
  description: "Secure owner access for Liquor Stax store management.",
  robots: { index: false, follow: false },
};

export default async function AdminLoginPage() {
  if (await getAdminSession()) redirect("/admin");
  // The parent admin layout renders the login gate for every unauthenticated
  // admin URL, so protected pages never flash underneath the form.
  return null;
}
