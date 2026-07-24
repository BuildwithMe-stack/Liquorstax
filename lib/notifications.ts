import { createHash } from "node:crypto";

import { businessInfo, formatAud } from "./catalogue";
import type { AustraliaPostReportRow } from "./admin-data";
import type { PaidOrderSummary } from "./database";
import { describeDeliverySlot } from "./delivery";

// Keep provider calls far below the database notification claim's 10-minute lease.
const PROVIDER_REQUEST_TIMEOUT_MS = 20_000;

export async function sendPaidOrderNotifications(order: PaidOrderSummary): Promise<void> {
  const emailJobs: Promise<unknown>[] = [];
  const ownerEmail = process.env.OWNER_DISPATCH_EMAIL || businessInfo.email;
  const itemLines = order.items.map((item) => `${item.quantity} × ${item.productName}`).join("\n");
  const delivery = describeDeliverySlot(order.deliverySlot);
  const deliveryMethod = order.deliveryMethod === "normal"
    ? "Normal · Australia Post next-business-day dispatch"
    : "Express local delivery";
  const storeAbn = process.env.STORE_ABN?.trim() ?? "";
  const receiptTitle = storeAbn ? "Tax invoice" : "Payment receipt";

  if (process.env.RESEND_API_KEY && process.env.EMAIL_FROM) {
    emailJobs.push(sendEmail({
      to: ownerEmail,
      subject: `Paid order ${order.orderNumber} · ${delivery}`,
      idempotencyKey: `owner-order-paid-${order.orderNumber}`,
      html: `
        <h1>Paid order ${escapeHtml(order.orderNumber)}</h1>
        <p><strong>${escapeHtml(order.customerName)}</strong></p>
        <p>${escapeHtml(order.customerPhone)} · ${escapeHtml(order.customerEmail)}</p>
        <p>${escapeHtml(order.deliveryAddress)}</p>
        <p>${escapeHtml(deliveryMethod)}</p>
        <p>${escapeHtml(delivery)}</p>
        <pre>${escapeHtml(itemLines)}</pre>
        <p><strong>${escapeHtml(formatAud(order.totalCents))}</strong></p>
        <p>${escapeHtml(order.deliveryInstructions || "No delivery instructions")}</p>
      `,
    }));

    if (order.receiptPreference === "email" || order.receiptPreference === "both") {
      emailJobs.push(sendCustomerReceiptEmail(order, receiptTitle, storeAbn, deliveryMethod, delivery, itemLines));
    }
  }

  if (emailJobs.length === 0) {
    throw new Error("No order notification email was configured");
  }

  // Finish idempotent email delivery first. A transient Resend failure can ask
  // Stripe to retry without replaying an already-successful Twilio request.
  await settleOrThrow(emailJobs, "One or more order emails failed");

  if (!twilioConfigured() && order.receiptPreference === "sms") {
    // Checkout normally rejects this configuration, but an environment change
    // between payment creation and webhook delivery must not strand a receipt.
    await sendCustomerReceiptEmail(order, receiptTitle, storeAbn, deliveryMethod, delivery, itemLines);
  }

  if (twilioConfigured() && (order.receiptPreference === "sms" || order.receiptPreference === "both")) {
    try {
      await sendSmsWithoutProviderIdempotency(
        order.customerPhone,
        `Liquor Stax receipt: ${order.orderNumber}, ${formatAud(order.totalCents)}, delivery ${delivery}. Valid photo ID required.`,
      );
    } catch (error) {
      console.error("Customer SMS receipt was not confirmed", error);
      if (order.receiptPreference === "sms") {
        await sendCustomerReceiptEmail(order, receiptTitle, storeAbn, deliveryMethod, delivery, itemLines);
      }
    }
  }

  if (twilioConfigured() && process.env.OWNER_DISPATCH_SMS_E164) {
    try {
      await sendSmsWithoutProviderIdempotency(
        process.env.OWNER_DISPATCH_SMS_E164,
        `Liquor Stax: paid ${order.deliveryMethod} order ${order.orderNumber}, ${delivery}, ${order.items.length} lines. Open the dispatch dashboard for details.`,
      );
    } catch (error) {
      // The idempotent owner email is authoritative. Twilio's classic Messages
      // endpoint has no provider idempotency key, so do not replay an ambiguous
      // optional SMS and risk a duplicate.
      console.error("Optional owner SMS was not confirmed", error);
    }
  }
}

