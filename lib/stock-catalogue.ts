import importedStockCatalogue from "../data/stock-catalogue.json";
import type { AlcoholType, Product, ProductCollection } from "./catalogue";

type ImportedStockProduct = {
  id: number;
  sourceId: string;
  name: string;
  brand: string;
  alcoholType: AlcoholType;
  detail: string;
  packQuantity: number;
  priceCents: number;
  inventoryQuantity: number;
  imageSrc: string;
  imageIsIllustrative: boolean;
  tone: string;
  initials: string;
  featured: boolean;
};

type ImportedStockCatalogue = {
  products: ImportedStockProduct[];
};

const catalogue = importedStockCatalogue as ImportedStockCatalogue;

/**
 * The owner-supplied CSV contains repeat rows for price/pack tiers that share
 * one physical stock pool. The import script deliberately selects one safe
 * sellable tier per source product, so these cards cannot independently
 * overstate the shared quantity.
 */
export const stockCatalogueProducts: readonly Product[] = Object.freeze(
  catalogue.products.map((product) => {
    const collections: ProductCollection[] = [
      "catalogue",
      ...(product.featured ? ["top-picks" as const] : []),
    ];
    return {
      id: product.id,
      sourceProductId: product.sourceId,
      name: product.name,
      brand: product.brand,
      category: product.alcoholType,
      alcoholType: product.alcoholType,
      detail: product.detail,
      packQuantity: product.packQuantity,
      priceCents: product.priceCents,
      stickers: [],
      collections,
      tone: product.tone,
      initials: product.initials,
      imageSrc: product.imageSrc,
      imageAlt: product.imageSrc
        ? `${product.name} at Liquor Stax Craigieburn`
        : `${product.name} bottle-style catalogue artwork`,
      imageIsIllustrative: product.imageIsIllustrative,
      inventoryQuantity: product.inventoryQuantity,
      placeholder: false,
    } satisfies Product;
  }),
);

export const stockCatalogueSummary = Object.freeze({
  productCount: stockCatalogueProducts.length,
  generatedAt: (importedStockCatalogue as { generatedAt?: string }).generatedAt ?? "",
});
