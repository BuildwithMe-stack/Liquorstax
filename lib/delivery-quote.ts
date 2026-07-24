import { createHmac, timingSafeEqual } from "node:crypto";

export const SHOP_DISPATCH_ADDRESS = "119 Highlander Dr, Craigieburn VIC 3064";
export const EXPRESS_RATE_CENTS_PER_KM = 150;
export const DEFAULT_MAX_EXPRESS_DISTANCE_KM = 40;
export const DEFAULT_DELIVERY_QUOTE_TTL_SECONDS = 10 * 60;

const MAX_DELIVERY_QUOTE_TTL_SECONDS = 30 * 60;
const PREVIEW_QUOTE_SECRET = "liquor-stax-owner-sample-delivery-quote-only";

export type ExpressDeliveryQuote = {
  version: 1;
  deliveryMethod: "express";
  address: string;
  placeId: string;
  distanceMeters: number;
  durationSeconds: number;
  deliveryFeeCents: number;
  rateCentsPerKm: typeof EXPRESS_RATE_CENTS_PER_KM;
  sample: boolean;
  issuedAt: number;
  expiresAt: number;
};

export type DeliveryBackendConfiguration = {
  commerceLive: boolean;
  googleMapsApiKey: string;
  googleShopPlaceId: string;
  maxDistanceMeters: number;
  quoteTtlSeconds: number;
  mapsConfigured: boolean;
};

export class DeliveryQuoteError extends Error {
  constructor(
    message: string,
    readonly code:
      | "configuration"
      | "expired"
      | "invalid"
      | "outside_delivery_area",
  ) {
    super(message);
    this.name = "DeliveryQuoteError";
  }
}

export function getDeliveryBackendConfiguration(): DeliveryBackendConfiguration {
  const commerceLive = process.env.COMMERCE_LIVE === "true";
  const googleMapsApiKey = process.env.GOOGLE_MAPS_API_KEY?.trim() ?? "";
  const googleShopPlaceId = process.env.GOOGLE_SHOP_PLACE_ID?.trim() ?? "";
  const quoteSecret = process.env.DELIVERY_QUOTE_SECRET?.trim() ?? "";
  const maxDistanceKm = boundedEnvironmentNumber(
    "EXPRESS_MAX_DISTANCE_KM",
    DEFAULT_MAX_EXPRESS_DISTANCE_KM,
    1,
    250,
  );
  const quoteTtlSeconds = boundedEnvironmentInteger(
    "DELIVERY_QUOTE_TTL_SECONDS",
    DEFAULT_DELIVERY_QUOTE_TTL_SECONDS,
    60,
    MAX_DELIVERY_QUOTE_TTL_SECONDS,
  );

  if (quoteSecret && quoteSecret.length < 32) {
    throw new DeliveryQuoteError(
      "DELIVERY_QUOTE_SECRET must contain at least 32 characters",
      "configuration",
    );
  }
  if (googleShopPlaceId && !isGooglePlaceId(googleShopPlaceId)) {
    throw new DeliveryQuoteError("GOOGLE_SHOP_PLACE_ID is invalid", "configuration");
  }

  const missingLiveSettings = [
    !googleMapsApiKey && "GOOGLE_MAPS_API_KEY",
    !googleShopPlaceId && "GOOGLE_SHOP_PLACE_ID",
    !quoteSecret && "DELIVERY_QUOTE_SECRET",
  ].filter(Boolean);
  if (commerceLive && missingLiveSettings.length) {
    throw new DeliveryQuoteError(
      `Express delivery is not configured (${missingLiveSettings.join(", ")})`,
      "configuration",
    );
  }

  return {
    commerceLive,
    googleMapsApiKey,
    googleShopPlaceId,
    maxDistanceMeters: Math.round(maxDistanceKm * 1_000),
    quoteTtlSeconds,
    mapsConfigured: Boolean(googleMapsApiKey && googleShopPlaceId),
  };
}

export function calculateExpressDeliveryFee(distanceMeters: number): number {
  if (!Number.isFinite(distanceMeters) || distanceMeters <= 0) {
    throw new DeliveryQuoteError("The delivery distance is invalid", "invalid");
  }
  return Math.round((distanceMeters * EXPRESS_RATE_CENTS_PER_KM) / 1_000);
}