async function settleOrThrow(jobs: Promise<unknown>[], message: string): Promise<void> {
  const results = await Promise.allSettled(jobs);
  const failures = results.flatMap((result) => result.status === "rejected" ? [result.reason] : []);
  if (failures.length) throw new AggregateError(failures, message);
}

function sendCustomerReceiptEmail(
  order: PaidOrderSummary,
  receiptTitle: string,
  storeAbn: string,
  deliveryMethod: string,
  delivery: string,
  itemLines: string,
): Promise<void> {
  return sendEmail({
    to: order.customerEmail,
    subject: `Liquor Stax order ${order.orderNumber}`,
    idempotencyKey: `customer-order-paid-${order.orderNumber}`,
    html: `
      <p>${escapeHtml(receiptTitle)}</p>
      <h1>Thanks, ${escapeHtml(order.customerName)}.</h1>
      <p>Your Liquor Stax order <strong>${escapeHtml(order.orderNumber)}</strong> is paid.</p>
      <p>${escapeHtml(businessInfo.name)}${storeAbn ? ` · ABN ${escapeHtml(storeAbn)}` : ""}</p>
      <p>${escapeHtml(deliveryMethod)}</p>
      <p>Delivery: ${escapeHtml(delivery)}</p>
      <pre>${escapeHtml(itemLines)}</pre>
      <p>Products: ${escapeHtml(formatAud(order.subtotalCents))}</p>
      <p>Delivery: ${escapeHtml(formatAud(order.deliveryFeeCents))}</p>
      <p>Maintenance fee: ${escapeHtml(formatAud(order.maintenanceFeeCents))}</p>
      <p><strong>Total: ${escapeHtml(formatAud(order.totalCents))}</strong></p>
      <p>Total price includes GST: ${escapeHtml(formatAud(order.gstIncludedCents))}</p>
      <p>The recipient must be 18+ and present valid photo ID.</p>
    `,
  });
}

export async function sendAustraliaPostDailyReport(
  deliveryDate: string,
  orders: AustraliaPostReportRow[],
  recipientEmail: string,
): Promise<void> {
  if (!process.env.RESEND_API_KEY || !process.env.EMAIL_FROM) {
    throw new Error("Daily report email is not configured");
  }
  const dateLabel = new Intl.DateTimeFormat("en-AU", {
    weekday: "long",
    day: "numeric",
    month: "long",
    year: "numeric",
    timeZone: "UTC",
  }).format(new Date(`${deliveryDate}T00:00:00.000Z`));
  const rows = orders.length
    ? orders.map((order) => `
      <tr>
        <td>${escapeHtml(order.orderNumber)}</td>
        <td>${escapeHtml(order.customerName)}<br>${escapeHtml(order.customerPhone)}</td>
        <td>${escapeHtml(order.address)}${order.instructions ? `<br><small>${escapeHtml(order.instructions)}</small>` : ""}</td>
        <td>${escapeHtml(order.items.map((item) => `${item.quantity} × ${item.productName}`).join(", "))}</td>
      </tr>
    `).join("")
    : '<tr><td colspan="4">No paid normal-delivery orders for this date.</td></tr>';
  await sendEmail({
    to: recipientEmail,
    subject: `Australia Post handover · ${dateLabel} · ${orders.length} orders`,
    idempotencyKey: `auspost-daily/${deliveryDate}/${reportIdentityHash(recipientEmail)}`,
    html: `
      <h1>Next-business-day Australia Post handover</h1>
      <p><strong>${escapeHtml(dateLabel)}</strong> · ${orders.length} paid ${orders.length === 1 ? "order" : "orders"}</p>
      <table border="1" cellpadding="8" cellspacing="0">
        <thead><tr><th>Order</th><th>Customer / phone</th><th>Address</th><th>Items</th></tr></thead>
        <tbody>${rows}</tbody>
      </table>
      <p>Confirm alcohol labelling, packaging, declaration and ID/signature requirements before lodging.</p>
    `,
  });
}

