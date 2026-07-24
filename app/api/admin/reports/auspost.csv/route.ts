import { NextRequest, NextResponse } from "next/server";
import { getAdminSession } from "../../../../../lib/admin-auth";
import {
  getAustraliaPostReport,
  isValidAustraliaPostReportDate,
} from "../../../../../lib/admin-data";
import { melbourneTodayIsoDate } from "../../../../../lib/delivery";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET(request: NextRequest) {
  if (!await getAdminSession()) {
    return NextResponse.json({ error: "Owner authentication required" }, { status: 401 });
  }
  const requestedDate = request.nextUrl.searchParams.get("date");
  if (requestedDate !== null && !isValidAustraliaPostReportDate(requestedDate)) {
    return NextResponse.json({ error: "Date must be a valid YYYY-MM-DD value" }, { status: 400 });
  }
  const deliveryDate = requestedDate ?? melbourneTodayIsoDate();
  const orders = await getAustraliaPostReport(deliveryDate);
  const rows = [
    ["Order", "Name", "Phone", "Email", "Address", "Instructions", "Items", "Total (cents)"],
    ...orders.map((order) => [
      order.orderNumber,
      order.customerName,
      order.customerPhone,
      order.customerEmail,
      order.address,
      order.instructions,
      order.items.map((item) => `${item.quantity} x ${item.productName}`).join("; "),
      String(order.totalCents),
    ]),
  ];
  const csv = rows.map((row) => row.map(csvCell).join(",")).join("\r\n");
  return new NextResponse(csv, {
    headers: {
      "content-type": "text/csv; charset=utf-8",
      "content-disposition": `attachment; filename="liquor-stax-auspost-${deliveryDate}.csv"`,
      "cache-control": "no-store",
    },
  });
}

function csvCell(value: string): string {
  const flattened = value.replace(/[\r\n\t\u2028\u2029]+/g, " ");
  const safeValue = /^[=+\-@]/.test(flattened.trimStart()) ? `'${flattened}` : flattened;
  return `"${safeValue.replaceAll('"', '""')}"`;
}
