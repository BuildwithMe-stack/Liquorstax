import { neon, type NeonQueryFunction } from "@neondatabase/serverless";
import {
  alcoholTypes,
  type AlcoholType,
  type OfferSlide,
  type Product,
  type ProductCollection,
  type ProductSticker,
} from "./catalogue";
import { melbourneTodayIsoDate } from "./delivery";
import { stockCatalogueProducts } from "./stock-catalogue";

let client: NeonQueryFunction<false, false> | undefined;
let schemaPromise: Promise<void> | undefined;

export type AdminProduct = {
  id: number;
  name: string;
  alcoholType: AlcoholType;
  description: string;
  volumeLabel: string;
  priceCents: number | null;
  inventoryQuantity: number | null;
  imageUrl: string;
  active: boolean;
  placeholder: boolean;
  isNew: boolean;
  onSale: boolean;
  memberOffer: boolean;
  shopfrontProductId: string;
};

export type AdminOffer = {
  id: number;
  title: string;
  description: string;
  eyebrow: string;
  imageUrl: string;
  linkUrl: string;
  startsAt: string;
  endsAt: string;
  active: boolean;
  sortOrder: number;
};

export type AustraliaPostReportRow = {
  orderNumber: string;
  customerName: string;
  customerPhone: string;
  customerEmail: string;
  address: string;
  instructions: string;
  totalCents: number;
  items: Array<{ productName: string; quantity: number }>;
};

export function isAdminDatabaseConfigured(): boolean {
  return Boolean(databaseUrl());
}

export async function getAdminProducts(): Promise<AdminProduct[]> {
  if (!isAdminDatabaseConfigured()) return [];
  await ensureAdminSchema();
  const rows = await getClient()`
    SELECT id, name, alcohol_type, description, volume_label, price_cents,
      inventory_quantity, image_url, is_active, is_placeholder, is_new,
      is_on_sale, is_member_offer, shopfront_product_id
    FROM store_products
    ORDER BY updated_at DESC, id DESC
    LIMIT 250
  `;
  return rows.flatMap(toAdminProduct);
}

export async function getAdminOffers(): Promise<AdminOffer[]> {
  if (!isAdminDatabaseConfigured()) return [];
  await ensureAdminSchema();
  const rows = await getClient()`
    SELECT id, title, description, eyebrow, image_url, link_url,
      starts_at, ends_at, is_active, sort_order
    FROM daily_offers
    ORDER BY starts_at DESC, sort_order ASC, id DESC
    LIMIT 100
  `;
  return rows.flatMap(toAdminOffer);
}

export async function createAdminProduct(input: {
  name: string;
  alcoholType: AlcoholType;
  description: string;
  volumeLabel: string;
  priceCents: number | null;
  inventoryQuantity: number | null;
  imageUrl: string;
  placeholder: boolean;
    isNew: boolean;
    onSale: boolean;
    memberOffer: boolean;
}): Promise<void> {
  await ensureAdminSchema();
  const slug = `${slugify(input.name)}-${Date.now().toString(36)}`;
  await getClient()`
    INSERT INTO store_products (
      source, name, slug, alcohol_type, description, image_url, volume_label,
      price_cents, inventory_quantity, is_active, is_placeholder, is_new, is_on_sale,
      is_member_offer
    ) VALUES (
      'manual', ${input.name}, ${slug}, ${input.alcoholType}, ${input.description},
      ${input.imageUrl || null}, ${input.volumeLabel || null}, ${input.priceCents},
      ${input.inventoryQuantity}, true, ${input.placeholder}, ${input.isNew}, ${input.onSale},
      ${input.memberOffer}
    )
  `;
}

