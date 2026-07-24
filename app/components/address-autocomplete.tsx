"use client";

import { useEffect, useRef, useState } from "react";
import { formatAud } from "../../lib/catalogue";

export type ExpressQuote = {
  quoteToken: string;
  address: string;
  placeId: string;
  distanceMeters: number;
  durationSeconds: number;
  deliveryFeeCents: number;
  rateCentsPerKm: number;
  sample: boolean;
  expiresAt: string;
  notice?: string;
};

type Suggestion = { placeId: string; text: string };

export default function AddressAutocomplete({
  previewMode,
  defaultAddress = "",
  onQuoteChange,
}: {
  previewMode: boolean;
  defaultAddress?: string;
  onQuoteChange: (quote: ExpressQuote | null) => void;
}) {
  const [address, setAddress] = useState(defaultAddress);
  const [placeId, setPlaceId] = useState("");
  const [suggestions, setSuggestions] = useState<Suggestion[]>([]);
  const [quote, setQuote] = useState<ExpressQuote | null>(null);
  const [searching, setSearching] = useState(false);
  const [quoting, setQuoting] = useState(false);
  const [error, setError] = useState("");
  const [searchUnavailable, setSearchUnavailable] = useState(false);
  const sessionToken = useRef(createSessionToken());

  useEffect(() => {
    if (placeId || address.trim().length < 3 || searchUnavailable) return;
    const controller = new AbortController();
    const timer = window.setTimeout(async () => {
      setSearching(true);
      try {
        const response = await fetch("/api/delivery/autocomplete", {
          method: "POST",
          headers: { "content-type": "application/json" },
          body: JSON.stringify({ input: address, sessionToken: sessionToken.current }),
          signal: controller.signal,
        });
        const payload = await response.json() as { suggestions?: Suggestion[]; error?: string; sample?: boolean };
        if (!response.ok) {
          if (response.status === 503 && previewMode) {
            setSearchUnavailable(true);
            setError("Google address search activates when the owner adds the Maps key. You can calculate a clearly marked sample quote for this preview.");
            return;
          }
          throw new Error(payload.error || "Address search is unavailable");
        }
        setSuggestions(Array.isArray(payload.suggestions) ? payload.suggestions : []);
        setError("");
      } catch (caught) {
        if (controller.signal.aborted) return;
        setError(caught instanceof Error ? caught.message : "Address search is unavailable");
      } finally {
        if (!controller.signal.aborted) setSearching(false);
      }
    }, 350);
    return () => {
      window.clearTimeout(timer);
      controller.abort();
    };
  }, [address, placeId, previewMode, searchUnavailable]);

  async function requestQuote(nextPlaceId = placeId, nextAddress = address) {
    setSearching(false);
    setQuoting(true);
    setError("");
    setQuote(null);
    onQuoteChange(null);
    try {
      const response = await fetch("/api/delivery/quote", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({
          placeId: nextPlaceId,
          address: nextAddress,
          sessionToken: sessionToken.current,
        }),
      });
      const payload = await response.json() as Partial<ExpressQuote> & { error?: string };
      if (
        !response.ok ||
        !payload.quoteToken ||
        !payload.address ||
        typeof payload.deliveryFeeCents !== "number" ||
        typeof payload.distanceMeters !== "number" ||
        typeof payload.durationSeconds !== "number"
      ) {
        throw new Error(payload.error || "The delivery route could not be calculated");
      }
      const nextQuote = payload as ExpressQuote;
      setAddress(nextQuote.address);
      setPlaceId(nextQuote.placeId);
      setQuote(nextQuote);
      setSuggestions([]);
      onQuoteChange(nextQuote);
      sessionToken.current = createSessionToken();
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "The delivery route could not be calculated");
    } finally {
      setQuoting(false);
    }
  }

  function chooseSuggestion(suggestion: Suggestion) {
    setSearching(false);
    setAddress(suggestion.text);
    setPlaceId(suggestion.placeId);
    setSuggestions([]);
    void requestQuote(suggestion.placeId, suggestion.text);
  }

  function changeAddress(value: string) {
    // A new keystroke aborts the in-flight request in the effect cleanup. Set
    // this immediately as an aborted request intentionally skips its `finally`
    // update, otherwise shortening the input can leave “Searching…” stuck.
    setSearching(false);
    setAddress(value);
    setPlaceId("");
    setSuggestions([]);
    setQuote(null);
    onQuoteChange(null);
    setError("");
  }

  return (
    <div className="address-autocomplete">
      <label htmlFor="express-address">Delivery address</label>
      <div className="address-search-wrap">
        <input
          id="express-address"
          name="address"
          value={address}
          onChange={(event) => changeAddress(event.target.value)}
          placeholder="Start typing a street address"
          autoComplete="street-address"
          role="combobox"
          aria-autocomplete="list"
          aria-expanded={suggestions.length > 0}
          aria-controls="address-suggestions"
          required
        />
        <span role="status" aria-live="polite">{searching ? "Searching…" : "Google address search"}</span>
        {suggestions.length > 0 ? (
          <div id="address-suggestions" className="address-suggestions" role="listbox">
            {suggestions.map((suggestion) => (
              <button
                key={suggestion.placeId}
                type="button"
                role="option"
                aria-selected="false"
                onClick={() => chooseSuggestion(suggestion)}
              >
                <span>⌖</span>{suggestion.text}
              </button>
            ))}
            <small>Powered by Google</small>
          </div>
        ) : null}
      </div>
      <input type="hidden" name="placeId" value={placeId} />
      <input type="hidden" name="deliveryQuoteToken" value={quote?.quoteToken ?? ""} />

      {!quote && previewMode ? (
        <button
          className="sample-quote-button"
          type="button"
          disabled={quoting || address.trim().length < 8}
          onClick={() => void requestQuote()}
        >
          {quoting ? "Calculating…" : searchUnavailable ? "Calculate sample quote" : "Check express delivery"}
        </button>
      ) : null}
      {quoting && !previewMode ? <p className="address-status">Calculating the road distance…</p> : null}
      {error ? <p className="address-error" role="alert">{error}</p> : null}
      {quote ? (
        <div className={`delivery-quote ${quote.sample ? "sample" : ""}`}>
          <div><span>Road distance</span><strong>{(quote.distanceMeters / 1_000).toFixed(1)} km</strong></div>
          <div><span>Estimated drive</span><strong>{Math.max(1, Math.round(quote.durationSeconds / 60))} min</strong></div>
          <div><span>$1.50 per km</span><strong>{formatAud(quote.deliveryFeeCents)}</strong></div>
          {quote.sample ? <small>Sample only · Google route not configured · rejected by live checkout</small> : null}
        </div>
      ) : null}
    </div>
  );
}

function createSessionToken(): string {
  return typeof crypto !== "undefined" && "randomUUID" in crypto
    ? crypto.randomUUID()
    : `${Date.now().toString(36)}${Math.random().toString(36).slice(2)}`;
}
