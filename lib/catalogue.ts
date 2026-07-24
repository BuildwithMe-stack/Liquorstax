export type AlcoholType =
  | "Wine"
  | "Whisky"
  | "Bourbon"
  | "Premix"
  | "Vodka"
  | "Gin"
  | "Rum"
  | "Tequila"
  | "Beer"
  | "Cider"
  | "Sparkling"
  | "Liqueur"
  | "Non-alcoholic"
  | "Promotion";

export type ProductCollection =
  | "current-offers"
  | "member-offers"
  | "top-picks"
  | "catalogue"
  | "new";

export type ProductSticker = "NEW" | "SALE" | "MEMBER" | "PRICE DROP";

export type Product = {
  id: number;
  name: string;
  brand: string;
  category: string;
  alcoholType: AlcoholType;
  detail: string;
  priceCents: number;
  memberPriceCents?: number;
  wasCents?: number;
  badge?: string;
  stickers: readonly ProductSticker[];
  collections: readonly ProductCollection[];
  tone: string;
  initials: string;
  imageSrc: string;
  imageAlt: string;
  imagePosition?: string;
  imageScale?: number;
  imageTransformOrigin?: string;
  /** Server-sourced sellable units. Live checkout requires this value. */
  inventoryQuantity?: number;
  /** Category-only preview card. It must never be added to a live basket. */
  placeholder?: boolean;
};

export type StoreHighlight = {
  title: string;
  alcoholType: AlcoholType;
  detail: string;
  sticker?: ProductSticker;
  imageSrc: string;
  imageAlt: string;
};

export type OfferSlide = {
  id: string;
  eyebrow: string;
  title: string;
  copy: string;
  cta: string;
  href: string;
  imageSrc: string;
  imageAlt: string;
  tone: "lime" | "orange" | "cream";
};

// Preview is the safe default. This public build-time flag must be explicitly
// set to "false" alongside the server-side commerce flag before payments can
// be created. Keeping one source of truth also lets the interface label sample
// prices correctly in the browser.
export const CATALOGUE_PREVIEW_ONLY = process.env.NEXT_PUBLIC_CATALOGUE_PREVIEW_ONLY !== "false";

