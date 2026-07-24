import { NextRequest, NextResponse } from "next/server";
import {
  DeliveryQuoteError,
  getDeliveryBackendConfiguration,
} from "@/lib/delivery-quote";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const MAX_REQUEST_BYTES = 2_048;
const REQUESTS_PER_MINUTE = 30;
const rateBuckets = new Map<string, { count: number; resetAt: number }>();

type AutocompleteInput = {
  input?: unknown;
  sessionToken?: unknown;
};

type GoogleAutocompleteResponse = {
  suggestions?: Array<{
    placePrediction?: {
      placeId?: unknown;
      text?: { text?: unknown };
    };
  }>;
};

export async function POST(request: NextRequest) {
  const rateLimit = takeRateLimit(clientAddress(request));
  if (!rateLimit.allowed) {
    return NextResponse.json(
      { error: "Too many address searches. Please wait a minute and try again." },
      { status: 429, headers: { "retry-after": String(rateLimit.retryAfterSeconds) } },
    );
  }

  let configuration: ReturnType<typeof getDeliveryBackendConfiguration>;
  try {
    configuration = getDeliveryBackendConfiguration();
  } catch (error) {
    return configurationError(error);
  }
  if (!configuration.googleMapsApiKey) {
    return NextResponse.json(
      {
        error: "Google address search is not configured for this owner sample.",
        sample: !configuration.commerceLive,
      },
      { status: 503 },
    );
  }

  const parsed = await readBoundedJson(request);
  if (!parsed.ok) return parsed.response;
  const input = parsed.value as AutocompleteInput;
  const searchText = typeof input.input === "string" ? input.input.replace(/\s+/g, " ").trim() : "";
  if (searchText.length < 2 || searchText.length > 120) {
    return NextResponse.json({ error: "Enter between 2 and 120 characters to search for an address." }, { status: 400 });
  }
  const sessionToken = validSessionToken(input.sessionToken);
  if (input.sessionToken !== undefined && !sessionToken) {
    return NextResponse.json({ error: "The address-search session is invalid." }, { status: 400 });
  }

  const body: Record<string, unknown> = {
    input: searchText,
    includedRegionCodes: ["au"],
    includedPrimaryTypes: ["street_address", "premise", "subpremise"],
    includeQueryPredictions: false,
    languageCode: "en-AU",
    regionCode: "au",
    locationBias: {
      circle: {
        center: { latitude: -37.58, longitude: 144.93 },
        radius: 50_000,
      },
    },
  };
  if (sessionToken) body.sessionToken = sessionToken;

  try {
    const response = await fetch("https://places.googleapis.com/v1/places:autocomplete", {
      method: "POST",
      headers: {
        "content-type": "application/json",
        "x-goog-api-key": configuration.googleMapsApiKey,
        "x-goog-fieldmask": "suggestions.placePrediction.placeId,suggestions.placePrediction.text.text",
      },
      body: JSON.stringify(body),
      signal: AbortSignal.timeout(8_000),
      cache: "no-store",
    });
    if (!response.ok) {
      console.error("Google Places autocomplete failed", { status: response.status });
      return NextResponse.json(
        { error: "Address search is temporarily unavailable." },
        { status: response.status === 429 ? 429 : 503 },
      );
    }

    const payload = await response.json() as GoogleAutocompleteResponse;
    const suggestions = (payload.suggestions ?? [])
      .flatMap((suggestion) => {
        const placeId = suggestion.placePrediction?.placeId;
        const text = suggestion.placePrediction?.text?.text;
        return typeof placeId === "string" && typeof text === "string"
          ? [{ placeId, text: text.replace(/\s+/g, " ").trim() }]
          : [];
      })
      .filter((suggestion) => suggestion.placeId.length <= 256 && suggestion.text.length <= 300)
      .slice(0, 6);

    return NextResponse.json(
      { suggestions },
      { headers: { "cache-control": "no-store" } },
    );
  } catch (error) {
    console.error("Google Places autocomplete request failed", error);
    return NextResponse.json({ error: "Address search is temporarily unavailable." }, { status: 503 });
  }
}

async function readBoundedJson(
  request: NextRequest,
): Promise<{ ok: true; value: unknown } | { ok: false; response: NextResponse }> {
  const contentLength = Number(request.headers.get("content-length") ?? 0);
  if (Number.isFinite(contentLength) && contentLength > MAX_REQUEST_BYTES) {
    return { ok: false, response: NextResponse.json({ error: "Address search is too large." }, { status: 413 }) };
  }
  try {
    const raw = await request.text();
    if (Buffer.byteLength(raw, "utf8") > MAX_REQUEST_BYTES) {
      return { ok: false, response: NextResponse.json({ error: "Address search is too large." }, { status: 413 }) };
    }
    const value = JSON.parse(raw) as unknown;
    if (!value || typeof value !== "object" || Array.isArray(value)) {
      return { ok: false, response: NextResponse.json({ error: "Invalid address search." }, { status: 400 }) };
    }
    return { ok: true, value };
  } catch {
    return { ok: false, response: NextResponse.json({ error: "Invalid address search." }, { status: 400 }) };
  }
}

function validSessionToken(value: unknown): string {
  if (value === undefined || value === null || value === "") return "";
  return typeof value === "string" && /^[A-Za-z0-9_-]{8,128}$/.test(value) ? value : "";
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

function configurationError(error: unknown): NextResponse {
  if (error instanceof DeliveryQuoteError && error.code === "configuration") {
    console.error("Delivery address configuration error", error.message);
    return NextResponse.json({ error: "Google address search is not configured." }, { status: 503 });
  }
  console.error("Unable to load address-search configuration", error);
  return NextResponse.json({ error: "Address search is temporarily unavailable." }, { status: 503 });
}
