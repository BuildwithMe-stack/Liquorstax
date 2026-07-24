import { NextRequest, NextResponse } from "next/server";
import {
  createPreviewDeliveryQuote,
  DeliveryQuoteError,
  EXPRESS_RATE_CENTS_PER_KM,
  getDeliveryBackendConfiguration,
  signDeliveryQuote,
} from "@/lib/delivery-quote";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const MAX_REQUEST_BYTES = 4_096;
const REQUESTS_PER_MINUTE = 15;
const rateBuckets = new Map<string, { count: number; resetAt: number }>();

type QuoteInput = {
  placeId?: unknown;
  address?: unknown;
  sessionToken?: unknown;
};

type GoogleRoutesResponse = {
  routes?: Array<{ distanceMeters?: unknown; duration?: unknown }>;
};

type GooglePlaceResponse = {
  id?: unknown;
  formattedAddress?: unknown;
};

export async function POST(request: NextRequest) {
  const rateLimit = takeRateLimit(clientAddress(request));
  if (!rateLimit.allowed) {
    return NextResponse.json(
      { error: "Too many delivery quotes. Please wait a minute and try again." },
      { status: 429, headers: { "retry-after": String(rateLimit.retryAfterSeconds) } },
    );
  }

  const parsed = await readBoundedJson(request);
  if (!parsed.ok) return parsed.response;
  const input = parsed.value as QuoteInput;
  const placeId = cleanPlaceId(input.placeId);
  const suppliedAddress = cleanOptionalAddress(input.address);
  const sessionToken = validSessionToken(input.sessionToken);
  if (input.sessionToken !== undefined && !sessionToken) {
    return NextResponse.json({ error: "The address-search session is invalid." }, { status: 400 });
  }

  let configuration: ReturnType<typeof getDeliveryBackendConfiguration>;
  try {
    configuration = getDeliveryBackendConfiguration();
  } catch (error) {
    return deliveryErrorResponse(error);
  }

  if (!placeId) {
    if (configuration.commerceLive) {
      return NextResponse.json({ error: "Choose an address from Google suggestions." }, { status: 400 });
    }
    if (!suppliedAddress) {
      return NextResponse.json({ error: "Enter a complete address for the sample quote." }, { status: 400 });
    }
    return previewQuoteResponse(suppliedAddress, "preview-manual");
  }

  if (!configuration.mapsConfigured) {
    if (configuration.commerceLive) {
      return NextResponse.json({ error: "Express delivery is not configured." }, { status: 503 });
    }
    if (!suppliedAddress) {
      return NextResponse.json({ error: "Enter a complete address for the sample quote." }, { status: 400 });
    }
    return previewQuoteResponse(suppliedAddress, placeId);
  }

  try {
    const detailsUrl = new URL(`https://places.googleapis.com/v1/places/${encodeURIComponent(placeId)}`);
    detailsUrl.searchParams.set("languageCode", "en-AU");
    detailsUrl.searchParams.set("regionCode", "au");
    if (sessionToken) detailsUrl.searchParams.set("sessionToken", sessionToken);

    const [routesResponse, placeResponse] = await Promise.all([
      fetch("https://routes.googleapis.com/directions/v2:computeRoutes", {
        method: "POST",
        headers: {
          "content-type": "application/json",
          "x-goog-api-key": configuration.googleMapsApiKey,
          "x-goog-fieldmask": "routes.distanceMeters,routes.duration",
        },
        body: JSON.stringify({
          origin: { placeId: configuration.googleShopPlaceId },
          destination: { placeId },
          travelMode: "DRIVE",
          routingPreference: "TRAFFIC_UNAWARE",
          computeAlternativeRoutes: false,
          languageCode: "en-AU",
          regionCode: "au",
          units: "METRIC",
        }),
        signal: AbortSignal.timeout(10_000),
        cache: "no-store",
      }),
      fetch(detailsUrl, {
        headers: {
          "x-goog-api-key": configuration.googleMapsApiKey,
          "x-goog-fieldmask": "id,formattedAddress",
        },
        signal: AbortSignal.timeout(8_000),
        cache: "no-store",
      }),
    ]);

    if (!routesResponse.ok || !placeResponse.ok) {
      console.error("Google delivery quote failed", {
        routesStatus: routesResponse.status,
        placeStatus: placeResponse.status,
      });
      const rateLimited = routesResponse.status === 429 || placeResponse.status === 429;
      return NextResponse.json(
        { error: "The delivery route could not be measured right now." },
        { status: rateLimited ? 429 : 503 },
      );
    }

    const routes = await routesResponse.json() as GoogleRoutesResponse;
    const place = await placeResponse.json() as GooglePlaceResponse;
    const route = routes.routes?.[0];
    const distanceMeters = integerValue(route?.distanceMeters);
    const durationSeconds = parseGoogleDuration(route?.duration);
    const canonicalAddress = typeof place.formattedAddress === "string"
      ? place.formattedAddress.replace(/\s+/g, " ").trim()
      : "";
    if (!distanceMeters || !durationSeconds || !canonicalAddress || place.id !== placeId) {
      return NextResponse.json({ error: "No drivable route was found for that address." }, { status: 422 });
    }

    const signed = signDeliveryQuote({
      address: canonicalAddress,
      placeId,
      distanceMeters,
      durationSeconds,
      sample: !configuration.commerceLive,
    });
    return NextResponse.json(
      quoteResponse(signed.quoteToken, signed.quote),
      { headers: { "cache-control": "no-store" } },
    );
  } catch (error) {
    if (error instanceof DeliveryQuoteError) return deliveryErrorResponse(error);
    console.error("Google delivery quote request failed", error);
    return NextResponse.json({ error: "The delivery route could not be measured right now." }, { status: 503 });
  }
}