async function sendEmail({ to, subject, html, idempotencyKey }: { to: string; subject: string; html: string; idempotencyKey: string }) {
  const response = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      authorization: `Bearer ${process.env.RESEND_API_KEY}`,
      "content-type": "application/json",
      "idempotency-key": idempotencyKey,
    },
    body: JSON.stringify({ from: process.env.EMAIL_FROM, to: [to], subject, html }),
    signal: AbortSignal.timeout(PROVIDER_REQUEST_TIMEOUT_MS),
  });
  if (!response.ok) throw new Error(`Email provider returned ${response.status}`);
}

/**
 * Twilio's classic Messages create API does not document a request
 * idempotency key. A network error or timeout after this POST is therefore
 * ambiguous: Twilio may have accepted the message, and a later retry could
 * send a duplicate. Do not add an invented idempotency header here.
 */
async function sendSmsWithoutProviderIdempotency(to: string, body: string) {
  if (!/^\+[1-9]\d{7,14}$/.test(to)) throw new Error("SMS recipient must use E.164 format");
  const accountSid = process.env.TWILIO_ACCOUNT_SID!;
  const token = process.env.TWILIO_AUTH_TOKEN!;
  const form = new URLSearchParams({ To: to, Body: body });
  if (process.env.TWILIO_MESSAGING_SERVICE_SID) {
    form.set("MessagingServiceSid", process.env.TWILIO_MESSAGING_SERVICE_SID);
  } else if (process.env.TWILIO_FROM_E164) {
    form.set("From", process.env.TWILIO_FROM_E164);
  }
  let response: Response;
  try {
    response = await fetch(`https://api.twilio.com/2010-04-01/Accounts/${accountSid}/Messages.json`, {
      method: "POST",
      headers: {
        authorization: `Basic ${Buffer.from(`${accountSid}:${token}`).toString("base64")}`,
        "content-type": "application/x-www-form-urlencoded",
      },
      body: form,
      signal: AbortSignal.timeout(PROVIDER_REQUEST_TIMEOUT_MS),
    });
  } catch (error) {
    throw new Error(
      "SMS provider request did not complete; delivery is unknown and retrying may duplicate the SMS",
      { cause: error },
    );
  }
  if (!response.ok) throw new Error(`SMS provider returned ${response.status}`);
}

function reportIdentityHash(recipientEmail: string): string {
  const identity = [
    recipientEmail,
    process.env.EMAIL_FROM ?? "",
    businessInfo.name,
    businessInfo.dispatchAddress,
    businessInfo.email,
  ]
    .map((value) => value.trim().toLowerCase())
    .join("|");

  return createHash("sha256").update(identity).digest("hex").slice(0, 32);
}

function twilioConfigured(): boolean {
  return Boolean(
    process.env.TWILIO_ACCOUNT_SID &&
    process.env.TWILIO_AUTH_TOKEN &&
    (process.env.TWILIO_MESSAGING_SERVICE_SID || process.env.TWILIO_FROM_E164),
  );
}

function escapeHtml(value: string): string {
  return value.replace(/[&<>'"]/g, (character) => ({
    "&": "&amp;",
    "<": "&lt;",
    ">": "&gt;",
    "'": "&#39;",
    '"': "&quot;",
  })[character] ?? character);
}