export function signDeliveryQuote(
  quote: Pick<
    ExpressDeliveryQuote,
    "address" | "placeId" | "distanceMeters" | "durationSeconds" | "sample"
  >,
  now = Date.now(),
): { quote: ExpressDeliveryQuote; quoteToken: string } {
  const configuration = getDeliveryBackendConfiguration();
  const address = cleanAddress(quote.address);
  const placeId = cleanPlaceId(quote.placeId, quote.sample);
  const distanceMeters = positiveInteger(quote.distanceMeters, "The delivery distance is invalid");
  const durationSeconds = positiveInteger(quote.durationSeconds, "The delivery duration is invalid");

  if (distanceMeters > configuration.maxDistanceMeters) {
    throw new DeliveryQuoteError(
      `Express delivery is available within ${formatKilometres(configuration.maxDistanceMeters)} km of the shop`,
      "outside_delivery_area",
    );
  }
  if (quote.sample && configuration.commerceLive) {
    throw new DeliveryQuoteError("Sample delivery quotes cannot be used for live orders", "invalid");
  }

  const issuedAt = Math.floor(now / 1_000);
  const payload: ExpressDeliveryQuote = {
    version: 1,
    deliveryMethod: "express",
    address,
    placeId,
    distanceMeters,
    durationSeconds,
    deliveryFeeCents: calculateExpressDeliveryFee(distanceMeters),
    rateCentsPerKm: EXPRESS_RATE_CENTS_PER_KM,
    sample: quote.sample,
    issuedAt,
    expiresAt: issuedAt + configuration.quoteTtlSeconds,
  };
  const encodedPayload = Buffer.from(JSON.stringify(payload), "utf8").toString("base64url");
  return {
    quote: payload,
    quoteToken: `${encodedPayload}.${signPayload(encodedPayload)}`,
  };
}

export function createPreviewDeliveryQuote(
  address: string,
  placeId = "preview-manual",
  now = Date.now(),
): { quote: ExpressDeliveryQuote; quoteToken: string } {
  const configuration = getDeliveryBackendConfiguration();
  if (configuration.commerceLive) {
    throw new DeliveryQuoteError("Sample delivery quotes are disabled", "configuration");
  }

  // This fixed distance is deliberately labelled as a sample throughout the
  // response and signed token. It is never a substitute for a Google Routes
  // measurement and is rejected as soon as COMMERCE_LIVE is enabled.
  const sampleDistanceMeters = Math.min(8_000, configuration.maxDistanceMeters);
  return signDeliveryQuote(
    {
      address,
      placeId: placeId || "preview-manual",
      distanceMeters: sampleDistanceMeters,
      durationSeconds: 16 * 60,
      sample: true,
    },
    now,
  );
}