function previewQuoteResponse(address: string, placeId: string): NextResponse {
  try {
    const signed = createPreviewDeliveryQuote(address, placeId);
    return NextResponse.json(
      {
        ...quoteResponse(signed.quoteToken, signed.quote),
        notice: "Owner sample only — this is not a Google road-distance quote and cannot be used for live checkout.",
      },
      { headers: { "cache-control": "no-store" } },
    );
  } catch (error) {
    return deliveryErrorResponse(error);
  }
}

function quoteResponse(
  quoteToken: string,
  quote: {
    address: string;
    placeId: string;
    distanceMeters: number;
    durationSeconds: number;
    deliveryFeeCents: number;
    sample: boolean;
    expiresAt: number;
  },
) {
  return {
    quoteToken,
    address: quote.address,
    placeId: quote.placeId,
    distanceMeters: quote.distanceMeters,
    durationSeconds: quote.durationSeconds,
    deliveryFeeCents: quote.deliveryFeeCents,
    rateCentsPerKm: EXPRESS_RATE_CENTS_PER_KM,
    sample: quote.sample,
    expiresAt: new Date(quote.expiresAt * 1_000).toISOString(),
    ...(quote.sample
      ? { notice: "Owner sample only — live checkout remains disabled." }
      : {}),
  };
}

async function readBoundedJson(
  request: NextRequest,
): Promise<{ ok: true; value: unknown } | { ok: false; response: NextResponse }> {
  const contentLength = Number(request.headers.get("content-length") ?? 0);
  if (Number.isFinite(contentLength) && contentLength > MAX_REQUEST_BYTES) {
    return { ok: false, response: NextResponse.json({ error: "Delivery quote request is too large." }, { status: 413 }) };
  }
  try {
    const raw = await request.text();
    if (Buffer.byteLength(raw, "utf8") > MAX_REQUEST_BYTES) {
      return { ok: false, response: NextResponse.json({ error: "Delivery quote request is too large." }, { status: 413 }) };
    }
    const value = JSON.parse(raw) as unknown;
    if (!value || typeof value !== "object" || Array.isArray(value)) {
      return { ok: false, response: NextResponse.json({ error: "Invalid delivery quote request." }, { status: 400 }) };
    }
    return { ok: true, value };
  } catch {
    return { ok: false, response: NextResponse.json({ error: "Invalid delivery quote request." }, { status: 400 }) };
  }
}

function cleanPlaceId(value: unknown): string {
  if (value === undefined || value === null || value === "") return "";
  return typeof value === "string" && /^[A-Za-z0-9_-]{3,256}$/.test(value) ? value : "";
}

function cleanOptionalAddress(value: unknown): string {
  if (value === undefined || value === null || value === "") return "";
  if (typeof value !== "string") return "";
  const cleaned = value.replace(/\s+/g, " ").trim();
  return cleaned.length >= 8 && cleaned.length <= 300 && !/[\u0000-\u001f\u007f]/.test(cleaned)
    ? cleaned
    : "";
}

function validSessionToken(value: unknown): string {
  if (value === undefined || value === null || value === "") return "";
  return typeof value === "string" && /^[A-Za-z0-9_-]{8,128}$/.test(value) ? value : "";
}

function parseGoogleDuration(value: unknown): number {
  if (typeof value !== "string" || !/^\d+(?:\.\d+)?s$/.test(value)) return 0;
  const seconds = Number(value.slice(0, -1));
  return Number.isFinite(seconds) && seconds > 0 ? Math.ceil(seconds) : 0;
}

function integerValue(value: unknown): number {
  return typeof value === "number" && Number.isInteger(value) && value > 0 ? value : 0;
}

function clientAddress(request: NextRequest): string {
  return request.headers.get("x-real-ip")?.trim()
    || request.headers.get("x-vercel-forwarded-for")?.split(",")[0]?.trim()
    || request.headers.get("x-forwarded-for")?.split(",").at(-1)?.trim()
    || "unknown";
}

function takeRateLimit(key: string): { allowed: boolean; retryAfterSeconds: number } {
  const now = Date.now();
  if (rateBuckets.size >= 2_000) {
    for (const [bucketKey, bucket] of rateBuckets) {
      if (bucket.resetAt <= now) rateBuckets.delete(bucketKey);
    }
    if (rateBuckets.size >= 2_000 && !rateBuckets.has(key)) {
      const oldest = rateBuckets.keys().next().value;
      if (oldest) rateBuckets.delete(oldest);
    }
  }
  const bucket = rateBuckets.get(key);
  if (!bucket || bucket.resetAt <= now) {
    rateBuckets.set(key, { count: 1, resetAt: now + 60_000 });
    return { allowed: true, retryAfterSeconds: 0 };
  }
  if (bucket.count >= REQUESTS_PER_MINUTE) {
    return { allowed: false, retryAfterSeconds: Math.max(1, Math.ceil((bucket.resetAt - now) / 1_000)) };
  }
  bucket.count += 1;
  return { allowed: true, retryAfterSeconds: 0 };
}

function deliveryErrorResponse(error: unknown): NextResponse {
  if (error instanceof DeliveryQuoteError) {
    const status = error.code === "outside_delivery_area"
      ? 422
      : error.code === "configuration"
        ? 503
        : 400;
    if (error.code === "configuration") console.error("Delivery quote configuration error", error.message);
    return NextResponse.json({ error: error.message }, { status });
  }
  console.error("Unable to create delivery quote", error);
  return NextResponse.json({ error: "The delivery route could not be measured right now." }, { status: 503 });
}