// These prices mirror archived Facebook offers and stay in preview mode until
// Liquor Stax confirms its current range, stock and selling prices.
export const products: readonly Product[] = [
  {
    id: 1,
    name: "Johnnie Walker Black Label",
    brand: "Johnnie Walker",
    category: "Spirits",
    alcoholType: "Whisky",
    detail: "700mL · 40% ABV",
    priceCents: 5499,
    memberPriceCents: 5499,
    wasCents: 5999,
    badge: "Page offer · Jun 2023",
    stickers: ["SALE", "MEMBER"],
    collections: ["current-offers", "member-offers", "top-picks", "catalogue"],
    tone: "gold",
    initials: "JW",
    imageSrc: "/catalogue/johnnie-walker-black-label.jpg",
    imageAlt: "Three bottles of Johnnie Walker Black Label at the Liquor Stax Craigieburn counter",
    imagePosition: "center 50%",
  },
  {
    id: 2,
    name: "Square & Circle Bourbon & Cola",
    brand: "Square & Circle",
    category: "Premix",
    alcoholType: "Bourbon",
    detail: "5 × 375mL Bourbon & Cola cans",
    priceCents: 1600,
    wasCents: 2000,
    badge: "Page offer · May 2023",
    stickers: ["PRICE DROP"],
    collections: ["current-offers", "top-picks", "catalogue"],
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
    brand: "Suntory",
    category: "Premix",
    alcoholType: "Premix",
    detail: "4 × mixed Double Grape / Double Lemon cans",
    priceCents: 1999,
    memberPriceCents: 1999,
    badge: "Page offer · Mar 2023",
    stickers: ["NEW", "MEMBER"],
    collections: ["member-offers", "top-picks", "catalogue", "new"],
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
    brand: "Suntory",
    category: "Premix",
    alcoholType: "Premix",
    detail: "2 × mixed 9% cans",
    priceCents: 1700,
    wasCents: 1900,
    badge: "Page offer · Mar 2023",
    stickers: ["SALE"],
    collections: ["current-offers", "catalogue"],
    tone: "ocean",
    initials: "SZ",
    imageSrc: "/catalogue/suntory-specials.jpg",
    imageAlt: "Suntory Strong Zero nine percent cans at Liquor Stax Craigieburn",
    imageScale: 2,
    imageTransformOrigin: "right bottom",
  },
  {
    id: 101,
    name: "Wine range coming soon",
    brand: "Liquor Stax",
    category: "Wine",
    alcoholType: "Wine",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "merlot",
    initials: "WI",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Wine category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 102,
    name: "Vodka range coming soon",
    brand: "Liquor Stax",
    category: "Vodka",
    alcoholType: "Vodka",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "ice",
    initials: "VO",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Vodka category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 103,
    name: "Gin range coming soon",
    brand: "Liquor Stax",
    category: "Gin",
    alcoholType: "Gin",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "botanical",
    initials: "GI",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Gin category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 104,
    name: "Rum range coming soon",
    brand: "Liquor Stax",
    category: "Rum",
    alcoholType: "Rum",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "molasses",
    initials: "RU",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Rum category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 105,
    name: "Tequila range coming soon",
    brand: "Liquor Stax",
    category: "Tequila",
    alcoholType: "Tequila",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "agave",
    initials: "TE",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Tequila category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 106,
    name: "Beer range coming soon",
    brand: "Liquor Stax",
    category: "Beer",
    alcoholType: "Beer",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "lager",
    initials: "BE",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Beer category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 107,
    name: "Cider range coming soon",
    brand: "Liquor Stax",
    category: "Cider",
    alcoholType: "Cider",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "apple",
    initials: "CI",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Cider category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 108,
    name: "Sparkling range coming soon",
    brand: "Liquor Stax",
    category: "Sparkling",
    alcoholType: "Sparkling",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "champagne",
    initials: "SP",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Sparkling wine category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 109,
    name: "Liqueur range coming soon",
    brand: "Liquor Stax",
    category: "Liqueur",
    alcoholType: "Liqueur",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "liqueur",
    initials: "LI",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Liqueur category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 110,
    name: "Non-alcoholic range coming soon",
    brand: "Liquor Stax",
    category: "Non-alcoholic",
    alcoholType: "Non-alcoholic",
    detail: "Unavailable preview · Stock list coming soon",
    priceCents: 0,
    badge: "Awaiting owner stock list",
    stickers: [],
    collections: ["catalogue"],
    tone: "mint",
    initials: "0%",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Non-alcoholic category placeholder awaiting the Liquor Stax stock list",
    placeholder: true,
  },
  {
    id: 111,
    name: "Promotion range coming soon",
    brand: "Liquor Stax",
    category: "Promotion",
    alcoholType: "Promotion",
    detail: "Unavailable preview · Daily offers will appear here",
    priceCents: 0,
    badge: "Awaiting owner offer",
    stickers: [],
    collections: ["catalogue"],
    tone: "lime",
    initials: "%",
    imageSrc: "/brand/liquor-stax-craigieburn-logo.jpg",
    imageAlt: "Promotion category placeholder awaiting a Liquor Stax daily offer",
    placeholder: true,
  },
];

export const storeHighlights: readonly StoreHighlight[] = [
  {
    title: "Bourbon & Coke Bundle",
    alcoholType: "Bourbon",
    detail: "Archived public page bundle · Ask in store for today’s price",
    sticker: "SALE",
    imageSrc: "/catalogue/bourbon-coke-bundle.jpg",
    imageAlt: "Bourbon bottles and Coca-Cola bundle offer at Liquor Stax Craigieburn",
  },
  {
    title: "Ratu 8 Signature Blend",
    alcoholType: "Rum",
    detail: "Eight-year blend · Ask in store for today’s price",
    sticker: "NEW",
    imageSrc: "/catalogue/ratu-8-signature-blend.jpg",
    imageAlt: "Three bottles of Ratu 8 Signature Blend at Liquor Stax Craigieburn",
  },
  {
    title: "Victoria Bitter VX",
    alcoholType: "Beer",
    detail: "4 × 250mL bottles · Ask in store for today’s price",
    imageSrc: "/catalogue/victoria-bitter-vx.jpg",
    imageAlt: "Victoria Bitter VX four packs displayed at Liquor Stax Craigieburn",
  },
  {
    title: "Pirate Bucket",
    alcoholType: "Promotion",
    detail: "In-store promotion · Ask the team about availability",
    sticker: "NEW",
    imageSrc: "/catalogue/pirate-bucket-promotion.jpg",
    imageAlt: "Liquor Stax Pirate Bucket in-store promotion",
  },
];