export async function createAdminOffer(input: {
  title: string;
  description: string;
  eyebrow: string;
  imageUrl: string;
  linkUrl: string;
  startsAt: Date;
  endsAt: Date;
  sortOrder: number;
}): Promise<void> {
  await ensureAdminSchema();
  await getClient()`
    INSERT INTO daily_offers (
      title, description, eyebrow, image_url, link_url, starts_at, ends_at,
      sort_order, is_active
    ) VALUES (
      ${input.title}, ${input.description}, ${input.eyebrow},
      ${input.imageUrl || null}, ${input.linkUrl || '/products'},
      ${input.startsAt.toISOString()}, ${input.endsAt.toISOString()},
      ${input.sortOrder}, true
    )
  `;
}

export async function getPublicCatalogueData(): Promise<{
  products: Product[];
  offers: OfferSlide[];
}> {
  if (!isAdminDatabaseConfigured()) {
    if (process.env.COMMERCE_LIVE === "true") throw new Error("The live catalogue database is not configured");
    return { products: [...stockCatalogueProducts], offers: [] };
  }
  try {
    await ensureAdminSchema();
    const sql = getClient();
    const [productRows, offerRows] = await Promise.all([
      sql`
        SELECT id, source_product_id, name, alcohol_type, description, volume_label, price_cents,
          inventory_quantity, image_url, is_placeholder, is_new, is_on_sale,
          is_member_offer
        FROM store_products
        WHERE is_active = true
        ORDER BY is_on_sale DESC, is_new DESC, updated_at DESC, id DESC
        LIMIT 1500
      `,
      sql`
        SELECT id, title, description, eyebrow, image_url, link_url
        FROM daily_offers
        WHERE is_active = true AND starts_at <= now() AND ends_at > now()
        ORDER BY sort_order ASC, starts_at DESC, id DESC
        LIMIT 10
      `,
    ]);
    const databaseProducts = productRows.flatMap(toPublicProduct);
    return {
      products: process.env.COMMERCE_LIVE === "true"
        ? databaseProducts
        : mergePreviewCatalogue(databaseProducts),
      offers: offerRows.flatMap(toPublicOffer),
    };
  } catch (error) {
    console.error("Unable to load the database catalogue", error);
    if (process.env.COMMERCE_LIVE === "true") throw error;
    return { products: [...stockCatalogueProducts], offers: [] };
  }
}

export async function getAustraliaPostReport(
  deliveryDate = melbourneTodayIsoDate(),
): Promise<AustraliaPostReportRow[]> {
  if (!isAdminDatabaseConfigured()) return [];
  await ensureAdminSchema();
  const rows = await getClient()`
    SELECT
      orders.order_number,
      orders.customer_name,
      orders.customer_phone,
      orders.customer_email,
      orders.delivery_address,
      orders.delivery_instructions,
      orders.total_cents,
      COALESCE(
        json_agg(
          json_build_object(
            'productName', order_items.product_name,
            'quantity', order_items.quantity
          ) ORDER BY order_items.id
        ) FILTER (WHERE order_items.id IS NOT NULL),
        '[]'::json
      ) AS items
    FROM orders
    LEFT JOIN order_items ON order_items.order_number = orders.order_number
    WHERE orders.delivery_method = 'normal'
      AND orders.delivery_date = ${deliveryDate}
      AND orders.status = 'paid'
    GROUP BY orders.id
    ORDER BY orders.created_at ASC
  `;
  return rows.flatMap((row) => {
    const value = row as Record<string, unknown>;
    if (typeof value.order_number !== "string") return [];
    return [{
      orderNumber: value.order_number,
      customerName: String(value.customer_name ?? ""),
      customerPhone: String(value.customer_phone ?? ""),
      customerEmail: String(value.customer_email ?? ""),
      address: String(value.delivery_address ?? ""),
      instructions: String(value.delivery_instructions ?? ""),
      totalCents: Number(value.total_cents ?? 0),
      items: Array.isArray(value.items)
        ? value.items.flatMap((item) => isRecord(item) && typeof item.productName === "string"
          ? [{ productName: item.productName, quantity: Number(item.quantity ?? 0) }]
          : [])
        : [],
    }];
  });
}

