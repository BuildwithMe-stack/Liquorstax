import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const sourcePath = process.argv[2];
if (!sourcePath) {
  throw new Error("Usage: pnpm stock:import /absolute/path/to/stocklist.csv");
}

const projectRoot = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const sourceText = await readFile(resolve(sourcePath), "utf8");
const rows = parseCsv(sourceText);
const [headers, ...dataRows] = rows;

if (!headers?.length) throw new Error("The stock file is empty");

const headerIndex = new Map(headers.map((header, index) => [header.trim(), index]));
const requiredHeaders = [
  "ID",
  "Name",
  "Case Quantity",
  "Cases on hand",
  "Items on hand",
  "Quantity",
  "Price",
];
for (const header of requiredHeaders) {
  if (!headerIndex.has(header)) throw new Error(`The stock file is missing the ${header} column`);
}

const sourceRows = dataRows.flatMap((row, rowNumber) => {
  const value = (header) => String(row[headerIndex.get(header)] ?? "").trim();
  const sourceId = value("ID");
  const name = value("Name");
  if (!sourceId || !name) return [];
  return [{
    rowNumber: rowNumber + 2,
    sourceId,
    name,
    caseQuantity: parseNumber(value("Case Quantity")),
    casesOnHand: parseNumber(value("Cases on hand")),
    itemsOnHand: parseNumber(value("Items on hand")),
    quantity: parseNumber(value("Quantity")),
    price: parseNumber(value("Price")),
  }];
});

const grouped = new Map();
for (const row of sourceRows) {
  const existing = grouped.get(row.sourceId) ?? { sourceId: row.sourceId, name: row.name, rows: [] };
  existing.rows.push(row);
  grouped.set(row.sourceId, existing);
}

const usedIds = new Set();
const products = [];
const excluded = new Map();
let inconsistentStockGroups = 0;
let priceConflictGroups = 0;

for (const group of [...grouped.values()].sort((left, right) => left.name.localeCompare(right.name, "en-AU"))) {
  const name = cleanProductName(group.name);
  if (!isCatalogueProduct(name)) {
    increment(excluded, "non-catalogue item");
    continue;
  }

  const stockSnapshots = group.rows.map((row) => stockUnits(row));
  const distinctSnapshots = [...new Set(stockSnapshots)];
  if (distinctSnapshots.length > 1) inconsistentStockGroups += 1;
  // A source ID can be represented by several pack/price rows. Using the
  // lowest snapshot protects the shared underlying stock from overstatement.
  const availableUnits = Math.max(0, Math.min(...stockSnapshots));
  if (availableUnits < 1) {
    increment(excluded, "no verified stock");
    continue;
  }

  const tiers = priceTiers(group.rows);
  if (!tiers.length) {
    increment(excluded, "missing sell price");
    continue;
  }
  if (tiers.some((tier) => tier.conflicted)) priceConflictGroups += 1;

  const tier = selectPrimaryTier(name, tiers);
  const inventoryQuantity = Math.floor(availableUnits / tier.quantity);
  if (inventoryQuantity < 1) {
    increment(excluded, "insufficient stock for the sellable pack");
    continue;
  }

  const alcoholType = classifyAlcoholType(name);
  const key = `${group.sourceId}:${tier.quantity}:${tier.priceCents}`;
  const image = matchedImage(name);
  products.push({
    id: stableId(key, usedIds),
    sourceId: group.sourceId,
    name,
    brand: deriveBrand(name),
    alcoholType,
    detail: describeProduct(name, tier.quantity),
    packQuantity: tier.quantity,
    priceCents: tier.priceCents,
    inventoryQuantity,
    stockUnits: availableUnits,
    imageSrc: image.src,
    imageIsIllustrative: image.illustrative,
    tone: toneFor(alcoholType),
    initials: initialsFor(name),
  });
}

products.sort((left, right) => {
  const featuredDifference = featuredScore(right) - featuredScore(left);
  return featuredDifference || left.name.localeCompare(right.name, "en-AU");
});
const featuredIds = new Set(products.slice(0, 18).map((product) => product.id));
for (const product of products) product.featured = featuredIds.has(product.id);

