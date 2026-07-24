import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { formatAud } from "../../../lib/catalogue";
import { getAdminSession } from "../../../lib/admin-auth";
import {
  getAustraliaPostReport,
  isAdminDatabaseConfigured,
  isValidAustraliaPostReportDate,
} from "../../../lib/admin-data";
import { melbourneTodayIsoDate, nextBusinessDayReportIsoDate } from "../../../lib/delivery";
import styles from "../admin.module.css";
import PrintButton from "./print-button";

export const dynamic = "force-dynamic";

export const metadata: Metadata = {
  title: "Australia Post delivery report",
  description: "Protected owner report for Australia Post handovers.",
};

type DispatchPageProps = {
  searchParams: Promise<{ date?: string | string[] }>;
};

export default async function DispatchPage({ searchParams }: DispatchPageProps) {
  if (!await getAdminSession()) redirect("/admin/login");
  const requestedDate = (await searchParams).date;
  const today = melbourneTodayIsoDate();
  const deliveryDate = isValidAustraliaPostReportDate(requestedDate) ? requestedDate : nextBusinessDayReportIsoDate();
  const orders = await getAustraliaPostReport(deliveryDate);
  const dateLabel = new Intl.DateTimeFormat("en-AU", {
    weekday: "long",
    day: "numeric",
    month: "long",
    year: "numeric",
    timeZone: "UTC",
  }).format(new Date(`${deliveryDate}T00:00:00.000Z`));

  return (
    <main className={styles.dispatchDashboard}>
      <header className={styles.reportHeading}>
        <div><p>AUSTRALIA POST · HANDOVER REPORT</p><h1>Post office handover</h1><span>{dateLabel} · {orders.length} paid {orders.length === 1 ? "order" : "orders"}</span></div>
        <div className={styles.reportActions}>
          {deliveryDate !== today ? <a href={`/admin/dispatch?date=${today}`}>Today</a> : <a href="/admin/dispatch">Next handover</a>}
          <a href={`/api/admin/reports/auspost.csv?date=${deliveryDate}`}>Download CSV</a>
          <PrintButton />
        </div>
      </header>

      {!isAdminDatabaseConfigured() ? <p className={styles.ownerAlert}><strong>Database connection required.</strong> Connect Neon and apply the migration before real paid orders can appear here.</p> : null}

      {orders.length ? (
        <div className={styles.reportTable}>
          <div className={styles.reportHead}><span>Order</span><span>Customer</span><span>Phone</span><span>Address</span><span>Items</span><span>Total</span></div>
          {orders.map((order) => (
            <article key={order.orderNumber}>
              <strong>{order.orderNumber}</strong>
              <span>{order.customerName}<small>{order.customerEmail}</small></span>
              <a href={`tel:${order.customerPhone}`}>{order.customerPhone}</a>
              <span>{order.address}<small>{order.instructions || "No special instructions"}</small></span>
              <span>{order.items.map((item) => `${item.quantity} × ${item.productName}`).join(", ")}</span>
              <b>{formatAud(order.totalCents)}</b>
            </article>
          ))}
        </div>
      ) : (
        <section className={styles.noReportRows}><span>✓</span><h2>No paid normal-delivery orders yet</h2><p>The report stays empty until an Australia Post order is paid for {dateLabel}.</p></section>
      )}

      <section className={styles.reportNote}>
        <strong>Owner checklist</strong>
        <p>Confirm the Australia Post Business Credit Account alcohol service, labelling, declarations, packaging and ID/signature requirements before accepting live orders. “Next business day” remains subject to the contracted network and lodgement cutoff.</p>
      </section>
    </main>
  );
}