export function isValidAustraliaPostReportDate(value: unknown): value is string {
  if (typeof value !== "string" || !/^\d{4}-\d{2}-\d{2}$/.test(value)) return false;
  const date = new Date(`${value}T00:00:00.000Z`);
  return !Number.isNaN(date.getTime()) && date.toISOString().slice(0, 10) === value;
}

export async function isAustraliaPostReportComplete(
  deliveryDate: string,
  recipientEmail: string,
): Promise<boolean> {
  await ensureAdminSchema();
  const rows = await getClient()`
    SELECT 1
    FROM daily_report_runs
    WHERE report_type = 'auspost_next_business_day'
      AND delivery_date = ${deliveryDate}
      AND recipient_email = ${recipientEmail}
      AND completed_at IS NOT NULL
    LIMIT 1
  `;
  return rows.length > 0;
}

export async function queueAustraliaPostReport(
  deliveryDate: string,
  recipientEmail: string,
): Promise<void> {
  await ensureAdminSchema();
  await getClient()`
    INSERT INTO daily_report_runs (
      report_type, delivery_date, recipient_email, order_count, sent_at, completed_at
    ) VALUES (
      'auspost_next_business_day', ${deliveryDate}, ${recipientEmail}, 0, now(), NULL
    )
    ON CONFLICT (report_type, delivery_date, recipient_email) DO NOTHING
  `;
}

export async function getPendingAustraliaPostReportDates(
  recipientEmail: string,
): Promise<string[]> {
  await ensureAdminSchema();
  const rows = await getClient()`
    SELECT delivery_date::text AS delivery_date
    FROM daily_report_runs
    WHERE report_type = 'auspost_next_business_day'
      AND recipient_email = ${recipientEmail}
      AND completed_at IS NULL
    ORDER BY delivery_date ASC
    LIMIT 14
  `;
  return rows.flatMap((row) => {
    const value = (row as { delivery_date?: unknown }).delivery_date;
    return typeof value === "string" && isValidAustraliaPostReportDate(value) ? [value] : [];
  });
}

export async function completeAustraliaPostReport(
  deliveryDate: string,
  recipientEmail: string,
  orderCount: number,
): Promise<void> {
  await ensureAdminSchema();
  await getClient()`
    INSERT INTO daily_report_runs (
      report_type, delivery_date, recipient_email, order_count, sent_at, completed_at
    ) VALUES (
      'auspost_next_business_day', ${deliveryDate}, ${recipientEmail}, ${orderCount}, now(), now()
    )
    ON CONFLICT (report_type, delivery_date, recipient_email) DO UPDATE
    SET order_count = EXCLUDED.order_count,
      sent_at = EXCLUDED.sent_at,
      completed_at = EXCLUDED.completed_at
  `;
}

async function ensureAdminSchema(): Promise<void> {
  if (!schemaPromise) {
    schemaPromise = initializeAdminSchema().catch((error) => {
      schemaPromise = undefined;
      throw error;
    });
  }
  await schemaPromise;
}

