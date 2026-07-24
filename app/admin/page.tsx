import { redirect } from "next/navigation";
import { alcoholTypes, formatAud } from "../../lib/catalogue";
import { getAdminSession } from "../../lib/admin-auth";
import {
  getAdminOffers,
  getAdminProducts,
  isAdminDatabaseConfigured,
} from "../../lib/admin-data";
import { addOfferAction, addProductAction } from "./actions";
import styles from "./admin.module.css";

export const dynamic = "force-dynamic";

export default async function AdminDashboard({
  searchParams,
}: {
  searchParams: Promise<{ saved?: string }>;
}) {
  if (!await getAdminSession()) redirect("/admin/login");
  const configured = isAdminDatabaseConfigured();
  const [products, offers, params] = await Promise.all([
    getAdminProducts(),
    getAdminOffers(),
    searchParams,
  ]);
  const now = new Date();
  const tomorrow = new Date(now.getTime() + 24 * 60 * 60 * 1000);

  return (
    <main className={styles.dashboard}>
      <header className={styles.dashboardHeading}>
        <div><p>OWNER DASHBOARD</p><h1>Today at Liquor Stax</h1><span>Add products and timed offers; active changes feed the public catalogue.</span></div>
        <div className={styles.metricGrid}>
          <div><strong>{products.length}</strong><span>shop products</span></div>
          <div><strong>{offers.filter((offer) => offer.active).length}</strong><span>active offer records</span></div>
        </div>
      </header>

      {!configured ? <p className={styles.ownerAlert}><strong>Database connection required.</strong> Add DATABASE_URL, then run db/migrations/001_commerce_admin.sql before saving real catalogue data.</p> : null}
      {params.saved ? <p className={styles.savedNotice}>Saved {params.saved === "offer" ? "daily offer" : "product"}. The public catalogue will refresh now.</p> : null}

      <div className={styles.adminColumns}>
        <section className={styles.adminCard}>
          <div className={styles.cardHeading}><div><p>CATALOGUE</p><h2>Add a shop product</h2></div><span>Shopfront-ready fields</span></div>
          <form action={addProductAction} className={styles.adminForm}>
            <label>Product name<input name="name" maxLength={140} required disabled={!configured} /></label>
            <div className={styles.twoFields}>
              <label>Drink type<select name="alcoholType" required disabled={!configured}>{alcoholTypes.map((type) => <option key={type}>{type}</option>)}</select></label>
              <label>Pack / volume<input name="volumeLabel" placeholder="700mL · 40% ABV" maxLength={80} disabled={!configured} /></label>
            </div>
            <label>Description<textarea name="description" rows={3} maxLength={500} disabled={!configured} /></label>
            <div className={styles.threeFields}>
              <label>Price (AUD)<input name="price" inputMode="decimal" placeholder="49.99" disabled={!configured} /></label>
              <label>Stock quantity<input name="inventory" type="number" min="0" disabled={!configured} /></label>
              <label>Local image path<input name="imageUrl" placeholder="/catalogue/item.jpg" disabled={!configured} /></label>
            </div>
            <div className={styles.checks}>
              <label><input name="isNew" type="checkbox" disabled={!configured} /> New sticker</label>
              <label><input name="onSale" type="checkbox" disabled={!configured} /> Sale sticker</label>
              <label><input name="memberOffer" type="checkbox" disabled={!configured} /> Member offer</label>
              <label><input name="placeholder" type="checkbox" disabled={!configured} /> Placeholder only</label>
            </div>
            <button disabled={!configured}>Add product</button>
          </form>
        </section>

        <section className={styles.adminCard}>
          <div className={styles.cardHeading}><div><p>TOP SLIDESHOW</p><h2>Add a daily offer</h2></div><span>Timed automatically</span></div>
          <form action={addOfferAction} className={styles.adminForm}>
            <label>Offer title<input name="title" maxLength={140} required disabled={!configured} /></label>
            <label>Short description<textarea name="description" rows={3} maxLength={500} disabled={!configured} /></label>
            <div className={styles.twoFields}>
              <label>Eyebrow<input name="eyebrow" defaultValue="DAILY OFFER" maxLength={80} disabled={!configured} /></label>
              <label>Link<input name="linkUrl" defaultValue="/products?offer=sale" disabled={!configured} /></label>
            </div>
            <label>Local image path<input name="imageUrl" placeholder="/catalogue/offer.jpg" disabled={!configured} /></label>
            <div className={styles.threeFields}>
              <label>Starts (Melbourne)<input name="startsAt" type="datetime-local" defaultValue={melbourneInputValue(now)} required disabled={!configured} /></label>
              <label>Ends (Melbourne)<input name="endsAt" type="datetime-local" defaultValue={melbourneInputValue(tomorrow)} required disabled={!configured} /></label>
              <label>Sort order<input name="sortOrder" type="number" min="-100" max="100" defaultValue="0" disabled={!configured} /></label>
            </div>
            <button disabled={!configured}>Publish timed offer</button>
          </form>
        </section>
      </div>

      <section className={styles.recordsCard}>
        <div className={styles.cardHeading}><div><p>RECENT RECORDS</p><h2>Catalogue & offers</h2></div></div>
        <div className={styles.recordColumns}>
          <div><h3>Products</h3>{products.length ? products.slice(0, 8).map((product) => <article key={product.id}><div><strong>{product.name}</strong><span>{product.alcoholType} · {product.placeholder ? "Placeholder" : product.priceCents === null ? "No price" : formatAud(product.priceCents)}{product.memberOffer ? " · Member offer" : ""}</span></div><b>{product.active ? "Active" : "Hidden"}</b></article>) : <p>No database products yet.</p>}</div>
          <div><h3>Offers</h3>{offers.length ? offers.slice(0, 8).map((offer) => <article key={offer.id}><div><strong>{offer.title}</strong><span>{new Date(offer.startsAt).toLocaleDateString("en-AU")} – {new Date(offer.endsAt).toLocaleDateString("en-AU")}</span></div><b>{offer.active ? "Active" : "Hidden"}</b></article>) : <p>No daily offers yet.</p>}</div>
        </div>
      </section>
    </main>
  );
}

function melbourneInputValue(value: Date): string {
  const parts = new Intl.DateTimeFormat("en-CA", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    hourCycle: "h23",
    timeZone: "Australia/Melbourne",
  }).formatToParts(value);
  const part = (type: Intl.DateTimeFormatPartTypes) => parts.find((item) => item.type === type)?.value ?? "";
  return `${part("year")}-${part("month")}-${part("day")}T${part("hour")}:${part("minute")}`;
}
