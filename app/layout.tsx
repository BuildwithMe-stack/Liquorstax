import type { Metadata } from "next";
import { headers } from "next/headers";
import "./globals.css";

export async function generateMetadata(): Promise<Metadata> {
  const requestHeaders = await headers();
  const host = requestHeaders.get("x-forwarded-host") || requestHeaders.get("host") || "localhost:3000";
  const protocol = requestHeaders.get("x-forwarded-proto") || (host.includes("localhost") ? "http" : "https");
  const base = new URL(`${protocol}://${host}`);
  const image = new URL("/brand/liquor-stax-craigieburn-storefront.jpg", base).toString();
  return {
    metadataBase: base,
    title: { default: "Liquor Stax", template: "%s | Liquor Stax" },
    description: "Liquor Stax Craigieburn specials delivered on your time.",
    icons: {
      icon: "/brand/liquor-stax-craigieburn-logo.jpg",
      shortcut: "/brand/liquor-stax-craigieburn-logo.jpg",
      apple: "/brand/liquor-stax-craigieburn-logo.jpg",
    },
    openGraph: {
      title: "Liquor Stax — Good drinks. Great timing.",
      description: "Shop spirits, premix and local specials with scheduled delivery.",
      type: "website",
      images: [{ url: image, width: 2048, height: 1536, alt: "Liquor Stax Craigieburn storefront" }],
    },
    twitter: { card: "summary_large_image", title: "Liquor Stax", description: "Good drinks delivered on your time.", images: [image] },
  };
}

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en-AU">
      <body>{children}</body>
    </html>
  );
}
