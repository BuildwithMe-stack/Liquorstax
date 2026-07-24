"use client";

import Image from "next/image";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { FormEvent, useEffect, useMemo, useRef, useState } from "react";
import {
  AUSPOST_NEXT_DAY_DEFAULT_FEE_CENTS,
  CATALOGUE_PREVIEW_ONLY,
  MAINTENANCE_FEE_CENTS,
  alcoholTypes,
  businessInfo,
  formatAud,
  offerSlides,
  products,
  storeHighlights,
} from "@/lib/catalogue";
import type { OfferSlide, Product } from "@/lib/catalogue";
import {
  buildAustraliaPostNextBusinessDayOption,
  buildDeliveryOptions,
  describeDeliverySlot,
} from "@/lib/delivery";
import AddressAutocomplete, { type ExpressQuote } from "@/app/components/address-autocomplete";

export type StorefrontPage = "home" | "products" | "cart" | "lists" | "account" | "about";

type Profile = {
  name: string;
  email: string;
  phone: string;
};

type RecentOrder = {
  orderNumber: string;
  deliverySlot: string;
  totalCents: number;
  itemIds: number[];
  createdAt: string;
  mode?: "sample" | "paid";
};

type PendingPayment = Omit<RecentOrder, "mode">;

type PersistedStore = {
  profile: Profile | null;
  cart: Record<number, number>;
  savedIds: number[];
  recentOrders: RecentOrder[];
};

const STORE_KEY = "liquor-stax-owner-sample-v2";
const AGE_KEY = "liquor-stax-age-confirmed";
const PENDING_PAYMENT_KEY = "liquor-stax-pending-payment-v1";
const CHECKOUT_ATTEMPT_KEY = "liquor-stax-checkout-attempt-v1";
const LIVE_CATALOGUE_MODE = !CATALOGUE_PREVIEW_ONLY
  || process.env.NEXT_PUBLIC_COMMERCE_LIVE === "true";

type CatalogueStatus = "loading" | "ready" | "unavailable";

function maxPurchasableQuantity(product: Product): number {
  if (product.placeholder || product.priceCents < 1) return 0;
  if (product.inventoryQuantity === undefined) return LIVE_CATALOGUE_MODE ? 0 : 24;
  return Math.max(0, Math.min(24, Math.floor(product.inventoryQuantity)));
}

const pageLinks = [
  { href: "/", label: "Home", page: "home", icon: "⌂" },
  { href: "/products", label: "Products", page: "products", icon: "▦" },
  { href: "/cart", label: "Cart", page: "cart", icon: "▣" },
  { href: "/lists", label: "My lists", page: "lists", icon: "♡" },
  { href: "/account", label: "Account", page: "account", icon: "◎" },
  { href: "/about", label: "About us", page: "about", icon: "ⓘ" },
] as const;

function BrandLogo({ className = "", preload = false }: { className?: string; preload?: boolean }) {
  return (
    <Image
      src="/brand/liquor-stax-craigieburn-logo.jpg"
      alt="Liquor Stax Craigieburn"
      width={224}
      height={224}
      className={`brand-logo ${className}`.trim()}
      preload={preload}
    />
  );
}

function initials(name?: string) {
  if (!name) return "?";
  return name.split(/\s+/).slice(0, 2).map((part) => part[0]?.toUpperCase()).join("");
}