export function verifyDeliveryQuote(
  quoteToken: string,
  now = Date.now(),
): ExpressDeliveryQuote {
  if (typeof quoteToken !== "string" || quoteToken.length < 40 || quoteToken.length > 4_000) {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }
  const tokenParts = quoteToken.split(".");
  if (tokenParts.length !== 2) {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }
  const [encodedPayload, suppliedSignature] = tokenParts;
  const expectedSignature = signPayload(encodedPayload);
  const supplied = Buffer.from(suppliedSignature, "utf8");
  const expected = Buffer.from(expectedSignature, "utf8");
  if (supplied.length !== expected.length || !timingSafeEqual(supplied, expected)) {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }

  let candidate: unknown;
  try {
    candidate = JSON.parse(Buffer.from(encodedPayload, "base64url").toString("utf8")) as unknown;
  } catch {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }
  if (!isRecord(candidate)) {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }

  const payload = candidate as Partial<ExpressDeliveryQuote>;
  const configuration = getDeliveryBackendConfiguration();
  const currentSeconds = Math.floor(now / 1_000);
  const validShape =
    payload.version === 1 &&
    payload.deliveryMethod === "express" &&
    typeof payload.address === "string" &&
    payload.address === cleanAddress(payload.address) &&
    typeof payload.placeId === "string" &&
    payload.placeId === cleanPlaceId(payload.placeId, payload.sample === true) &&
    Number.isInteger(payload.distanceMeters) &&
    Number.isInteger(payload.durationSeconds) &&
    Number.isInteger(payload.deliveryFeeCents) &&
    payload.rateCentsPerKm === EXPRESS_RATE_CENTS_PER_KM &&
    typeof payload.sample === "boolean" &&
    Number.isInteger(payload.issuedAt) &&
    Number.isInteger(payload.expiresAt);
  if (!validShape) {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }

  const verified = payload as ExpressDeliveryQuote;
  if (
    verified.distanceMeters <= 0 ||
    verified.distanceMeters > configuration.maxDistanceMeters ||
    verified.durationSeconds <= 0 ||
    verified.durationSeconds > 24 * 60 * 60 ||
    verified.deliveryFeeCents !== calculateExpressDeliveryFee(verified.distanceMeters) ||
    verified.expiresAt <= verified.issuedAt ||
    verified.expiresAt - verified.issuedAt > MAX_DELIVERY_QUOTE_TTL_SECONDS ||
    verified.issuedAt > currentSeconds + 60
  ) {
    throw new DeliveryQuoteError("The express delivery quote is invalid", "invalid");
  }
  if (verified.expiresAt <= currentSeconds) {
    throw new DeliveryQuoteError("The express delivery quote has expired. Check the address again.", "expired");
  }
  if (verified.sample && configuration.commerceLive) {
    throw new DeliveryQuoteError("Sample delivery quotes cannot be used for live orders", "invalid");
  }
  return verified;
}

// Explicit alias for checkout code that wants the intent in the import name.
export const verifyExpressDeliveryQuote = verifyDeliveryQuote;

function signPayload(encodedPayload: string): string {
  return createHmac("sha256", quoteSecret()).update(encodedPayload).digest("base64url");
}

function quoteSecret(): string {
  const configured = process.env.DELIVERY_QUOTE_SECRET?.trim() ?? "";
  if (configured.length >= 32) return configured;
  if (process.env.COMMERCE_LIVE === "true") {
    throw new DeliveryQuoteError("Express delivery quote signing is not configured", "configuration");
  }
  return PREVIEW_QUOTE_SECRET;
}

function cleanAddress(value: string): string {
  if (typeof value !== "string") {
    throw new DeliveryQuoteError("Choose a complete delivery address", "invalid");
  }
  const cleaned = value.replace(/\s+/g, " ").trim();
  if (cleaned.length < 8 || cleaned.length > 300 || /[\u0000-\u001f\u007f]/.test(cleaned)) {
    throw new DeliveryQuoteError("Choose a complete delivery address", "invalid");
  }
  return cleaned;
}

function cleanPlaceId(value: string, sample: boolean): string {
  if (sample && value === "preview-manual") return value;
  if (!isGooglePlaceId(value)) {
    throw new DeliveryQuoteError("Choose an address from Google suggestions", "invalid");
  }
  return value;
}

function isGooglePlaceId(value: string): boolean {
  return typeof value === "string" && /^[A-Za-z0-9_-]{3,256}$/.test(value);
}

function positiveInteger(value: number, message: string): number {
  if (!Number.isInteger(value) || value <= 0) {
    throw new DeliveryQuoteError(message, "invalid");
  }
  return value;
}

function boundedEnvironmentNumber(name: string, fallback: number, minimum: number, maximum: number): number {
  const raw = process.env[name]?.trim();
  if (!raw) return fallback;
  const parsed = Number(raw);
  if (!Number.isFinite(parsed) || parsed < minimum || parsed > maximum) {
    throw new DeliveryQuoteError(`${name} must be between ${minimum} and ${maximum}`, "configuration");
  }
  return parsed;
}

function boundedEnvironmentInteger(name: string, fallback: number, minimum: number, maximum: number): number {
  const parsed = boundedEnvironmentNumber(name, fallback, minimum, maximum);
  if (!Number.isInteger(parsed)) {
    throw new DeliveryQuoteError(`${name} must be a whole number`, "configuration");
  }
  return parsed;
}

function formatKilometres(distanceMeters: number): string {
  return (distanceMeters / 1_000).toLocaleString("en-AU", { maximumFractionDigits: 1 });
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}
