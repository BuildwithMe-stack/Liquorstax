"use client";

import { FormEvent, useMemo, useState } from "react";

type Product = {
  id: number;
  name: string;
  category: string;
  detail: string;
  price: number;
  was?: number;
  badge?: string;
  tone: string;
  initials: string;
};

const products: Product[] = [
  { id: 1, name: "Yarra Valley Pinot Noir", category: "Wine", detail: "750mL · Victoria", price: 24, was: 30, badge: "Member price", tone: "berry", initials: "YV" },
  { id: 2, name: "Coastal Pale Ale", category: "Beer", detail: "6 pack · 375mL", price: 22, badge: "Staff pick", tone: "amber", initials: "CP" },
  { id: 3, name: "North Star Dry Gin", category: "Spirits", detail: "700mL · 40%", price: 49, was: 58, badge: "Save $9", tone: "ocean", initials: "NS" },
  { id: 4, name: "Limoncello Spritz", category: "Premix", detail: "4 pack · 250mL", price: 19, tone: "lemon", initials: "LS" },
  { id: 5, name: "Barossa Shiraz", category: "Wine", detail: "750mL · South Australia", price: 18, was: 23, badge: "Great value", tone: "plum", initials: "BS" },
  { id: 6, name: "Japanese Malt Whisky", category: "Spirits", detail: "700mL · 43%", price: 76, badge: "New arrival", tone: "gold", initials: "JM" },
  { id: 7, name: "Crisp Apple Cider", category: "Cider", detail: "10 pack · 330mL", price: 27, tone: "apple", initials: "AC" },
  { id: 8, name: "Zero Proof Aperitivo", category: "Zero alcohol", detail: "700mL · 0.0%", price: 29, badge: "0.0%", tone: "coral", initials: "ZP" },
];

const categories = ["All", "Wine", "Beer", "Spirits", "Premix", "Cider", "Zero alcohol"];
const deliverySlots = ["Today · 6–8pm", "Tomorrow · 10am–12pm", "Tomorrow · 4–6pm"];