export default function Storefront({
  page = "home",
  initialProductType = "All",
  initialProductQuery = "",
  initialSaleOnly = false,
}: {
  page?: StorefrontPage;
  initialProductType?: string;
  initialProductQuery?: string;
  initialSaleOnly?: boolean;
}) {
  const router = useRouter();
  const [ageState, setAgeState] = useState<"loading" | "required" | "confirmed">("loading");
  const [hydrated, setHydrated] = useState(false);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [cart, setCart] = useState<Record<number, number>>({});
  const [savedIds, setSavedIds] = useState<number[]>([]);
  const [recentOrders, setRecentOrders] = useState<RecentOrder[]>([]);
  const [signUpOpen, setSignUpOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [offerIndex, setOfferIndex] = useState(0);
  const [catalogueProducts, setCatalogueProducts] = useState<Product[]>(
    LIVE_CATALOGUE_MODE ? [] : [...products],
  );
  const [activeOfferSlides, setActiveOfferSlides] = useState<OfferSlide[]>(
    LIVE_CATALOGUE_MODE ? [] : [...offerSlides],
  );
  const [catalogueStatus, setCatalogueStatus] = useState<CatalogueStatus>(
    LIVE_CATALOGUE_MODE ? "loading" : "ready",
  );
  const [selectedType, setSelectedType] = useState<string>("All");
  const [saleOnly, setSaleOnly] = useState(false);
  const [checkoutState, setCheckoutState] = useState<"idle" | "loading" | "verifying" | "pending" | "success" | "error">("idle");
  const [checkoutError, setCheckoutError] = useState("");
  const [completedOrder, setCompletedOrder] = useState<RecentOrder | null>(null);
  const publicLicenceNumber = process.env.NEXT_PUBLIC_LIQUOR_LICENCE_NUMBER?.trim();

  /* eslint-disable react-hooks/set-state-in-effect -- restore the owner sample from browser storage after hydration */
  useEffect(() => {
    setAgeState(window.localStorage.getItem(AGE_KEY) === "yes" ? "confirmed" : "required");
    const raw = window.localStorage.getItem(STORE_KEY);
    if (raw) {
      try {
        const saved = JSON.parse(raw) as Partial<PersistedStore>;
        if (saved.profile) setProfile(saved.profile);
        if (saved.cart) setCart(saved.cart);
        if (Array.isArray(saved.savedIds)) setSavedIds(saved.savedIds);
        if (Array.isArray(saved.recentOrders)) setRecentOrders(saved.recentOrders);
      } catch {
        window.localStorage.removeItem(STORE_KEY);
      }
    }

    if (page === "products") {
      setSelectedType(initialProductType);
      setSearchQuery(initialProductQuery);
      setSaleOnly(initialSaleOnly);
    }
    setHydrated(true);
  }, [initialProductQuery, initialProductType, initialSaleOnly, page]);
  /* eslint-enable react-hooks/set-state-in-effect */

  useEffect(() => {
    if (!hydrated) return;
    const payload: PersistedStore = { profile, cart, savedIds, recentOrders };
    window.localStorage.setItem(STORE_KEY, JSON.stringify(payload));
  }, [cart, hydrated, profile, recentOrders, savedIds]);

  useEffect(() => {
    if (!hydrated) return;
    const controller = new AbortController();
    void fetch("/api/catalogue", { signal: controller.signal })
      .then(async (response) => response.ok ? response.json() : Promise.reject(new Error("Catalogue unavailable")))
      .then((data: { products?: Product[]; offers?: OfferSlide[] }) => {
        if (!Array.isArray(data.products) || !Array.isArray(data.offers)) {
          throw new Error("Catalogue response was incomplete");
        }
        // A successful server catalogue replaces the archived design cards.
        // In preview, legacy cards are only an offline fallback while the
        // owner-supplied stock import is loading.
        setCatalogueProducts(data.products.length ? data.products : LIVE_CATALOGUE_MODE ? [] : [...products]);
        setActiveOfferSlides(data.offers.length ? data.offers : [...offerSlides]);
        setOfferIndex(0);
        setCatalogueStatus("ready");
      })
      .catch(() => {
        if (controller.signal.aborted) return;
        if (LIVE_CATALOGUE_MODE) {
          setCatalogueProducts([]);
          setActiveOfferSlides([]);
          setCatalogueStatus("unavailable");
          return;
        }
        setCatalogueProducts([...products]);
        setActiveOfferSlides([...offerSlides]);
        setCatalogueStatus("ready");
      });
    return () => controller.abort();
  }, [hydrated]);
  useEffect(() => {
    if (page !== "home" || activeOfferSlides.length < 2) return;
    const timer = window.setInterval(() => {
      setOfferIndex((current) => (current + 1) % activeOfferSlides.length);
    }, 6500);
    return () => window.clearInterval(timer);
  }, [activeOfferSlides.length, page]);

  /* eslint-disable react-hooks/set-state-in-effect -- reconcile a signed Stripe return with server payment state */
  useEffect(() => {
    if (!hydrated || page !== "cart") return;
    const params = new URLSearchParams(window.location.search);
    const payment = params.get("payment");
    if (payment === "cancelled") {
      setCheckoutError("Payment was cancelled. Your cart is still here when you’re ready.");
      setCheckoutState("error");
      window.history.replaceState({}, "", "/cart");
      return;
    }
    const sessionId = params.get("session_id");
    if (payment !== "success" || !sessionId) return;

    const controller = new AbortController();
    setCheckoutState("verifying");
    const verify = async () => {
      try {
        for (let attempt = 0; attempt < 6; attempt += 1) {
          const response = await fetch(`/api/payments/status?session_id=${encodeURIComponent(sessionId)}`, {
            cache: "no-store",
            signal: controller.signal,
          });
          const result = await response.json() as {
            status?: "pending" | "paid";
            orderNumber?: string;
            deliverySlot?: string;
            totalCents?: number;
            itemIds?: number[];
            error?: string;
          };
          if (!response.ok) throw new Error(result.error || "We couldn’t verify that payment");
          if (result.status === "paid" && result.orderNumber && result.deliverySlot) {
            const stored = window.localStorage.getItem(PENDING_PAYMENT_KEY);
            let pending: PendingPayment | undefined;
            if (stored) {
              try { pending = JSON.parse(stored) as PendingPayment; } catch { /* use verified server values */ }
            }
            const order: RecentOrder = {
              orderNumber: result.orderNumber,
              deliverySlot: result.deliverySlot,
              totalCents: result.totalCents ?? pending?.totalCents ?? 0,
              itemIds: result.itemIds ?? pending?.itemIds ?? [],
              createdAt: pending?.createdAt ?? new Date().toISOString(),
              mode: "paid",
            };
            setRecentOrders((current) => [order, ...current.filter((item) => item.orderNumber !== order.orderNumber)].slice(0, 8));
            setCompletedOrder(order);
            setCart({});
            setCheckoutState("success");
            window.localStorage.removeItem(PENDING_PAYMENT_KEY);
            window.sessionStorage.removeItem(CHECKOUT_ATTEMPT_KEY);
            window.history.replaceState({}, "", "/cart");
            return;
          }
          await new Promise((resolve) => window.setTimeout(resolve, 1200));
        }
        setCheckoutError("Payment is still processing. Check again in a moment; your cart is locked to prevent a second charge.");
        setCheckoutState("pending");
      } catch (error) {
        if (controller.signal.aborted) return;
        setCheckoutError(error instanceof Error ? error.message : "We couldn’t verify that payment");
        setCheckoutState("pending");
      }
    };
    void verify();
    return () => controller.abort();
  }, [hydrated, page]);
  /* eslint-enable react-hooks/set-state-in-effect */

  const cartItems = useMemo(
    () => catalogueProducts.flatMap((product) => {
      const quantity = Math.min(cart[product.id] || 0, maxPurchasableQuantity(product));
      return quantity > 0 ? [{ ...product, quantity }] : [];
    }),
    [cart, catalogueProducts],
  );
  const itemCount = cartItems.reduce((sum, item) => sum + item.quantity, 0);
  const subtotalCents = cartItems.reduce((sum, item) => sum + item.priceCents * item.quantity, 0);

  function addToCart(id: number, quantity = 1) {
    const product = catalogueProducts.find((candidate) => candidate.id === id);
    if (!product) return;
    const maximum = maxPurchasableQuantity(product);
    if (!maximum) return;
    setCart((current) => ({ ...current, [id]: Math.min(maximum, (current[id] || 0) + quantity) }));
  }

  function updateQuantity(id: number, amount: number) {
    const product = catalogueProducts.find((candidate) => candidate.id === id);
    const maximum = product ? maxPurchasableQuantity(product) : 0;
    setCart((current) => {
      const next = Math.max(0, Math.min(maximum, (current[id] || 0) + amount));
      const updated = { ...current, [id]: next };
      if (!next) delete updated[id];
      return updated;
    });
  }

  function toggleSaved(id: number) {
    setSavedIds((current) => current.includes(id) ? current.filter((savedId) => savedId !== id) : [...current, id]);
  }

  function search(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const query = searchQuery.trim();
    const params = new URLSearchParams();
    if (query) params.set("q", query);
    if (selectedType !== "All") params.set("type", selectedType);
    router.push(params.size ? `/products?${params.toString()}` : "/products");
  }

  function orderAgain(order: RecentOrder) {
    const next = { ...cart };
    for (const id of order.itemIds) {
      const product = catalogueProducts.find((candidate) => candidate.id === id);
      if (!product) continue;
      const maximum = maxPurchasableQuantity(product);
      next[id] = Math.min(maximum, (next[id] || 0) + 1);
      if (!next[id]) delete next[id];
    }
    setCart(next);
    router.push("/cart");
  }

  async function submitCheckout(
    event: FormEvent<HTMLFormElement>,
    deliveryMethod: "express" | "normal",
    deliverySlot: string,
    receiptPreference: "email" | "sms" | "both",
    displayedTotalCents: number,
  ) {
    event.preventDefault();
    setCheckoutState("loading");
    setCheckoutError("");
    const data = new FormData(event.currentTarget);
    const checkoutDraft = {
      ageConfirmed: data.get("ageConfirmed") === "yes",
      items: cartItems.map((item) => ({ productId: item.id, quantity: item.quantity })),
      deliveryMethod,
      deliverySlot,
      deliveryQuoteToken: data.get("deliveryQuoteToken"),
      paymentMethod: "card",
      receiptPreference,
      customer: {
        name: data.get("name"),
        email: data.get("email"),
        phone: data.get("phone"),
        address: data.get("address"),
        placeId: data.get("placeId"),
        instructions: data.get("instructions"),
      },
    };
    const checkoutToken = await checkoutAttemptToken(checkoutDraft);
    const payload = { ...checkoutDraft, checkoutToken };

    try {
      const commerceLive = process.env.NEXT_PUBLIC_COMMERCE_LIVE === "true";
      const response = await fetch(commerceLive ? "/api/payments/checkout" : "/api/checkout", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify(payload),
      });
      const result = await response.json() as { url?: string; orderNumber?: string; totalCents?: number; error?: string };
      if (!response.ok) {
        window.sessionStorage.removeItem(CHECKOUT_ATTEMPT_KEY);
        throw new Error(result.error || "We couldn’t place that order");
      }
      if (result.url) {
        if (!result.orderNumber) throw new Error("The secure payment session was incomplete");
        const pending: PendingPayment = {
          orderNumber: result.orderNumber,
          deliverySlot,
          totalCents: result.totalCents ?? displayedTotalCents,
          itemIds: cartItems.flatMap((item) => Array.from({ length: item.quantity }, () => item.id)),
          createdAt: new Date().toISOString(),
        };
        window.localStorage.setItem(PENDING_PAYMENT_KEY, JSON.stringify(pending));
        window.location.assign(result.url);
        return;
      }
      if (!result.orderNumber) throw new Error("The order confirmation was incomplete");

      const order: RecentOrder = {
        orderNumber: result.orderNumber,
        deliverySlot,
        totalCents: result.totalCents ?? displayedTotalCents,
        itemIds: cartItems.flatMap((item) => Array.from({ length: item.quantity }, () => item.id)),
        createdAt: new Date().toISOString(),
        mode: "sample",
      };
      setRecentOrders((current) => [order, ...current].slice(0, 8));
      setCompletedOrder(order);
      setCart({});
      setCheckoutState("success");
      window.sessionStorage.removeItem(CHECKOUT_ATTEMPT_KEY);
    } catch (error) {
      setCheckoutError(error instanceof Error ? error.message : "We couldn’t place that order");
      setCheckoutState("error");
    }
  }

  if (ageState !== "confirmed") {
    return (
      <main className="site-frame">
        <div className="age-gate" role={ageState === "required" ? "dialog" : "status"} aria-modal={ageState === "required" ? "true" : undefined} aria-labelledby="age-title">
          <div className="age-card">
            <BrandLogo className="brand-logo-large" preload />
            <p className="eyebrow">Welcome to Liquor Stax</p>
            <h1 id="age-title">{ageState === "loading" ? "Checking your entry…" : "Are you 18 or over?"}</h1>
            <p>{ageState === "loading" ? "The shop will open once your age confirmation is ready." : "You must be of legal drinking age to enter. Valid photo ID is required on delivery."}</p>
            {ageState === "required" ? (
              <>
                <button className="button primary full" onClick={() => { window.localStorage.setItem(AGE_KEY, "yes"); setAgeState("confirmed"); }}>Yes, I’m 18 or over</button>
                <a className="text-link" href="https://www.drinkwise.org.au/" rel="noreferrer">No, take me to DrinkWise</a>
              </>
            ) : null}
          </div>
        </div>
      </main>
    );
  }

  const cataloguePage = page === "home" || page === "products" || page === "cart" || page === "lists";
  const catalogueBlocked = LIVE_CATALOGUE_MODE && cataloguePage && catalogueStatus !== "ready";
  const hasStockedCatalogue = catalogueProducts.some(
    (product) => !product.placeholder && product.priceCents > 0 && product.inventoryQuantity !== undefined,
  );
  const showPreviewContent = !LIVE_CATALOGUE_MODE && !hasStockedCatalogue;

  return (
    <main className="site-frame">
      <div className="welcome-strip">
        <div className="shell welcome-inner">
          {profile ? (
            <strong>Hello, {profile.name.split(" ")[0]}. What would you like today?</strong>
          ) : (
            <><span>New here? Join Stax for member offers and faster checkout.</span><button onClick={() => setSignUpOpen(true)}>Sign up</button><button onClick={() => setSignUpOpen(true)}>Log in</button></>
          )}
          <span className="welcome-hours">Open today · Check store hours</span>
        </div>
      </div>

      <header className="site-header">
        <div className="header-main shell">
          <Link className="brand" href="/" aria-label="Liquor Stax home">
            <BrandLogo className="brand-logo-header" preload />
            <span className="brand-name">LIQUOR <b>STAX</b><small>CRAIGIEBURN</small></span>
          </Link>
          <form className="search" onSubmit={search}>
            <span aria-hidden="true">⌕</span>
            <select value={selectedType} onChange={(event) => setSelectedType(event.target.value)} aria-label="Filter search by drink type">
              <option value="All">All drinks</option>
              {alcoholTypes.map((type) => <option value={type} key={type}>{type}</option>)}
            </select>
            <input value={searchQuery} onChange={(event) => setSearchQuery(event.target.value)} placeholder="Search whisky, premix, beer & more" aria-label="Search products" />
            <button aria-label="Search">Search</button>
          </form>
          <Link className="delivery-button" href="/cart#delivery">
            <span className="header-symbol">⌖</span><span><small>Express or normal</small><strong>Choose at checkout</strong></span>
          </Link>
          <button className="profile-button" onClick={() => profile ? router.push("/account") : setSignUpOpen(true)} aria-label={profile ? `Open ${profile.name} account` : "Sign up or log in"}>
            <span>{profile ? initials(profile.name) : "◎"}</span><small>{profile ? "Account" : "Sign up"}</small>
          </button>
          <Link className="cart-button" href="/cart" aria-label={`Open cart with ${itemCount} items`}><span>Bag</span><b>{itemCount}</b></Link>
        </div>
        <nav className="primary-nav shell" aria-label="Main navigation">
          {pageLinks.map((link) => <Link key={link.href} href={link.href} className={page === link.page ? "active" : ""}>{link.label}</Link>)}
          <Link className="sale-nav" href="/products?offer=sale">Stax deals</Link>
        </nav>
      </header>

      {catalogueBlocked ? (
        <CatalogueStatusPanel status={catalogueStatus} />
      ) : (
        <>
          {page === "home" && (
            <HomePage
              offerIndex={offerIndex}
              setOfferIndex={setOfferIndex}
              profile={profile}
              recentOrders={recentOrders}
              savedIds={savedIds}
              addToCart={addToCart}
              toggleSaved={toggleSaved}
              orderAgain={orderAgain}
              openSignUp={() => setSignUpOpen(true)}
              catalogueProducts={catalogueProducts}
              slides={activeOfferSlides}
              showPreviewContent={showPreviewContent}
            />
          )}
          {page === "products" && <ProductsPage catalogueProducts={catalogueProducts} selectedType={selectedType} setSelectedType={setSelectedType} saleOnly={saleOnly} setSaleOnly={setSaleOnly} query={searchQuery} savedIds={savedIds} addToCart={addToCart} toggleSaved={toggleSaved} profile={profile} showPreviewContent={showPreviewContent} />}
          {page === "cart" && <CartPage items={cartItems} updateQuantity={updateQuantity} subtotalCents={subtotalCents} profile={profile} checkoutState={checkoutState} checkoutError={checkoutError} completedOrder={completedOrder} submitCheckout={submitCheckout} />}
          {page === "lists" && <ListsPage catalogueProducts={catalogueProducts} savedIds={savedIds} addToCart={addToCart} toggleSaved={toggleSaved} profile={profile} />}
        </>
      )}
      {page === "account" && <AccountPage profile={profile} recentOrders={recentOrders} openSignUp={() => setSignUpOpen(true)} orderAgain={orderAgain} />}
      {page === "about" && <AboutPage />}

      <footer className="site-footer">
        <div className="shell footer-grid">
          <div><div className="footer-brand"><BrandLogo className="brand-logo-footer" /><span>LIQUOR <b>STAX</b></span></div><p>Your Craigieburn local for good drinks, flexible delivery and responsible service.</p></div>
          <div><strong>Shop</strong><Link href="/products?type=Whisky">Whisky</Link><Link href="/products?type=Premix">Premix</Link><Link href="/products?offer=sale">Offers</Link></div>
          <div><strong>Visit</strong><p>{businessInfo.address}</p><a href={`mailto:${businessInfo.email}`}>{businessInfo.email}</a></div>
          <div><strong>Responsible service</strong><p>No alcohol can be sold or supplied to anyone under 18. Valid photo ID is checked at delivery.</p><p>{publicLicenceNumber ? `Liquor licence ${publicLicenceNumber}` : "Owner preview · licence number required before live ordering"}</p><Link href="/admin/dispatch">Owner delivery report</Link></div>
        </div>
        <div className="shell powered-by"><span>Powered by <strong>Techbykennedy</strong></span><a href="mailto:techbykennedy@gmail.com">techbykennedy@gmail.com</a><a href="mailto:buildwithme@techbykennedy.org">buildwithme@techbykennedy.org</a><a href="tel:+61450683088">+61 450 683 088</a><Link href="/admin/login">Owner login</Link></div>
      </footer>

      <nav className="mobile-nav" aria-label="Mobile navigation">
        {pageLinks.map((link) => <Link key={link.href} href={link.href} className={page === link.page ? "active" : ""}><span>{link.icon}</span>{link.label}</Link>)}
      </nav>

      {signUpOpen && <SignUpModal current={profile} close={() => setSignUpOpen(false)} save={(next) => { setProfile(next); setSignUpOpen(false); }} />}
    </main>
  );
}