async function initializeAdminSchema(): Promise<void> {
  const sql = getClient();
  await sql.transaction((transaction) => [
    transaction`SELECT pg_advisory_xact_lock(506782642)`,
    transaction`
      CREATE TABLE IF NOT EXISTS store_products (
        id integer GENERATED BY DEFAULT AS IDENTITY (START WITH 10000) PRIMARY KEY,
        source text NOT NULL DEFAULT 'manual',
        source_product_id text,
        shopfront_product_id text,
        shopfront_variant_id text,
        sku text,
        name text NOT NULL,
        slug text NOT NULL UNIQUE,
        alcohol_type text NOT NULL,
        description text NOT NULL DEFAULT '',
        image_url text,
        volume_label text,
        price_cents integer,
        compare_at_price_cents integer,
        inventory_quantity integer,
        currency char(3) NOT NULL DEFAULT 'AUD',
        is_active boolean NOT NULL DEFAULT true,
        is_placeholder boolean NOT NULL DEFAULT false,
        is_new boolean NOT NULL DEFAULT false,
        is_on_sale boolean NOT NULL DEFAULT false,
        is_member_offer boolean NOT NULL DEFAULT false,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now()
      )
    `,
    transaction`
      ALTER TABLE store_products
      ADD COLUMN IF NOT EXISTS is_member_offer boolean NOT NULL DEFAULT false
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS daily_offers (
        id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        product_id integer REFERENCES store_products(id) ON DELETE SET NULL,
        shopfront_promotion_id text,
        title text NOT NULL,
        description text NOT NULL DEFAULT '',
        eyebrow text NOT NULL DEFAULT 'DAILY OFFER',
        image_url text,
        link_url text,
        badge text,
        starts_at timestamptz NOT NULL,
        ends_at timestamptz NOT NULL,
        sort_order integer NOT NULL DEFAULT 0,
        is_active boolean NOT NULL DEFAULT true,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now()
      )
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS daily_report_runs (
        id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        report_type text NOT NULL DEFAULT 'auspost_next_business_day',
        delivery_date date NOT NULL,
        recipient_email text NOT NULL,
        order_count integer NOT NULL DEFAULT 0,
        sent_at timestamptz NOT NULL DEFAULT now(),
        completed_at timestamptz,
        UNIQUE (report_type, delivery_date, recipient_email)
      )
    `,
    transaction`
      ALTER TABLE daily_report_runs
      ADD COLUMN IF NOT EXISTS completed_at timestamptz
    `,
  ]);
}

function toAdminProduct(row: unknown): AdminProduct[] {
  if (!isRecord(row) || !Number.isInteger(Number(row.id))) return [];
  const alcoholType = validAlcoholType(row.alcohol_type);
  if (!alcoholType) return [];
  return [{
    id: Number(row.id),
    name: String(row.name ?? ""),
    alcoholType,
    description: String(row.description ?? ""),
    volumeLabel: String(row.volume_label ?? ""),
    priceCents: row.price_cents === null ? null : Number(row.price_cents),
    inventoryQuantity: row.inventory_quantity === null ? null : Number(row.inventory_quantity),
    imageUrl: String(row.image_url ?? ""),
    active: row.is_active === true,
    placeholder: row.is_placeholder === true,
    isNew: row.is_new === true,
    onSale: row.is_on_sale === true,
    memberOffer: row.is_member_offer === true,
    shopfrontProductId: String(row.shopfront_product_id ?? ""),
  }];
}

function toAdminOffer(row: unknown): AdminOffer[] {
  if (!isRecord(row) || !Number.isInteger(Number(row.id))) return [];
  return [{
    id: Number(row.id),
    title: String(row.title ?? ""),
    description: String(row.description ?? ""),
    eyebrow: String(row.eyebrow ?? "DAILY OFFER"),
    imageUrl: String(row.image_url ?? ""),
    linkUrl: String(row.link_url ?? "/products"),
    startsAt: new Date(String(row.starts_at)).toISOString(),
    endsAt: new Date(String(row.ends_at)).toISOString(),
    active: row.is_active === true,
    sortOrder: Number(row.sort_order ?? 0),
  }];
}