export default function Storefront() {
  const [ageConfirmed, setAgeConfirmed] = useState(false);
  const [category, setCategory] = useState("All");
  const [query, setQuery] = useState("");
  const [cart, setCart] = useState<Record<number, number>>({});
  const [cartOpen, setCartOpen] = useState(false);
  const [checkoutOpen, setCheckoutOpen] = useState(false);
  const [accountOpen, setAccountOpen] = useState(false);
  const [deliverySlot, setDeliverySlot] = useState(deliverySlots[0]);
  const [orderState, setOrderState] = useState<"idle" | "loading" | "success" | "error">("idle");
  const [orderNumber, setOrderNumber] = useState("");

  const filtered = products.filter((product) => {
    const matchesCategory = category === "All" || product.category === category;
    const matchesQuery = `${product.name} ${product.category}`.toLowerCase().includes(query.toLowerCase());
    return matchesCategory && matchesQuery;
  });

  const cartItems = useMemo(
    () => products.filter((product) => cart[product.id]).map((product) => ({ ...product, quantity: cart[product.id] })),
    [cart],
  );
  const itemCount = cartItems.reduce((sum, item) => sum + item.quantity, 0);
  const subtotal = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  const deliveryFee = subtotal >= 100 ? 0 : 9;
  const total = subtotal + deliveryFee;

  function addToCart(id: number) {
    setCart((current) => ({ ...current, [id]: (current[id] || 0) + 1 }));
    setCartOpen(true);
  }

  function updateQuantity(id: number, amount: number) {
    setCart((current) => {
      const next = Math.max(0, (current[id] || 0) + amount);
      const updated = { ...current, [id]: next };
      if (!next) delete updated[id];
      return updated;
    });
  }

  async function submitOrder(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setOrderState("loading");
    const data = new FormData(event.currentTarget);
    try {
      const response = await fetch("/api/checkout", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({
          items: cartItems.map((item) => ({ productId: item.id, quantity: item.quantity })),
          deliverySlot,
          customer: {
            name: data.get("name"),
            email: data.get("email"),
            address: data.get("address"),
            instructions: data.get("instructions"),
          },
        }),
      });
      const result = await response.json() as { orderNumber?: string; error?: string };
      if (!response.ok || !result.orderNumber) throw new Error(result.error || "Order failed");
      setOrderNumber(result.orderNumber);
      setOrderState("success");
      setCart({});
    } catch {
      setOrderState("error");
    }
  }

  return (
    <main>
      {!ageConfirmed && (
        <div className="age-gate" role="dialog" aria-modal="true" aria-labelledby="age-title">
          <div className="age-card">
            <div className="brand-mark large"><span>L</span><span>S</span></div>
            <p className="eyebrow">Welcome to Liquor Stax</p>
            <h1 id="age-title">Are you 18 or over?</h1>
            <p>You must be of legal drinking age to enter. Please enjoy responsibly.</p>
            <button className="button primary full" onClick={() => setAgeConfirmed(true)}>Yes, I’m 18 or over</button>
            <a className="text-link" href="https://www.drinkwise.org.au/" rel="noreferrer">No, take me to DrinkWise</a>
          </div>
        </div>
      )}

      <div className="top-strip">Free delivery on orders over $100 <span>•</span> Same-day slots available</div>
      <header className="site-header">
        <div className="header-main shell">
          <button className="brand" onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })} aria-label="Liquor Stax home">
            <span className="brand-mark"><span>L</span><span>S</span></span>
            <span className="brand-name">LIQUOR <b>STAX</b></span>
          </button>
          <label className="search">
            <span>⌕</span>
            <input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Search wine, beer, spirits…" aria-label="Search products" />
          </label>
          <button className="delivery-button" onClick={() => document.getElementById("delivery")?.scrollIntoView({ behavior: "smooth" })}>
            <span className="icon-circle">⌖</span><span><small>Delivering to</small><strong>Melbourne 3000</strong></span>
          </button>
          <button className="icon-button" onClick={() => setAccountOpen(true)} aria-label="Open account"><span>◯</span><small>Account</small></button>
          <button className="cart-button" onClick={() => setCartOpen(true)} aria-label={`Open basket with ${itemCount} items`}><span>Bag</span><b>{itemCount}</b></button>
        </div>
        <nav className="category-nav shell" aria-label="Product categories">
          {categories.map((item) => <button key={item} className={category === item ? "active" : ""} onClick={() => setCategory(item)}>{item}</button>)}
          <button className="sale-link">Stax deals</button>
        </nav>
      </header>

      <section className="hero shell">
        <div className="hero-copy">
          <p className="eyebrow light">Your local bottle shop, stacked</p>
          <h1>Good drinks.<br /><em>Great timing.</em></h1>
          <p>From Friday knock-offs to last-minute dinner plans, get the right bottle delivered when it suits you.</p>
          <div className="hero-actions"><button className="button light" onClick={() => document.getElementById("shop")?.scrollIntoView({ behavior: "smooth" })}>Shop the range</button><button className="button ghost-light" onClick={() => setCategory("Zero alcohol")}>Explore 0.0%</button></div>
        </div>
        <div className="hero-art" aria-hidden="true">
          <div className="sun"></div>
          <div className="bottle hero-bottle one"><span>STAX<br /><small>APERITIF</small></span></div>
          <div className="bottle hero-bottle two"><span>NORTH<br /><small>DRY GIN</small></span></div>
          <div className="can hero-can"><span>COASTAL<br /><small>PALE ALE</small></span></div>
          <div className="hero-tag">DELIVERED<br /><b>ON YOUR TIME</b></div>
        </div>
      </section>

      <section className="promise shell" id="delivery">
        <div><span className="promise-icon">↯</span><p><strong>Fast when you need it</strong><small>Same-day delivery windows</small></p></div>
        <div><span className="promise-icon">◷</span><p><strong>Plan it your way</strong><small>Book up to 7 days ahead</small></p></div>
        <div><span className="promise-icon">◎</span><p><strong>Pay from your account</strong><small>One checkout, no card details</small></p></div>
        <div><span className="promise-icon">18+</span><p><strong>ID checked at the door</strong><small>Responsible delivery, always</small></p></div>
      </section>

      <section className="shop-section shell" id="shop">
        <div className="section-heading"><div><p className="eyebrow">Popular right now</p><h2>What’s in the Stax</h2></div><p>Fresh picks, easy favourites and sharp prices.</p></div>
        <div className="mobile-categories">{categories.map((item) => <button key={item} className={category === item ? "active" : ""} onClick={() => setCategory(item)}>{item}</button>)}</div>
        <div className="product-grid">
          {filtered.map((product) => (
            <article className="product-card" key={product.id}>
              <div className={`product-visual ${product.tone}`}>
                {product.badge && <span className="badge">{product.badge}</span>}
                <div className="product-bottle"><span>{product.initials}</span></div>
                <button className="heart" aria-label={`Save ${product.name}`}>♡</button>
              </div>
              <div className="product-info"><p className="product-category">{product.category}</p><h3>{product.name}</h3><p className="product-detail">{product.detail}</p><div className="price-row"><p><strong>${product.price}</strong>{product.was && <del>${product.was}</del>}</p><button onClick={() => addToCart(product.id)} aria-label={`Add ${product.name} to basket`}>+</button></div></div>
            </article>
          ))}
        </div>
        {!filtered.length && <div className="empty-state"><h3>No drinks found</h3><p>Try a different search or browse all products.</p><button className="button primary" onClick={() => { setQuery(""); setCategory("All"); }}>Show everything</button></div>}
      </section>

      <section className="account-banner shell">
        <div><p className="eyebrow light">The Stax Account</p><h2>One tab. All your drinks.</h2><p>Keep orders, delivery updates and account credit together—so checkout is done in a few taps.</p></div>
        <button className="button light" onClick={() => setAccountOpen(true)}>View demo account</button>
      </section>

      <footer><div className="shell footer-grid"><div><div className="brand footer-brand"><span className="brand-mark"><span>L</span><span>S</span></span><span className="brand-name">LIQUOR <b>STAX</b></span></div><p>Good drinks, delivered responsibly.</p></div><div><strong>Shop</strong><a href="#shop">Wine</a><a href="#shop">Beer</a><a href="#shop">Spirits</a></div><div><strong>Help</strong><a href="#delivery">Delivery</a><a href="#">Returns</a><a href="#">Contact</a></div><div><strong>Responsible service</strong><p>Liquor Stax supports the responsible service of alcohol. No alcohol can be sold or supplied to anyone under 18.</p></div></div></footer>

      {cartOpen && <div className="overlay" onMouseDown={(e) => { if (e.currentTarget === e.target) setCartOpen(false); }}><aside className="drawer" aria-label="Your basket"><div className="drawer-head"><div><p className="eyebrow">Your order</p><h2>Basket <span>{itemCount}</span></h2></div><button className="close" onClick={() => setCartOpen(false)}>×</button></div>{cartItems.length ? <><div className="cart-items">{cartItems.map((item) => <div className="cart-item" key={item.id}><div className={`mini-bottle ${item.tone}`}><span>{item.initials}</span></div><div><strong>{item.name}</strong><small>{item.detail}</small><div className="qty"><button onClick={() => updateQuantity(item.id, -1)}>−</button><span>{item.quantity}</span><button onClick={() => updateQuantity(item.id, 1)}>+</button></div></div><b>${(item.price * item.quantity).toFixed(2)}</b></div>)}</div><div className="cart-summary"><p><span>Subtotal</span><b>${subtotal.toFixed(2)}</b></p><p><span>Delivery</span><b>{deliveryFee ? `$${deliveryFee.toFixed(2)}` : "Free"}</b></p><p className="total"><span>Total</span><b>${total.toFixed(2)}</b></p><button className="button primary full" onClick={() => { setCartOpen(false); setCheckoutOpen(true); }}>Choose delivery & pay</button><small>Age and ID verification required at delivery.</small></div></> : <div className="empty-cart"><span>□</span><h3>Your basket is empty</h3><p>Let’s find something good to stack in here.</p><button className="button primary" onClick={() => setCartOpen(false)}>Keep shopping</button></div>}</aside></div>}

      {checkoutOpen && <div className="overlay modal-overlay"><section className="checkout-modal"><button className="close" onClick={() => { setCheckoutOpen(false); setOrderState("idle"); }}>×</button>{orderState === "success" ? <div className="success"><span>✓</span><p className="eyebrow">Order confirmed</p><h2>Your delivery is booked.</h2><p>Order <strong>{orderNumber}</strong> will arrive <strong>{deliverySlot.toLowerCase()}</strong>. We’ve charged your Stax Account.</p><button className="button primary" onClick={() => { setCheckoutOpen(false); setOrderState("idle"); }}>Done</button></div> : <><div className="checkout-title"><p className="eyebrow">Secure checkout</p><h2>Delivery & payment</h2></div><form onSubmit={submitOrder}><div className="checkout-layout"><div><h3>1. Your details</h3><div className="field-row"><label>Full name<input name="name" defaultValue="Alex Morgan" required /></label><label>Email<input name="email" type="email" defaultValue="alex@example.com" required /></label></div><label>Delivery address<input name="address" defaultValue="120 Flinders Street, Melbourne VIC 3000" required /></label><label>Delivery instructions<input name="instructions" placeholder="Apartment, gate code or safe directions" /></label><h3>2. Delivery time</h3><div className="slot-grid">{deliverySlots.map((slot) => <button type="button" key={slot} className={deliverySlot === slot ? "selected" : ""} onClick={() => setDeliverySlot(slot)}><span>{slot.split(" · ")[0]}</span><strong>{slot.split(" · ")[1]}</strong></button>)}</div><h3>3. Payment</h3><label className="payment-option selected"><input type="radio" defaultChecked name="payment" /><span className="account-token">LS</span><span><strong>Stax Account · 1001</strong><small>Available credit: $250.00</small></span><b>${total.toFixed(2)}</b></label></div><aside className="order-review"><h3>Order summary</h3>{cartItems.map((item) => <p key={item.id}><span>{item.quantity} × {item.name}</span><b>${(item.quantity * item.price).toFixed(2)}</b></p>)}<hr /><p><span>Delivery</span><b>{deliveryFee ? `$${deliveryFee.toFixed(2)}` : "Free"}</b></p><p className="total"><span>Total</span><b>${total.toFixed(2)}</b></p><button className="button primary full" disabled={orderState === "loading"}>{orderState === "loading" ? "Processing…" : `Charge account · $${total.toFixed(2)}`}</button>{orderState === "error" && <p className="error">We couldn’t place that order. Please try again.</p>}<small>By placing this order you confirm the recipient is 18+ and has valid photo ID.</small></aside></div></form></>}</section></div>}

      {accountOpen && <div className="overlay" onMouseDown={(e) => { if (e.currentTarget === e.target) setAccountOpen(false); }}><aside className="drawer account-drawer"><div className="drawer-head"><div><p className="eyebrow">Demo customer</p><h2>Stax Account</h2></div><button className="close" onClick={() => setAccountOpen(false)}>×</button></div><div className="account-card"><span>LIQUOR STAX</span><p>Available credit</p><strong>$250.00</strong><small>ACCOUNT ···· 1001</small></div><div className="account-stat"><span>This month</span><strong>$0.00 spent</strong></div><div className="recent-orders"><h3>Recent orders</h3><div className="empty-account"><span>◎</span><p>Your completed orders will appear here.</p></div></div><button className="button primary full" onClick={() => { setAccountOpen(false); document.getElementById("shop")?.scrollIntoView({ behavior: "smooth" }); }}>Start an order</button></aside></div>}
    </main>
  );
}
