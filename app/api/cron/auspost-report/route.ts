import { NextRequest, NextResponse } from "next/server";
import {
  completeAustraliaPostReport,
  getPendingAustraliaPostReportDates,
  getAustraliaPostReport,
  isAdminDatabaseConfigured,
  queueAustraliaPostReport,
} from "../../../../lib/admin-data";
import { businessInfo } from "../../../../lib/catalogue";
import { nextBusinessDayReportIsoDate } from "../../../../lib/delivery";
import { sendAustraliaPostDailyReport } from "../../../../lib/notifications";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET(request: NextRequest) {
  const secret = process.env.CRON_SECRET;
  if (!secret || request.headers.get("authorization") !== `Bearer ${secret}`) {
    return NextResponse.json({ error: "Unauthorised" }, { status: 401 });
  }
  if (!isAdminDatabaseConfigured()) {
    return NextResponse.json({ error: "Order database is not configured" }, { status: 503 });
  }
  const recipientEmail = process.env.OWNER_DISPATCH_EMAIL || businessInfo.email;
  const deliveryDate = nextBusinessDayReportIsoDate();
  try {
    await queueAustraliaPostReport(deliveryDate, recipientEmail);
    const pendingDates = await getPendingAustraliaPostReportDates(recipientEmail);
    const sent: Array<{ deliveryDate: string; orderCount: number }> = [];
    const failed: string[] = [];
    for (const pendingDate of pendingDates) {
      try {
        const orders = await getAustraliaPostReport(pendingDate);
        await sendAustraliaPostDailyReport(pendingDate, orders, recipientEmail);
        await completeAustraliaPostReport(pendingDate, recipientEmail, orders.length);
        sent.push({ deliveryDate: pendingDate, orderCount: orders.length });
      } catch (error) {
        console.error("Unable to send queued Australia Post report", { pendingDate, error });
        failed.push(pendingDate);
      }
    }
    if (failed.length) {
      return NextResponse.json({ error: "One or more daily reports remain queued", sent, failed }, { status: 503 });
    }
    return NextResponse.json({ ok: true, deliveryDate, sent });
  } catch (error) {
    console.error("Unable to send the Australia Post daily report", error);
    return NextResponse.json({ error: "Daily report delivery failed" }, { status: 503 });
  }
}
