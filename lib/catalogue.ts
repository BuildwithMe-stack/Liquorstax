export type Product = {
  id: number;
  name: string;
  category: string;
  detail: string;
  priceCents: number;
  wasCents?: number;
  badge?: string;
  tone: string;
  initials: string;
  imageSrc: string;
  imageAlt: string;
  imagePosition?: string;
  imageScale?: number;
  imageTransformOrigin?: string;
};

export type StoreHighlight = {
  title: string;
  detail: string;
  imageSrc: string;
  imageAlt: string;
};

export const CATALOGUE_PREVIEW_ONLY = true;

// These catalogue prices mirror archived offers published with the Facebook
// photos. They remain demo-only until the store confirms current pricing.
export const products: readonly Product[] = [
  {
    id: 1,
    name: "Johnnie Walker Black Label",
    category: "Spirits",
    detail: "700mL · 40% ABV",
    priceCents: 5499,
    wasCents: 5999,
    badge: "Page offer · Jun 2023",
    tone: "gold",
    initials: "JW",
    imageSrc: "/catalogue/johnnie-walker-black-label.jpg",
    imageAlt: "Three bottles of Johnnie Walker Black Label at the Liquor Stax Craigieburn counter",
    imagePosition: "center 50%",
  },
  {
    id: 2,
    name: "Square & Circle Bourbon & Cola",
    category: "Premix",
    detail: "5 × 375mL Bourbon & Cola cans",
    priceCents: 1600,
    badge: "Page offer · May 2023",
    tone: "coral",
    initials: "SC",
    imageSrc: "/catalogue/square-circle-bourbon-cola.jpg",
    imageAlt: "Square and Circle Bourbon and Cola cans displayed at Liquor Stax Craigieburn",
    imageScale: 1.75,
    imageTransformOrigin: "center bottom",
  },
  {
    id: 3,
    name: "Suntory -196 Mixed 4 Pack",
    category: "Premix",
    detail: "4 × mixed Double Grape / Double Lemon cans",
    priceCents: 1999,
    badge: "Page offer · Mar 2023",
    tone: "lemon",
    initials: "196",
    imageSrc: "/catalogue/suntory-specials.jpg",
    imageAlt: "Suntory minus 196 Double Grape and Double Lemon packs at Liquor Stax Craigieburn",
    imageScale: 2,
    imageTransformOrigin: "left bottom",
  },
  {
    id: 4,
    name: "Suntory Strong Zero Mixed 2 Pack",
    category: "Premix",
    detail: "2 × mixed 9% cans",
    priceCents: 1700,
    badge: "Page offer · Mar 2023",
    tone: "ocean",
    initials: "SZ",
    imageSrc: "/catalogue/suntory-specials.jpg",
    imageAlt: "Suntory Strong Zero nine percent cans at Liquor Stax Craigieburn",
    imageScale: 2,
    imageTransformOrigin: "right bottom",
  },
];

export const storeHighlights: readonly StoreHighlight[] = [
  {
    title: "Bourbon & Coke Bundle",
    detail: "Archived public page bundle · Ask in store for current price",
    imageSrc: "/catalogue/bourbon-coke-bundle.jpg",
    imageAlt: "Bourbon bottles and Coca-Cola bundle offer at Liquor Stax Craigieburn",
  },
  {
    title: "Ratu 8 Signature Blend",
    detail: "Eight-year blend · Ask in store for current price",
    imageSrc: "/catalogue/ratu-8-signature-blend.jpg",
    imageAlt: "Three bottles of Ratu 8 Signature Blend at Liquor Stax Craigieburn",
  },
  {
    title: "Victoria Bitter VX",
    detail: "4 × 250mL bottles · Ask in store for current price",
    imageSrc: "/catalogue/victoria-bitter-vx.jpg",
    imageAlt: "Victoria Bitter VX four packs displayed at Liquor Stax Craigieburn",
  },
  {
    title: "Pirate Bucket",
    detail: "In-store promotion · While stock lasts",
    imageSrc: "/catalogue/pirate-bucket-promotion.jpg",
    imageAlt: "Liquor Stax Pirate Bucket in-store promotion",
  },
];

export const categories = ["All", "Spirits", "Premix"] as const;

export const deliverySlots = [
  "Today · 6–8pm",
  "Tomorrow · 10am–12pm",
  "Tomorrow · 4–6pm",
] as const;

export const DELIVERY_FEE_CENTS = 900;
export const FREE_DELIVERY_THRESHOLD_CENTS = 10_000;
export const DEMO_ACCOUNT_OPENING_BALANCE_CENTS = 25_000;

export function formatAud(cents: number): string {
  return new Intl.NumberFormat("en-AU", {
    style: "currency",
    currency: "AUD",
  }).format(cents / 100);
}