function CatalogueStatusPanel({ status }: { status: CatalogueStatus }) {
  const loading = status === "loading";
  return (
    <div className="page-shell shell">
      <section className="empty-state" role="status" aria-live="polite">
        <span>{loading ? "↻" : "!"}</span>
        <h1>{loading ? "Loading the current shop catalogue…" : "The current catalogue is temporarily unavailable."}</h1>
        <p>{loading ? "Products and offers will appear as soon as the live catalogue responds." : "Checkout is paused so archived sample products can never be charged."}</p>
        {!loading && <button className="button primary" onClick={() => window.location.reload()}>Try again</button>}
      </section>
    </div>
  );
}

function HomePage({
  offerIndex,
  setOfferIndex,
  profile,
  recentOrders,
  savedIds,
  addToCart,
  toggleSaved,
  orderAgain,
  openSignUp,
  catalogueProducts,
  slides,
  showPreviewContent,
}: {
  offerIndex: number;
  setOfferIndex: (value: number) => void;
  profile: Profile | null;
  recentOrders: RecentOrder[];
  savedIds: number[];
  addToCart: (id: number, quantity?: number) => void;
  toggleSaved: (id: number) => void;
  orderAgain: (order: RecentOrder) => void;
  openSignUp: () => void;
  catalogueProducts: Product[];
  slides: OfferSlide[];
  showPreviewContent: boolean;
}) {
  const slide = slides.length ? slides[offerIndex % slides.length] : undefined;
  const usedRailIds = new Set<number>();
  const takeRail = (candidates: Product[], maximum = 14) => candidates
    .filter((product) => !usedRailIds.has(product.id))
    .slice(0, maximum)
    .map((product) => {
      usedRailIds.add(product.id);
      return product;
    });
  const currentOffers = takeRail(catalogueProducts.filter((product) => product.collections.includes("current-offers")));
  const memberOffers = takeRail(catalogueProducts.filter((product) => product.collections.includes("member-offers")));
  const topPicks = takeRail(catalogueProducts.filter((product) => product.collections.includes("top-picks")));
  const catalogue = takeRail(catalogueProducts.filter((product) => product.collections.includes("catalogue")), 16);

  return (
    <>
      {slide ? (
        <section className={`offer-hero shell offer-${slide.tone}`} aria-roledescription="carousel" aria-label="Store offers">
          <div className="offer-copy">
            <p className="eyebrow">{slide.eyebrow}</p>
            <h1>{slide.title}</h1>
            <p>{slide.copy}</p>
            <Link className="button dark" href={slide.href}>{slide.cta}</Link>
            <small>Prices include GST · a $0.99 maintenance fee applies once per order</small>
          </div>
          <div className="offer-photo">
            <Image src={slide.imageSrc} alt={slide.imageAlt} fill className="cover-image" sizes="(max-width: 820px) 100vw, 48vw" preload />
            <span className="offer-sticker">LOCAL<br /><b>STAX</b></span>
          </div>
          <div className="carousel-controls">
            <button onClick={() => setOfferIndex((offerIndex - 1 + slides.length) % slides.length)} aria-label="Previous offer">←</button>
            <div>{slides.map((item, index) => <button key={item.id} className={index === offerIndex ? "active" : ""} onClick={() => setOfferIndex(index)} aria-label={`Show offer ${index + 1}`} />)}</div>
            <button onClick={() => setOfferIndex((offerIndex + 1) % slides.length)} aria-label="Next offer">→</button>
          </div>
        </section>
      ) : (
        <section className="empty-state shell" aria-live="polite">
          <p className="eyebrow">Today at Liquor Stax</p>
          <h1>No daily offers are active right now.</h1>
          <p>Browse the current shop catalogue while the owner prepares the next offer.</p>
          <Link className="button primary" href="/products">Browse products</Link>
        </section>
      )}

      <section className="service-strip shell">
        <div><b>⌖</b><span><strong>Express $10 flat rate</strong><small>Address checked for the delivery zone</small></span></div>
        <div><b>◷</b><span><strong>Normal next available business day</strong><small>Australia Post dispatch</small></span></div>
        <div><b>18+</b><span><strong>ID checked at the door</strong><small>Responsible delivery</small></span></div>
        <div><b>✓</b><span><strong>Secure checkout</strong><small>Apple Pay, Google Pay or card</small></span></div>
      </section>

      {recentOrders.length > 0 && (
        <section className="shell order-again-section">
          <div className="rail-heading"><div><p className="eyebrow">Your favourites, faster</p><h2>Order again</h2></div></div>
          <div className="order-again-card"><div><strong>{recentOrders[0].orderNumber}</strong><span>{describeDeliverySlot(recentOrders[0].deliverySlot)}</span><small>{recentOrders[0].itemIds.length} {recentOrders[0].itemIds.length === 1 ? "item" : "items"} · {formatAud(recentOrders[0].totalCents)}</small></div><button className="button primary" onClick={() => orderAgain(recentOrders[0])}>Add again</button></div>
        </section>
      )}

      <ProductRail title="Current offers" eyebrow="On the counter" copy="Owner-set offers appear here as soon as they are published from the admin portal." products={currentOffers} savedIds={savedIds} addToCart={addToCart} toggleSaved={toggleSaved} profile={profile} />

      {!profile && <section className="member-banner shell"><div><p className="eyebrow light">Stax members</p><h2>Member prices. Faster checkout.</h2><p>Join the sample account to see member pricing, save lists and order again.</p></div><button className="button light" onClick={openSignUp}>Join Stax free</button></section>}

      <ProductRail title="Member offers" eyebrow="More value for members" copy="Sign in to save and quickly reorder the owner-selected member range." products={memberOffers} savedIds={savedIds} addToCart={addToCart} toggleSaved={toggleSaved} profile={profile} memberRail />
      <ProductRail title="Top picks" eyebrow="Craigieburn favourites" copy="A quick swipe through the latest high-stock shop picks." products={topPicks} savedIds={savedIds} addToCart={addToCart} toggleSaved={toggleSaved} profile={profile} />
      <ProductRail title={showPreviewContent ? "Catalogue" : "In-stock catalogue"} eyebrow="Browse the range" copy={showPreviewContent ? "Owner sample range for the new catalogue experience." : "Owner-supplied selling prices and available packs from the latest stock import."} products={catalogue} savedIds={savedIds} addToCart={addToCart} toggleSaved={toggleSaved} profile={profile} />

      <section className="shell type-section">
        <div className="section-title"><div><p className="eyebrow">Shop your way</p><h2>Browse by drink</h2></div><Link href="/products">See all products →</Link></div>
        <div className="type-grid">{alcoholTypes.map((type) => <Link href={`/products?type=${encodeURIComponent(type)}`} key={type}><span>{type.slice(0, 2).toUpperCase()}</span><strong>{type}</strong><small>Browse {type.toLowerCase()}</small></Link>)}</div>
      </section>

      {showPreviewContent && (
        <section className="shell shop-floor-section">
          <div className="section-title"><div><p className="eyebrow">More from the shop floor</p><h2>Ask us about these</h2></div></div>
          <div className="highlight-grid">{storeHighlights.map((item) => <HighlightCard item={item} key={item.title} />)}</div>
        </section>
      )}
    </>
  );
}