export const offerSlides: readonly OfferSlide[] = [
  {
    id: "local-stax",
    eyebrow: "Craigieburn’s local bottle shop",
    title: "The local Stax, delivered your way.",
    copy: "Choose a date and a two-hour delivery window up to seven days ahead.",
    cta: "Shop the catalogue",
    href: "/products",
    imageSrc: "/brand/liquor-stax-craigieburn-storefront.jpg",
    imageAlt: "Liquor Stax Craigieburn storefront",
    tone: "lime",
  },
  {
    id: "walker-offer",
    eyebrow: "Owner sample offer",
    title: "Keep walking with Johnnie Black.",
    copy: "Archived page offer shown for layout approval. Confirm price before launch.",
    cta: "View whisky",
    href: "/products?type=Whisky",
    imageSrc: "/catalogue/johnnie-walker-black-label.jpg",
    imageAlt: "Johnnie Walker Black Label offer at Liquor Stax Craigieburn",
    tone: "orange",
  },
  {
    id: "premix-offer",
    eyebrow: "Swipe into something new",
    title: "Cold premix favourites, ready to stack.",
    copy: "Explore Bourbon & Cola, Suntory -196 and Strong Zero from the shop floor.",
    cta: "Browse premix",
    href: "/products?type=Premix",
    imageSrc: "/catalogue/suntory-specials.jpg",
    imageAlt: "Suntory premix specials at Liquor Stax Craigieburn",
    tone: "cream",
  },
];

export const alcoholTypes: readonly AlcoholType[] = [
  "Wine",
  "Whisky",
  "Bourbon",
  "Premix",
  "Vodka",
  "Gin",
  "Rum",
  "Tequila",
  "Beer",
  "Cider",
  "Sparkling",
  "Liqueur",
  "Non-alcoholic",
  "Promotion",
];

export const categories = ["All", ...alcoholTypes] as const;

export const businessInfo = {
  name: "Liquor Stax Craigieburn",
  category: "Wine/spirits",
  address: "119 Highlander Dr, Craigieburn VIC 3064",
  dispatchAddress: "119 Highlander Dr, Craigieburn VIC 3064",
  facebookListedAddress: "Shop 3, 176 Elevation Bvd, Craigieburn VIC 3064",
  email: "liquorstaxconline@gmail.com",
  website: "http://www.astonliquorstax.com.au/",
  facebook: "https://www.facebook.com/liquorstaxcraigieburn",
  hours: [
    { days: "Monday – Thursday", hours: "10am – 9pm" },
    { days: "Friday – Saturday", hours: "10am – 10pm" },
    { days: "Sunday", hours: "11am – 8pm" },
  ],
  services: ["Delivery", "In-store collection", "In-store shopping"],
} as const;

export const DELIVERY_FEE_CENTS = 900;
export const AUSPOST_NEXT_DAY_PREVIEW_FEE_CENTS = 1_200;
export const AUSPOST_NEXT_DAY_DEFAULT_FEE_CENTS = AUSPOST_NEXT_DAY_PREVIEW_FEE_CENTS;
export const MAINTENANCE_FEE_CENTS = 99;
export const FREE_DELIVERY_THRESHOLD_CENTS = 10_000;
export const DEMO_ACCOUNT_OPENING_BALANCE_CENTS = 25_000;

export function formatAud(cents: number): string {
  return new Intl.NumberFormat("en-AU", {
    style: "currency",
    currency: "AUD",
  }).format(cents / 100);
}