const generatedAt = new Date().toISOString();
const report = {
  generatedAt,
  sourceRows: sourceRows.length,
  sourceProductIds: grouped.size,
  sellableProducts: products.length,
  exactPhotoMatches: products.filter((product) => !product.imageIsIllustrative).length,
  illustrativeProducts: products.filter((product) => product.imageIsIllustrative).length,
  inconsistentStockGroups,
  priceConflictGroups,
  excluded: Object.fromEntries([...excluded.entries()].sort((left, right) => right[1] - left[1])),
  stockMethod: "min((Cases on hand × Case Quantity) + Items on hand) per source ID; then floor(unit stock ÷ sellable Quantity)",
  pricingMethod: "Price is the supplied shop selling price for the selected sellable Quantity tier",
};

const catalogue = {
  version: 1,
  generatedAt,
  sourceFile: sourcePath.split(/[\\/]/).at(-1),
  report,
  products,
};

const dataDirectory = resolve(projectRoot, "data");
await mkdir(dataDirectory, { recursive: true });
await writeFile(resolve(dataDirectory, "stock-catalogue.json"), `${JSON.stringify(catalogue, null, 2)}\n`);
await writeFile(resolve(dataDirectory, "stock-catalogue-report.json"), `${JSON.stringify(report, null, 2)}\n`);
process.stdout.write(`${JSON.stringify(report, null, 2)}\n`);

function parseCsv(input) {
  const parsed = [];
  let row = [];
  let field = "";
  let quoted = false;

  for (let index = 0; index < input.length; index += 1) {
    const character = input[index];
    const next = input[index + 1];
    if (quoted) {
      if (character === '"' && next === '"') {
        field += '"';
        index += 1;
      } else if (character === '"') {
        quoted = false;
      } else {
        field += character;
      }
      continue;
    }
    if (character === '"') {
      quoted = true;
    } else if (character === ",") {
      row.push(field);
      field = "";
    } else if (character === "\n") {
      row.push(field.replace(/\r$/, ""));
      if (row.some((value) => value !== "")) parsed.push(row);
      row = [];
      field = "";
    } else {
      field += character;
    }
  }
  if (quoted) throw new Error("The stock file contains an unfinished quoted value");
  if (field || row.length) {
    row.push(field.replace(/\r$/, ""));
    if (row.some((value) => value !== "")) parsed.push(row);
  }
  return parsed;
}

function parseNumber(value) {
  if (!value) return 0;
  const parsed = Number(value.replace(/[$,]/g, ""));
  return Number.isFinite(parsed) ? parsed : 0;
}

function stockUnits(row) {
  const caseQuantity = Math.max(0, Math.trunc(row.caseQuantity));
  const casesOnHand = Math.trunc(row.casesOnHand);
  const itemsOnHand = Math.trunc(row.itemsOnHand);
  return casesOnHand * caseQuantity + itemsOnHand;
}

function priceTiers(rows) {
  const byQuantity = new Map();
  for (const row of rows) {
    const quantity = Math.trunc(row.quantity);
    const priceCents = Math.round(row.price * 100);
    if (quantity < 1 || priceCents < 1) continue;
    const existing = byQuantity.get(quantity);
    if (!existing) {
      byQuantity.set(quantity, { quantity, priceCents, conflicted: false });
    } else if (existing.priceCents !== priceCents) {
      // The export does not include a timestamp for duplicate tiers. Preserve
      // the first row and flag this for the owner rather than inventing a price.
      existing.conflicted = true;
    }
  }
  return [...byQuantity.values()].sort((left, right) => left.quantity - right.quantity);
}

function selectPrimaryTier(name, tiers) {
  const packMatch = name.match(/\b(\d{1,3})\s*(?:PK|PACK)\b/i);
  const namedPack = packMatch ? Number(packMatch[1]) : 0;
  if (namedPack > 0) {
    const exact = tiers.find((tier) => tier.quantity === namedPack);
    if (exact) return exact;
  }
  return tiers.find((tier) => tier.quantity === 1) ?? tiers[0];
}

function cleanProductName(value) {
  return value
    .replace(/^[=+@]+/, "")
    .replace(/^-(?=\d)/, "Suntory -")
    .replace(/\s+/g, " ")
    .trim();
}

function isCatalogueProduct(name) {
  if (!name || /^\d{8,}$/.test(name)) return false;
  return !/\b(?:barware|gift\s*bag|cigarette|tobacco|lighter|lotto|choc(?:olate)?|confectionery)\b/i.test(name);
}