function toPublicProduct(row: unknown): Product[] {
  if (!isRecord(row) || !Number.isInteger(Number(row.id))) return [];
  const alcoholType = validAlcoholType(row.alcohol_type);
  if (!alcoholType) return [];
  const isNew = row.is_new === true;
  const onSale = row.is_on_sale === true;
  const memberOffer = row.is_member_offer === true;
  const inventoryQuantity = row.inventory_quantity === null || row.inventory_quantity === undefined
    ? undefined
    : Number(row.inventory_quantity);
  const hasSellableInventory = typeof inventoryQuantity === "number"
    && Number.isInteger(inventoryQuantity)
    && inventoryQuantity > 0;
  const placeholder = row.is_placeholder === true
    || Number(row.price_cents ?? 0) < 1
    || !hasSellableInventory;
  const stickers: ProductSticker[] = [
    ...(isNew ? ["NEW" as const] : []),
    ...(onSale ? ["SALE" as const] : []),
    ...(memberOffer ? ["MEMBER" as const] : []),
  ];
  const collections: ProductCollection[] = [
    "catalogue",
    ...(onSale ? ["current-offers" as const] : []),
    ...(memberOffer ? ["member-offers" as const] : []),
    ...(isNew ? ["new" as const, "top-picks" as const] : []),
  ];
  const name = String(row.name ?? "Product");
  const image = safeLocalImage(String(row.image_url ?? ""), "");
  return [{
    id: Number(row.id),
    sourceProductId: typeof row.source_product_id === "string" && row.source_product_id.trim()
      ? row.source_product_id.trim()
      : undefined,
    name,
    brand: "Liquor Stax",
    category: alcoholType,
    alcoholType,
    detail: [String(row.volume_label ?? ""), String(row.description ?? "")].filter(Boolean).join(" · ") || "Store product",
    priceCents: placeholder ? 0 : Number(row.price_cents),
    stickers,
    collections,
    tone: "forest",
    initials: name.split(/\s+/).slice(0, 2).map((part) => part[0]?.toUpperCase()).join(""),
    imageSrc: image,
    imageAlt: `${name} at Liquor Stax Craigieburn`,
    imageIsIllustrative: !image,
    inventoryQuantity,
    placeholder,
  }];
}

function mergePreviewCatalogue(databaseProducts: Product[]): Product[] {
  const databaseSourceIds = new Set(
    databaseProducts.flatMap((product) => product.sourceProductId ? [product.sourceProductId] : []),
  );
  return [
    ...stockCatalogueProducts.filter((product) => !databaseSourceIds.has(product.sourceProductId ?? "")),
    ...databaseProducts,
  ];
}

function toPublicOffer(row: unknown): OfferSlide[] {
  if (!isRecord(row) || !Number.isInteger(Number(row.id))) return [];
  const title = String(row.title ?? "").trim();
  if (!title) return [];
  return [{
    id: `daily-${Number(row.id)}`,
    eyebrow: String(row.eyebrow ?? "DAILY OFFER"),
    title,
    copy: String(row.description ?? "Today at Liquor Stax."),
    cta: "View offer",
    href: safeInternalLink(String(row.link_url ?? "/products")),
    imageSrc: safeLocalImage(String(row.image_url ?? ""), "/brand/liquor-stax-craigieburn-storefront.jpg"),
    imageAlt: `${title} daily offer at Liquor Stax Craigieburn`,
    tone: "lime",
  }];
}

function validAlcoholType(value: unknown): AlcoholType | undefined {
  return typeof value === "string" && (alcoholTypes as readonly string[]).includes(value)
    ? value as AlcoholType
    : undefined;
}

function safeLocalImage(value: string, fallback = "/brand/liquor-stax-craigieburn-logo.jpg"): string {
  return /^\/[A-Za-z0-9/_.,@()-]+$/.test(value) ? value : fallback;
}

function safeInternalLink(value: string): string {
  return /^\/(?!\/)[A-Za-z0-9/?&=_%+.-]*$/.test(value) ? value : "/products";
}

function slugify(value: string): string {
  return value.toLowerCase().normalize("NFKD").replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 70) || "product";
}

function getClient(): NeonQueryFunction<false, false> {
  const url = databaseUrl();
  if (!url) throw new Error("DATABASE_URL is not configured");
  client ??= neon(url);
  return client;
}

function databaseUrl(): string | undefined {
  return process.env.DATABASE_URL || process.env.POSTGRES_URL;
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}
