import type { Metadata } from "next";
import { headers } from "next/headers";
import "./globals.css";

export async function generateMetadata(): Promise<Metadata> {
  const requestHeaders = await headers();
  const host = requestHeaders.get("x-forwarded-host") || requestHeaders.get("host") || "localhost:3000";
  const protocol = requestHeaders.get("x-forwarded-proto") || (host.includes("localhost") ? "http" : "https");
  const base = new URL(`${protocol}://${host}`);
  const image = new URL("/og-owner-sample.png", base).toString();
  return {
    metadataBase: base,
    title: { default: "Liquor Stax", template: "%s | Liquor Stax" },
    description: "Your Craigieburn local for offers, $10 flat-rate express delivery and normal Australia Post dispatch.",
    icons: {
      icon: "/brand/liquor-stax-craigieburn-logo.jpg",
      shortcut: "/brand/liquor-stax-craigieburn-logo.jpg",
      apple: "/brand/liquor-stax-craigieburn-logo.jpg",
    },
    openGraph: {
      title: "Liquor Stax Craigieburn — Your local shop, delivered your way.",
      description: "Browse local offers and choose express delivery or the next available Australia Post business-day dispatch.",
      type: "website",
      images: [{ url: image, width: 1731, height: 909, alt: "Liquor Stax Craigieburn — your local shop, delivered your way" }],
    },
    twitter: { card: "summary_large_image", title: "Liquor Stax Craigieburn", description: "Your local shop, delivered your way.", images: [image] },
  };
}

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en-AU">
      <body>{children}</body>
    </html>
  );
}