function ProductRail({ title, eyebrow, copy, products: railProducts, savedIds, addToCart, toggleSaved, profile, memberRail = false }: {
  title: string;
  eyebrow: string;
  copy: string;
  products: readonly Product[];
  savedIds: number[];
  addToCart: (id: number) => void;
  toggleSaved: (id: number) => void;
  profile: Profile | null;
  memberRail?: boolean;
}) {
  const rail = useRef<HTMLDivElement>(null);
  const move = (direction: number) => rail.current?.scrollBy({ left: direction * Math.min(720, rail.current.clientWidth * 0.85), behavior: "smooth" });
  if (!railProducts.length) return null;
  return (
    <section className="product-rail-section shell">
      <div className="rail-heading"><div><p className="eyebrow">{eyebrow}</p><h2>{title}</h2><p>{copy}</p></div><div className="rail-arrows"><button onClick={() => move(-1)} aria-label={`Scroll ${title} left`}>←</button><button onClick={() => move(1)} aria-label={`Scroll ${title} right`}>→</button></div></div>
      <div className="product-rail" ref={rail}>{railProducts.map((product) => <ProductCard key={product.id} product={product} saved={savedIds.includes(product.id)} add={() => addToCart(product.id)} toggleSaved={() => toggleSaved(product.id)} profile={profile} memberRail={memberRail} />)}</div>
    </section>
  );
}