function classifyAlcoholType(name) {
  const value = name.toUpperCase();
  if (/\b(?:0%|ZERO|NON[- ]?ALC|NON[- ]?ALCOHOL|JUICE|WATER|SODA|SOFT DRINK|ENERGY DRINK|MIXER)\b/.test(value)) return "Non-alcoholic";
  if (/\b(?:RTD|PREMIX|CRUISER|UDL|HARD RATED|WHITE ?CLAW|FAT ?LAMB|WOODSTOCK|CANADIAN CLUB.*(?:COLA|DRY)|J\/?DANIEL.*(?:COLA|LEMON|DRY)|J\/?WALKER.*(?:COLA|LEMON)|JIM BEAM.*(?:COLA|DRY)|WILD TURKEY.*(?:COLA|DRY)|SMIRNOFF.*(?:ICE|CRUSH)|MALIBU.*(?:COLA|LEMON)|TANQUERAY.*TONIC|BOMBAY.*TONIC|KRAKEN.*COLA|ABSOLUT.*SPRITE|KIRIN HYOKETSU|SUNTORY|-196)\b/.test(value)) return "Premix";
  if (/\b(?:CHAMPAGNE|PROSECCO|SPARKLING|BRUT|CUVEE)\b/.test(value)) return "Sparkling";
  if (/\b(?:CIDER|MERCURY)\b/.test(value)) return "Cider";
  if (/\b(?:PINOT|SHIRAZ|SAUV|CHARDONNAY|CABERNET|MERLOT|RIESLING|MOSCATO|MALBEC|TEMPRANILLO|ROSE|ROSÉ|WINE|PORT)\b/.test(value)) return "Wine";
  if (/\b(?:TEQUILA|1800|PATRON|PATRÓN|DON JULIO|JOSE CUERVO|CAZCABEL)\b/.test(value)) return "Tequila";
  if (/\b(?:GIN|TANQUERAY|BOMBAY|HENDRICK|GORDON)\b/.test(value)) return "Gin";
  if (/\b(?:RUM|MALIBU|KRAKEN|BACARDI|BUNDABERG|OLD MONK)\b/.test(value)) return "Rum";
  if (/\b(?:VODKA|VDK|ABSOLUT|SMIRNOFF|GREY GOOSE|CIROC)\b/.test(value)) return "Vodka";
  if (/\b(?:BOURBON|JIM BEAM|WILD TURKEY|MAKER'?S|WOODFORD|BUFFALO TRACE|JACK DANIEL|J\/DANIEL)\b/.test(value)) return "Bourbon";
  if (/\b(?:WHISKY|WHISKEY|SCOTCH|MALT|GLEN|CHIVAS|JAMESON|JOHNNIE WALKER|J\/WALKER|100 PIPERS|BALLANTINE|BLACK & WHITE)\b/.test(value)) return "Whisky";
  if (/\b(?:BEER|LAGER|ALE|STOUT|PILSNER|DRAUGHT|PALE|IPA|CORONA|BUDWEISER|KINGFISHER|HEINEKEN|CARLTON|VB|VICTORIA BITTER|BRO CODE|HAYWARDS|BAVARIA|BAD MONKEY)\b/.test(value)) return "Beer";
  if (/\b(?:LIQUEUR|BAILEYS|KAHLUA|KAHLÚA|JAGER|JÄGER|OUZO|SAMBUCA|AMARULA)\b/.test(value)) return "Liqueur";
  return "Other";
}

function deriveBrand(name) {
  const patterns = [
    ["JOHNNIE WALKER", "Johnnie Walker"], ["J/WALKER", "Johnnie Walker"],
    ["JACK DANIEL", "Jack Daniel's"], ["J/DANIEL", "Jack Daniel's"],
    ["JIM BEAM", "Jim Beam"], ["WILD TURKEY", "Wild Turkey"],
    ["100 PIPERS", "100 Pipers"], ["1800", "1800 Tequila"],
    ["19 CRIMES", "19 Crimes"], ["ABSOLUT", "Absolut"],
    ["SMIRNOFF", "Smirnoff"], ["GREY GOOSE", "Grey Goose"],
    ["GLENFIDDICH", "Glenfiddich"], ["GLENLIVET", "The Glenlivet"],
    ["BOMBAY", "Bombay Sapphire"], ["TANQUERAY", "Tanqueray"],
    ["CORONA", "Corona"], ["KIRIN", "Kirin"], ["SUNTORY", "Suntory"],
    ["-196", "Suntory -196"], ["CRUISER", "Cruiser"], ["WOODSTOCK", "Woodstock"],
    ["WHITECLAW", "White Claw"], ["WHITE CLAW", "White Claw"],
  ];
  const upper = name.toUpperCase();
  const matched = patterns.find(([needle]) => upper.includes(needle));
  if (matched) return matched[1];
  return name.split(/\s+/).slice(0, 2).map(titleCaseWord).join(" ");
}

function describeProduct(name, packQuantity) {
  const volume = name.match(/\b(\d+(?:\.\d+)?)\s*(ML|L)\b/i);
  const volumeLabel = volume ? `${volume[1]}${volume[2].toLowerCase() === "ml" ? "mL" : "L"}` : "";
  const packLabel = packQuantity > 1 ? `${packQuantity}-pack` : "Single unit";
  return [packLabel, volumeLabel].filter(Boolean).join(" · ");
}

function matchedImage(name) {
  const value = name.toUpperCase();
  // Exact product artwork sourced from the respective official brand pages.
  // All shop-floor campaign photos below remain clearly labelled as range
  // imagery, rather than pretending they are a pack-shot of every variant.
  if (/1800 COCONUT/.test(value)) return { src: "/catalogue/stock/1800-coconut.jpg", illustrative: false };
  if (/1800 SILVER/.test(value)) return { src: "/catalogue/stock/1800-blanco.jpg", illustrative: false };
  if (/19 CRIMES PINOT NOIR/.test(value)) return { src: "/catalogue/stock/19-crimes-pinot-noir.png", illustrative: false };
  if (/JOHNNIE WALKER|J\/WALKER/.test(value)) return { src: "/catalogue/johnnie-walker-black-label.jpg", illustrative: true };
  if (/SUNTORY|-196|KIRIN HYOKETSU/.test(value)) return { src: "/catalogue/suntory-specials.jpg", illustrative: true };
  if (/SQUARE.*CIRCLE/.test(value)) return { src: "/catalogue/square-circle-bourbon-cola.jpg", illustrative: true };
  if (/RATU/.test(value)) return { src: "/catalogue/ratu-8-signature-blend.jpg", illustrative: true };
  if (/VICTORIA BITTER|\bVB\b/.test(value)) return { src: "/catalogue/victoria-bitter-vx.jpg", illustrative: true };
  if (/PIRATE BUCKET/.test(value)) return { src: "/catalogue/pirate-bucket-promotion.jpg", illustrative: true };
  if (/BOURBON.*COLA/.test(value)) return { src: "/catalogue/bourbon-coke-bundle.jpg", illustrative: true };
  return { src: "", illustrative: true };
}

function toneFor(alcoholType) {
  return ({
    Wine: "merlot", Whisky: "gold", Bourbon: "amber", Premix: "coral",
    Vodka: "ice", Gin: "botanical", Rum: "molasses", Tequila: "agave",
    Beer: "lager", Cider: "apple", Sparkling: "champagne", Liqueur: "plum",
    "Non-alcoholic": "mint", Other: "forest",
  })[alcoholType] ?? "forest";
}

function initialsFor(name) {
  return name.split(/\s+/).slice(0, 2).map((word) => word[0]?.toUpperCase()).join("") || "LS";
}

function featuredScore(product) {
  return product.stockUnits * product.priceCents;
}

function stableId(key, used) {
  let hash = 2_000_000;
  for (const character of key) {
    hash ^= character.charCodeAt(0);
    hash = Math.imul(hash, 16_777_619) >>> 0;
  }
  let candidate = 2_000_000 + (hash % 1_900_000_000);
  while (used.has(candidate)) candidate += 1;
  used.add(candidate);
  return candidate;
}

function increment(map, key) {
  map.set(key, (map.get(key) ?? 0) + 1);
}

function titleCaseWord(word) {
  if (/^\d+(?:ML|L|PK)$/i.test(word)) return word.toUpperCase().replace(/ML$/, "mL");
  return word ? `${word[0].toUpperCase()}${word.slice(1).toLowerCase()}` : word;
}
