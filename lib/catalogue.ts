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
};

export const products: readonly Product[] = [
  { id: 1, name: "Yarra Valley Pinot Noir", category: "Wine", detail: "750mL · Victoria", priceCents: 2400, wasCents: 3000, badge: "Member price", tone: "berry", initials: "YV" },
  { id: 2, name: "Coastal Pale Ale", category: "Beer", detail: "6 pack · 375mL", priceCents: 2200, badge: "Staff pick", tone: "amber", initials: "CP" },
  { id: 3, name: "North Star Dry Gin", category: "Spirits", detail: "700mL · 40%", priceCents: 4900, wasCents: 5800, badge: "Save $9", tone: "ocean", initials: "NS" },
  { id: 4, name: "Limoncello Spritz", category: "Premix", detail: "4 pack · 250mL", priceCents: 1900, tone: "lemon", initials: "LS" },
  { id: 5, name: "Barossa Shiraz", category: "Wine", detail: "750mL · South Australia", priceCents: 1800, wasCents: 2300, badge: "Great value", tone: "plum", initials: "BS" },
  { id: 6, name: "Japanese Malt Whisky", category: "Spirits", detail: "700mL · 43%", priceCents: 7600, badge: "New arrival", tone: "gold", initials: "JM" },
  { id: 7, name: "Crisp Apple Cider", category: "Cider", detail: "10 pack · 330mL", priceCents: 2700, tone: "apple", initials: "AC" },
  { id: 8, name: "Zero Proof Aperitivo", category: "Zero alcohol", detail: "700mL · 0.0%", priceCents: 2900, badge: "0.0%", tone: "coral", initials: "ZP" },
];

export const categories = ["All", "Wine", "Beer", "Spirits", "Premix", "Cider", "Zero alcohol"] as const;

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