function ProductCard({ product, saved, add, toggleSaved, profile, memberRail = false }: { product: Product; saved: boolean; add: () => void; toggleSaved: () => void; profile: Profile | null; memberRail?: boolean }) {
  const displayPrice = memberRail && profile && product.memberPriceCents ? product.memberPriceCents : product.priceCents;
  const maximum = maxPurchasableQuantity(product);
  const unavailable = maximum === 0;
  const unavailableLabel = product.placeholder ? "Stock list coming" : "Out of stock";
  return (
    <article className="product-card">
      <div className={`product-visual ${product.tone}`}>
        {product.imageSrc ? (
          <Image src={product.imageSrc} alt={product.imageAlt} fill className="product-image" style={{ objectPosition: product.imagePosition, transform: `scale(${product.imageScale ?? 1})`, transformOrigin: product.imageTransformOrigin }} sizes="(max-width: 600px) 72vw, (max-width: 960px) 38vw, 270px" />
        ) : (
          <ProductArtwork product={product} />
        )}
        <div className="sticker-stack">{product.stickers.map((sticker) => <span className={`sticker sticker-${sticker.toLowerCase().replace(" ", "-")}`} key={sticker}>{sticker}</span>)}</div>
        <button className={`heart ${saved ? "saved" : ""}`} onClick={toggleSaved} aria-label={saved ? `Remove ${product.name} from my list` : `Save ${product.name} to my list`}>{saved ? "♥" : "♡"}</button>
      </div>
      <div className="product-info">
        <p className="product-category">{product.alcoholType}</p>
        <h3>{product.name}</h3>
        <p className="product-detail">{product.detail}</p>
        {product.memberPriceCents && !unavailable && <p className="member-price">Member {formatAud(product.memberPriceCents)}</p>}
        <div className="price-row"><p>{unavailable ? <strong className="stock-coming">{unavailableLabel}</strong> : <><strong>{formatAud(displayPrice)}</strong>{product.wasCents && <del>{formatAud(product.wasCents)}</del>}</>}</p><button onClick={add} disabled={unavailable} aria-label={unavailable ? `${product.name} is not currently available` : `Add ${product.name} to cart`}>{unavailable ? "…" : "+"}</button></div>
        {!unavailable && product.inventoryQuantity !== undefined && <small className="stock-status">{product.inventoryQuantity <= 3 ? `Only ${product.inventoryQuantity} left` : "In stock now"}</small>}
        {product.imageIsIllustrative && <small className="image-note">Illustrative range artwork</small>}
        <small className="archive-label">{product.placeholder ? "Placeholder · not available to purchase" : unavailable ? "Currently unavailable to purchase" : "GST included · $0.99 maintenance fee per order"}</small>
      </div>
    </article>
  );
}

function ProductArtwork({ product, compact = false }: { product: Product; compact?: boolean }) {
  return (
    <div className={`product-artwork ${compact ? "compact" : ""}`} role="img" aria-label={product.imageAlt}>
      <span className="artwork-glow" aria-hidden="true" />
      <span className="artwork-cap" aria-hidden="true" />
      <span className="artwork-bottle" aria-hidden="true"><b>{product.initials}</b><small>{product.alcoholType}</small></span>
      {!compact && <span className="artwork-brand" aria-hidden="true">{product.brand}</span>}
    </div>
  );
}

function ProductsPage({ catalogueProducts, selectedType, setSelectedType, saleOnly, setSaleOnly, query, savedIds, addToCart, toggleSaved, profile, showPreviewContent }: { catalogueProducts: Product[]; selectedType: string; setSelectedType: (value: string) => void; saleOnly: boolean; setSaleOnly: (value: boolean) => void; query: string; savedIds: number[]; addToCart: (id: number) => void; toggleSaved: (id: number) => void; profile: Profile | null; showPreviewContent: boolean }) {
  const normalizedQuery = query.toLowerCase().replace(/whiskey/g, "whisky");
  const filtered = catalogueProducts.filter((product) => (selectedType === "All" || product.alcoholType === selectedType) && (!saleOnly || product.stickers.includes("SALE") || product.stickers.includes("PRICE DROP")) && `${product.name} ${product.brand} ${product.alcoholType}`.toLowerCase().replace(/whiskey/g, "whisky").includes(normalizedQuery));
  return (
    <div className="page-shell shell">
      <header className="page-heading"><p className="eyebrow">The full Stax</p><h1>Products by drink type</h1><p>Whisky stays with whisky, beer with beer and premix with premix—so the range is easy to scan.</p></header>
      <div className="filter-chips" aria-label="Filter by alcohol type"><button className={selectedType === "All" && !saleOnly ? "active" : ""} onClick={() => { setSelectedType("All"); setSaleOnly(false); }}>All</button><button className={saleOnly ? "active" : ""} onClick={() => { setSelectedType("All"); setSaleOnly(true); }}>Deals</button>{alcoholTypes.map((type) => <button key={type} className={selectedType === type && !saleOnly ? "active" : ""} onClick={() => { setSelectedType(type); setSaleOnly(false); }}>{type}</button>)}</div>
      <div className="results-bar"><strong>{filtered.length} catalogue entries</strong><span>{showPreviewContent ? "Placeholders stay unavailable until the owner supplies the stock list" : "Availability reflects the current shop catalogue"}</span></div>
      {filtered.length ? <div className="product-grid">{filtered.map((product) => <ProductCard key={product.id} product={product} saved={savedIds.includes(product.id)} add={() => addToCart(product.id)} toggleSaved={() => toggleSaved(product.id)} profile={profile} />)}</div> : <div className="empty-state"><h2>No matching products yet</h2><p>Try another drink type or clear your search.</p><Link className="button primary" href="/products">Show all</Link></div>}
      {showPreviewContent && <><div className="section-title catalogue-title"><div><p className="eyebrow">In-store catalogue preview</p><h2>More on the shop floor</h2></div></div><div className="highlight-grid">{storeHighlights.filter((item) => selectedType === "All" || item.alcoholType === selectedType).map((item) => <HighlightCard item={item} key={item.title} />)}</div></>}
    </div>
  );
}

type DeliveryAvailability = {
  now: Date;
  expressSlot: string;
  australiaPostSlot: string;
  notice: string;
};

