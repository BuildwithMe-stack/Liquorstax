import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const projectRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const inputPath = resolve(projectRoot, "data/stock-catalogue.json");
const outputDirectory = resolve(projectRoot, "db/seeds");
const outputPath = resolve(outputDirectory, "stock-catalogue.sql");
const source = JSON.parse(await readFile(inputPath, "utf8"));

if (!Array.isArray(source.products) || !source.products.length) {
  throw new Error("Run pnpm stock:import with the supplied CSV before generating the database seed");
}

const statements = source.products.map((product) => {
  if (!validProduct(product)) throw new Error("The generated stock catalogue contains an invalid product");
  const exactImage = product.imageIsIllustrative ? null : product.imageSrc;
  const sourceId = String(product.sourceId);
  const values = [
    "manual",
    sourceId,
    `stock-${sourceId}`,
    product.name,
    `stock-${sourceId}`,
    product.alcoholType,
    "Imported owner stock list",
    exactImage,
    product.detail,
    product.priceCents,
    product.inventoryQuantity,
  ].map(sqlLiteral);
  return `INSERT INTO store_products (\n  source, source_product_id, sku, name, slug, alcohol_type, description,\n  image_url, volume_label, price_cents, inventory_quantity,\n  is_active, is_placeholder, is_new, is_on_sale, is_member_offer\n) VALUES (\n  ${[...values, "true", "false", "false", "false", "false"].join(", ")}\n)\nON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL\nDO UPDATE SET\n  sku = EXCLUDED.sku,\n  name = EXCLUDED.name,\n  slug = EXCLUDED.slug,\n  alcohol_type = EXCLUDED.alcohol_type,\n  description = EXCLUDED.description,\n  image_url = EXCLUDED.image_url,\n  volume_label = EXCLUDED.volume_label,\n  price_cents = EXCLUDED.price_cents,\n  inventory_quantity = EXCLUDED.inventory_quantity,\n  is_active = true,\n  is_placeholder = false,\n  updated_at = now();`;
});

const header = [
  "-- Generated from data/stock-catalogue.json. Do not hand-edit.",
  "-- Contains only public catalogue fields; no cost or profit values are included.",
  "-- Apply db/migrations/001_commerce_admin.sql before this file.",
  `-- Source export: ${source.sourceFile ?? "unknown"}; generated ${source.generatedAt ?? "unknown"}.`,
  "BEGIN;",
].join("\n");
await mkdir(outputDirectory, { recursive: true });
await writeFile(outputPath, `${header}\n\n${statements.join("\n\n")}\n\nCOMMIT;\n`);
process.stdout.write(`Generated ${statements.length} safe stock upserts at db/seeds/stock-catalogue.sql\n`);

function validProduct(value) {
  return value
    && typeof value === "object"
    && typeof value.sourceId === "string"
    && typeof value.name === "string"
    && typeof value.alcoholType === "string"
    && typeof value.detail === "string"
    && Number.isInteger(value.priceCents)
    && value.priceCents > 0
    && Number.isInteger(value.inventoryQuantity)
    && value.inventoryQuantity > 0
    && typeof value.imageSrc === "string"
    && typeof value.imageIsIllustrative === "boolean";
}

function sqlLiteral(value) {
  if (value === null) return "NULL";
  if (typeof value === "number") return String(value);
  return `'${String(value).replaceAll("'", "''")}'`;
}