function refreshDeliveryAvailability(
  previous?: DeliveryAvailability,
  now = new Date(),
): DeliveryAvailability {
  const expressOptions = buildDeliveryOptions(now);
  const nextExpressSlot = previous?.expressSlot
    && expressOptions.some((option) => option.id === previous.expressSlot)
    ? previous.expressSlot
    : expressOptions[0]?.id ?? "";
  const nextAustraliaPostSlot = buildAustraliaPostNextBusinessDayOption(now).id;
  const changed = previous !== undefined
    && (nextExpressSlot !== previous.expressSlot
      || nextAustraliaPostSlot !== previous.australiaPostSlot);

  return {
    now,
    expressSlot: nextExpressSlot,
    australiaPostSlot: nextAustraliaPostSlot,
    notice: changed
      ? "Delivery availability changed, so we selected the earliest valid option. Please review it before paying."
      : previous?.notice ?? "",
  };
}

function CartPage({ items, updateQuantity, subtotalCents, profile, checkoutState, checkoutError, completedOrder, submitCheckout }: {
  items: Array<Product & { quantity: number }>;
  updateQuantity: (id: number, amount: number) => void;
  subtotalCents: number;
  profile: Profile | null;
  checkoutState: "idle" | "loading" | "verifying" | "pending" | "success" | "error";
  checkoutError: string;
  completedOrder: RecentOrder | null;
  submitCheckout: (
    event: FormEvent<HTMLFormElement>,
    deliveryMethod: "express" | "normal",
    deliverySlot: string,
    receiptPreference: "email" | "sms" | "both",
    displayedTotalCents: number,
  ) => Promise<void>;
}) {
  const [deliveryAvailability, setDeliveryAvailability] = useState<DeliveryAvailability>(() => refreshDeliveryAvailability());
  const deliveryOptions = useMemo(
    () => buildDeliveryOptions(deliveryAvailability.now),
    [deliveryAvailability.now],
  );
  const australiaPost = useMemo(
    () => buildAustraliaPostNextBusinessDayOption(deliveryAvailability.now),
    [deliveryAvailability.now],
  );
  const dates = Array.from(new Map(deliveryOptions.map((option) => [option.isoDate, option])).values());
  const selectedExpressOption = deliveryOptions.find((option) => option.id === deliveryAvailability.expressSlot)
    ?? deliveryOptions[0];
  const [deliveryMethod, setDeliveryMethod] = useState<"express" | "normal">("express");
  const [expressQuote, setExpressQuote] = useState<ExpressQuote | null>(null);
  const [receiptPreference, setReceiptPreference] = useState<"email" | "sms" | "both">("email");
  const availableWindows = deliveryOptions.filter((option) => option.isoDate === selectedExpressOption?.isoDate);
  const deliverySlot = deliveryMethod === "express"
    ? selectedExpressOption?.id ?? ""
    : australiaPost.id;
  const publicAusPostFee = Number(process.env.NEXT_PUBLIC_AUSPOST_NEXT_DAY_FEE_CENTS);
  const normalDeliveryFeeCents = Number.isInteger(publicAusPostFee) && publicAusPostFee >= 0
    ? publicAusPostFee
    : AUSPOST_NEXT_DAY_DEFAULT_FEE_CENTS;
  const deliveryFeeCents = deliveryMethod === "express"
    ? expressQuote?.deliveryFeeCents ?? 0
    : normalDeliveryFeeCents;
  const totalCents = subtotalCents + deliveryFeeCents + MAINTENANCE_FEE_CENTS;
  const gstIncludedCents = Math.round(totalCents / 11);
  const commerceLive = process.env.NEXT_PUBLIC_COMMERCE_LIVE === "true";
  const cartItemCount = items.reduce((sum, item) => sum + item.quantity, 0);
  const licenceNumber = process.env.NEXT_PUBLIC_LIQUOR_LICENCE_NUMBER?.trim();
  const readyForCheckout = Boolean(deliverySlot)
    && (deliveryMethod === "normal" || Boolean(expressQuote));

  useEffect(() => {
    const refresh = () => setDeliveryAvailability((current) => refreshDeliveryAvailability(current));
    const refreshWhenVisible = () => {
      if (document.visibilityState === "visible") refresh();
    };
    const timer = window.setInterval(refresh, 30_000);
    window.addEventListener("focus", refresh);
    document.addEventListener("visibilitychange", refreshWhenVisible);
    return () => {
      window.clearInterval(timer);
      window.removeEventListener("focus", refresh);
      document.removeEventListener("visibilitychange", refreshWhenVisible);
    };
  }, []);

  function selectExpressSlot(id: string) {
    setDeliveryAvailability((current) => ({ ...current, expressSlot: id, notice: "" }));
  }

  function submitWithFreshDelivery(event: FormEvent<HTMLFormElement>) {
    const refreshed = refreshDeliveryAvailability(deliveryAvailability);
    const refreshedSlot = deliveryMethod === "express"
      ? refreshed.expressSlot
      : refreshed.australiaPostSlot;
    if (refreshedSlot !== deliverySlot) {
      event.preventDefault();
      setDeliveryAvailability(refreshed);
      return;
    }
    setDeliveryAvailability({ ...refreshed, notice: "" });
    void submitCheckout(event, deliveryMethod, refreshedSlot, receiptPreference, totalCents);
  }

  if (checkoutState === "verifying") return <div className="page-shell shell"><section className="success-panel verifying-panel"><span>↻</span><p className="eyebrow">Secure payment return</p><h1>Confirming your order…</h1><p>We’re checking the signed Stripe payment before clearing your cart.</p></section></div>;
  if (checkoutState === "pending") return <div className="page-shell shell"><section className="success-panel"><span>◷</span><p className="eyebrow">Payment confirmation pending</p><h1>We’re still checking.</h1><p>{checkoutError}</p><button className="button primary" onClick={() => window.location.reload()}>Check again</button><p>Your checkout stays locked so the order cannot be paid twice.</p></section></div>;
  if (checkoutState === "success" && completedOrder) {
    const paid = completedOrder.mode === "paid";
    return <div className="page-shell shell"><section className="success-panel"><span>✓</span><p className="eyebrow">{paid ? "Payment confirmed" : "Order confirmed in sample mode"}</p><h1>Your order is booked.</h1><p><strong>{completedOrder.orderNumber}</strong> is scheduled for {describeDeliverySlot(completedOrder.deliverySlot)}.</p>{paid ? <p>Your itemised receipt is being sent using the option selected at checkout.</p> : <p className="preview-notice">No real payment or message was sent. Live Stripe, email and SMS activate only after the owner supplies credentials and current pricing.</p>}<Link className="button primary" href="/">Back home</Link></section></div>;
  }
  if (!items.length) return <div className="page-shell shell"><section className="empty-cart-page"><span>▣</span><h1>Your cart is empty</h1><p>Find something good to stack, then choose express or normal delivery.</p><Link className="button primary" href="/products">Browse products</Link></section></div>;

  return (
    <div className="page-shell shell" id="delivery">
      <header className="page-heading compact"><p className="eyebrow">Secure checkout</p><h1>Cart & delivery</h1><p>Express delivery is a flat $10 after the address is checked. Normal orders are prepared for the next available business-day Australia Post dispatch.</p></header>
      <p className="fee-disclosure"><strong>One clear total:</strong> all displayed prices include GST and every order includes the disclosed $0.99 maintenance fee.</p>
      <div className="cart-layout">
        <div className="cart-main">
          <section className="cart-card"><h2>Your cart</h2>{items.map((item) => {
            const atInventoryLimit = item.quantity >= maxPurchasableQuantity(item);
            return <div className="cart-line" key={item.id}><div className="cart-thumb">{item.imageSrc ? <Image src={item.imageSrc} alt="" fill sizes="76px" /> : <ProductArtwork product={item} compact />}</div><div><strong>{item.name}</strong><small>{item.detail}</small><div className="qty"><button onClick={() => updateQuantity(item.id, -1)} aria-label={`Remove one ${item.name}`}>−</button><span aria-live="polite">{item.quantity}</span><button onClick={() => updateQuantity(item.id, 1)} disabled={atInventoryLimit} aria-label={atInventoryLimit ? `${item.name} has reached the available stock limit` : `Add one ${item.name}`}>+</button></div></div><b>{formatAud(item.priceCents * item.quantity)}</b></div>;
          })}</section>
          <form id="checkout-form" className="checkout-form" key={profile?.email ?? "guest"} onSubmit={submitWithFreshDelivery}>
            <section className="checkout-card">
              <div className="step-title"><span>1</span><div><h2>Your details</h2><p>Saved securely with the order for delivery and receipts.</p></div></div>
              <div className="field-grid">
                <label>Full name<input name="name" defaultValue={profile?.name || (commerceLive ? "" : "Alex Morgan")} autoComplete="name" required /></label>
                <label>Email<input name="email" type="email" defaultValue={profile?.email || (commerceLive ? "" : "alex@example.com")} autoComplete="email" required /></label>
                <label>Mobile number<input name="phone" type="tel" defaultValue={profile?.phone || (commerceLive ? "" : "0400 000 000")} placeholder="04xx xxx xxx" autoComplete="tel" required /></label>
                <label>Delivery instructions<input name="instructions" placeholder="Apartment, gate code or safe directions" /></label>
              </div>
              <label className="age-confirmation"><input name="ageConfirmed" type="checkbox" value="yes" required /><span>I confirm I am 18 or over and the named purchaser will receive the first delivery with valid photo ID.</span></label>
            </section>

            <section className="checkout-card">
              <div className="step-title"><span>2</span><div><h2>Choose delivery</h2><p>The delivery cost is included in the total before payment.</p></div></div>
              <div className="delivery-methods">
                <button type="button" className={deliveryMethod === "express" ? "selected" : ""} onClick={() => setDeliveryMethod("express")}><strong>Express delivery</strong><span>$10 flat rate</span></button>
                <button type="button" className={deliveryMethod === "normal" ? "selected" : ""} onClick={() => setDeliveryMethod("normal")}><strong>Normal delivery</strong><span>Next available business day via Australia Post</span></button>
              </div>

              {deliveryAvailability.notice && <p className="address-status" role="status" aria-live="polite">{deliveryAvailability.notice}</p>}

              {deliveryMethod === "express" ? (
                <div className="delivery-panel">
                  <AddressAutocomplete previewMode={!commerceLive} defaultAddress={commerceLive ? "" : "12 Sample Street, Craigieburn VIC 3064"} onQuoteChange={setExpressQuote} />
                  <h3>Express date & time</h3>
                  <div className="date-options">{dates.map((option) => <button type="button" key={option.isoDate} className={selectedExpressOption?.isoDate === option.isoDate ? "selected" : ""} onClick={() => selectExpressSlot(option.id)}><strong>{option.dateLabel.split(" · ")[0]}</strong><small>{option.dateLabel.split(" · ")[1] || option.dateLabel}</small></button>)}</div>
                  <div className="window-options">{availableWindows.map((window) => <button type="button" key={window.id} className={selectedExpressOption?.id === window.id ? "selected" : ""} onClick={() => selectExpressSlot(window.id)}>{window.windowLabel}</button>)}</div>
                </div>
              ) : (
                <div className="delivery-panel normal-delivery-panel">
                  <input type="hidden" name="placeId" value="" />
                  <input type="hidden" name="deliveryQuoteToken" value="" />
                  <label>Postal delivery address<input name="address" defaultValue={commerceLive ? "" : "12 Sample Street, Craigieburn VIC 3064"} placeholder="Street address, suburb, state and postcode" autoComplete="street-address" required /></label>
                  <div className="normal-date" aria-live="polite"><span>Next available business day</span><strong>{australiaPost.dateLabel.split(" · ")[1] || australiaPost.dateLabel}</strong><small>Owner report includes your name, number and address for post-office handover. Arrival depends on the contracted Australia Post network, open days and order cutoff.</small></div>
                </div>
              )}
            </section>

            <section className="checkout-card"><div className="step-title"><span>3</span><div><h2>Payment</h2><p>Stripe securely handles payment details; Liquor Stax never stores card numbers.</p></div></div><div className="payment-grid" aria-label="Supported payment methods"><div className="payment-option apple-pay"><b>Apple Pay</b><small>Compatible Apple devices</small></div><div className="payment-option google-pay"><b>G Pay</b><small>Compatible devices</small></div><div className="payment-option"><b>Card</b><small>Visa · Mastercard · Amex</small></div></div><p className="wallet-note">Stripe automatically shows compatible wallets; the 99¢ platform fee is settled separately without a second customer charge.</p></section>
            <section className="checkout-card"><div className="step-title"><span>4</span><div><h2>Your receipt</h2><p>Choose email, SMS or both.</p></div></div><div className="receipt-options">{(["email", "sms", "both"] as const).map((option) => <label key={option} className={receiptPreference === option ? "selected" : ""}><input type="radio" name="receipt" checked={receiptPreference === option} onChange={() => setReceiptPreference(option)} /><span>{option === "both" ? "Email + SMS" : option === "sms" ? "SMS" : "Email"}</span></label>)}</div></section>
            <section className="legal-order-warning" aria-label="Victorian liquor ordering warning"><strong>Warning</strong><p>Under the Liquor Control Reform Act 1998 it is an offence to supply alcohol to a person under 18 years (penalty exceeds $24,000) and for a person under 18 years to purchase or receive alcohol (penalty exceeds $1,000).</p><small>{licenceNumber ? `Liquor licence ${licenceNumber}` : "Owner preview · liquor licence number must be added before live ordering"}</small></section>
          </form>
        </div>

        <aside className="order-summary">
          <p className="eyebrow">Order summary</p><h2>{cartItemCount} {cartItemCount === 1 ? "item" : "items"}</h2>
          <p><span>Products · GST incl.</span><b>{formatAud(subtotalCents)}</b></p>
          <p><span>{deliveryMethod === "express" ? "Express delivery" : "Normal delivery"}</span><b>{deliveryMethod === "express" && !expressQuote ? "Quote required" : formatAud(deliveryFeeCents)}</b></p>
          <p><span>Maintenance fee</span><b>{formatAud(MAINTENANCE_FEE_CENTS)}</b></p>
          <p className="summary-total"><span>Total</span><b>{formatAud(totalCents)}</b></p>
          <p className="gst-included"><span>Includes GST</span><b>{formatAud(gstIncludedCents)}</b></p>
          <p className="summary-slot">{describeDeliverySlot(deliverySlot)}</p>
          <button className="button primary full" form="checkout-form" disabled={checkoutState === "loading" || !readyForCheckout}>{checkoutState === "loading" ? "Preparing secure checkout…" : !readyForCheckout ? "Check express address first" : commerceLive ? `Pay securely · ${formatAud(totalCents)}` : `Place sample order · ${formatAud(totalCents)}`}</button>
          {checkoutState === "error" && <p className="form-error">{checkoutError}</p>}
          <small>18+ only. The recipient must present valid photo ID. Alcohol deliveries cannot be left unattended.</small>
          {!commerceLive && <div className="preview-notice"><strong>Owner sample mode</strong> Archived and placeholder stock is not charged. Add current stock, provider credentials and compliance details before switching payments live.</div>}
        </aside>
      </div>
    </div>
  );
}

function ListsPage({ catalogueProducts, savedIds, addToCart, toggleSaved, profile }: { catalogueProducts: Product[]; savedIds: number[]; addToCart: (id: number) => void; toggleSaved: (id: number) => void; profile: Profile | null }) {
  const saved = catalogueProducts.filter((product) => savedIds.includes(product.id));
  return <div className="page-shell shell"><header className="page-heading"><p className="eyebrow">Saved for later</p><h1>My lists</h1><p>Keep favourites together and add them to your next order in one tap.</p></header>{saved.length ? <div className="product-grid">{saved.map((product) => <ProductCard key={product.id} product={product} saved add={() => addToCart(product.id)} toggleSaved={() => toggleSaved(product.id)} profile={profile} />)}</div> : <div className="empty-state"><h2>Your list is ready when you are</h2><p>Tap the heart on any product to save it here.</p><Link className="button primary" href="/products">Find products</Link></div>}</div>;
}

function AccountPage({ profile, recentOrders, openSignUp, orderAgain }: { profile: Profile | null; recentOrders: RecentOrder[]; openSignUp: () => void; orderAgain: (order: RecentOrder) => void }) {
  if (!profile) return <div className="page-shell shell"><section className="account-guest"><div><p className="eyebrow light">Your Stax account</p><h1>Member offers, lists and receipts in one place.</h1><p>Sign up to personalise the owner sample and preview the returning-customer experience.</p><button className="button light" onClick={openSignUp}>Sign up or log in</button></div><BrandLogo className="account-logo" /></section></div>;
  return <div className="page-shell shell"><header className="account-header"><div className="account-avatar">{initials(profile.name)}</div><div><p className="eyebrow">Your Stax account</p><h1>Hello, {profile.name.split(" ")[0]}.</h1><p>{profile.email} · {profile.phone}</p></div></header><div className="account-grid"><section className="account-panel"><h2>Order history</h2>{recentOrders.length ? recentOrders.map((order) => <div className="order-row" key={order.orderNumber}><div><strong>{order.orderNumber}</strong><span>{describeDeliverySlot(order.deliverySlot)}</span><small>{formatAud(order.totalCents)}</small></div><button onClick={() => orderAgain(order)}>Order again</button></div>) : <div className="account-empty"><span>◎</span><p>Your completed orders will appear here.</p></div>}</section><section className="account-panel"><h2>Profile & preferences</h2><div className="profile-detail"><span>Default receipt</span><strong>Email</strong></div><div className="profile-detail"><span>Delivery suburb</span><strong>Craigieburn VIC 3064</strong></div><div className="profile-detail"><span>Member status</span><strong>Sample member</strong></div><p className="preview-notice">This owner sample stores profile details only on this device. Production sign-in will require a secure authentication provider.</p></section></div></div>;
}

function AboutPage() {
  return <div className="page-shell shell"><section className="about-hero"><div><p className="eyebrow light">About Liquor Stax Craigieburn</p><h1>Your local shop, stacked with good finds.</h1><p>Express and normal delivery, in-store collection and friendly local service in Craigieburn.</p></div><div><Image src="/brand/liquor-stax-craigieburn-storefront.jpg" alt="Liquor Stax Craigieburn storefront" fill className="cover-image" sizes="(max-width: 760px) 100vw, 50vw" /></div></section><div className="about-grid"><section><p className="eyebrow">Visit the store</p><h2>{businessInfo.address}</h2><a className="button primary" href="https://www.google.com/maps/search/?api=1&query=119%20Highlander%20Dr%2C%20Craigieburn%20VIC%203064" rel="noreferrer">Get directions</a></section><section><p className="eyebrow">Opening hours</p>{businessInfo.hours.map((row) => <p className="hours-row" key={row.days}><span>{row.days}</span><strong>{row.hours}</strong></p>)}</section><section><p className="eyebrow">Contact</p><a href={`mailto:${businessInfo.email}`}>{businessInfo.email}</a><a href={businessInfo.facebook} rel="noreferrer">Facebook page</a><p>{businessInfo.services.join(" · ")}</p></section></div><section className="responsible-panel"><span>18+</span><div><h2>Responsible delivery comes first.</h2><p>Every recipient must be 18 or over and present valid photo ID. The owner will confirm licence details, service zones and approved delivery hours before live launch.</p></div></section></div>;
}

function HighlightCard({ item }: { item: (typeof storeHighlights)[number] }) {
  return <article className="highlight-card"><div className="highlight-image"><Image src={item.imageSrc} alt={item.imageAlt} fill sizes="(max-width: 600px) 86vw, (max-width: 960px) 42vw, 280px" />{item.sticker && <span className={`sticker sticker-${item.sticker.toLowerCase().replace(" ", "-")}`}>{item.sticker}</span>}</div><div><p className="product-category">{item.alcoholType}</p><h3>{item.title}</h3><p>{item.detail}</p></div></article>;
}

function SignUpModal({ current, close, save }: { current: Profile | null; close: () => void; save: (profile: Profile) => void }) {
  const modal = useRef<HTMLElement>(null);
  const firstField = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    firstField.current?.focus();
    return () => { document.body.style.overflow = previousOverflow; };
  }, []);

  function handleDialogKeyDown(event: React.KeyboardEvent<HTMLElement>) {
    if (event.key === "Escape") {
      event.preventDefault();
      close();
      return;
    }
    if (event.key !== "Tab" || !modal.current) return;
    const focusable = Array.from(modal.current.querySelectorAll<HTMLElement>(
      'button:not([disabled]), input:not([disabled]), a[href], select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])',
    ));
    if (!focusable.length) return;
    const first = focusable[0];
    const last = focusable.at(-1)!;
    if (event.shiftKey && document.activeElement === first) {
      event.preventDefault();
      last.focus();
    } else if (!event.shiftKey && document.activeElement === last) {
      event.preventDefault();
      first.focus();
    }
  }

  function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    save({ name: String(data.get("name")), email: String(data.get("email")), phone: String(data.get("phone")) });
  }
  return <div className="overlay" role="presentation" onMouseDown={(event) => { if (event.currentTarget === event.target) close(); }}><section ref={modal} className="signup-modal" role="dialog" aria-modal="true" aria-labelledby="signup-title" aria-describedby="signup-description" onKeyDown={handleDialogKeyDown}><button className="close" onClick={close} aria-label="Close">×</button><BrandLogo className="signup-logo" /><p className="eyebrow">Join the local Stax</p><h2 id="signup-title">Your favourites, ready when you are.</h2><p id="signup-description">Preview member offers, saved lists, receipts and order-again. No password is needed for this owner sample.</p><form onSubmit={submit}><label>Full name<input ref={firstField} name="name" defaultValue={current?.name || "Alex Morgan"} autoComplete="name" required /></label><label>Email<input name="email" type="email" defaultValue={current?.email || "alex@example.com"} autoComplete="email" required /></label><label>Mobile number<input name="phone" type="tel" defaultValue={current?.phone || "0400 000 000"} autoComplete="tel" required /></label><button className="button primary full">Continue to Stax</button></form><small>Production accounts will use secure authentication and verified contact details.</small></section></div>;
}

async function checkoutAttemptToken(checkoutDraft: object): Promise<string> {
  const encoded = new TextEncoder().encode(JSON.stringify(checkoutDraft));
  const digest = await crypto.subtle.digest("SHA-256", encoded);
  const fingerprint = Array.from(new Uint8Array(digest), (byte) => byte.toString(16).padStart(2, "0")).join("");
  try {
    const stored = JSON.parse(window.sessionStorage.getItem(CHECKOUT_ATTEMPT_KEY) || "null") as {
      token?: unknown;
      fingerprint?: unknown;
    } | null;
    if (
      stored?.fingerprint === fingerprint
      && typeof stored.token === "string"
      && /^[0-9a-f-]{36}$/i.test(stored.token)
    ) {
      return stored.token;
    }
  } catch {
    window.sessionStorage.removeItem(CHECKOUT_ATTEMPT_KEY);
  }
  const token = crypto.randomUUID();
  window.sessionStorage.setItem(CHECKOUT_ATTEMPT_KEY, JSON.stringify({ token, fingerprint }));
  return token;
}
