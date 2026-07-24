export const STORE_TIMEZONE = "Australia/Melbourne";
export const DELIVERY_LEAD_MINUTES = 90;
export const AUSTRALIA_POST_WINDOW_ID = "auspost";
export const DEFAULT_AUSPOST_ORDER_CUTOFF_HOUR = 15;

export const DELIVERY_WINDOWS = [
  { id: "10-12", label: "10am – 12pm", startMinutes: 10 * 60, weekdays: [1, 2, 3, 4, 5, 6] },
  { id: "11-13", label: "11am – 1pm", startMinutes: 11 * 60, weekdays: [0] },
  { id: "14-16", label: "2pm – 4pm", startMinutes: 14 * 60, weekdays: [0, 1, 2, 3, 4, 5, 6] },
  { id: "18-20", label: "6pm – 8pm", startMinutes: 18 * 60, weekdays: [0, 1, 2, 3, 4, 5, 6] },
] as const;

export type DeliveryOption = {
  id: string;
  isoDate: string;
  dateLabel: string;
  windowId: string;
  windowLabel: string;
};

export type AustraliaPostDeliveryOption = DeliveryOption & {
  windowId: typeof AUSTRALIA_POST_WINDOW_ID;
};

export function buildDeliveryOptions(now = new Date()): DeliveryOption[] {
  const current = melbourneDateTimeParts(now);
  const start = new Date(Date.UTC(current.year, current.month - 1, current.day));
  const options: DeliveryOption[] = [];
  let includedDates = 0;

  // Check one extra day so the customer still sees seven bookable dates when
  // today's windows have already passed.
  for (let offset = 0; offset < 8 && includedDates < 7; offset += 1) {
    const date = new Date(start);
    date.setUTCDate(start.getUTCDate() + offset);
    const weekdayNumber = date.getUTCDay();
    const windows = DELIVERY_WINDOWS.filter((window) => {
      if (!(window.weekdays as readonly number[]).includes(weekdayNumber)) return false;
      if (offset > 0) return true;
      return window.startMinutes >= current.hour * 60 + current.minute + DELIVERY_LEAD_MINUTES;
    });
    if (!windows.length) continue;

    const isoDate = date.toISOString().slice(0, 10);
    const weekday = new Intl.DateTimeFormat("en-AU", {
      weekday: "short",
      timeZone: "UTC",
    }).format(date);
    const calendarDate = new Intl.DateTimeFormat("en-AU", {
      day: "numeric",
      month: "short",
      timeZone: "UTC",
    }).format(date);
    const dayLabel = offset === 0 ? "Today" : offset === 1 ? "Tomorrow" : weekday;
    const dateLabel = `${dayLabel} · ${calendarDate}`;

    for (const window of windows) {
      options.push({
        id: `${isoDate}|${window.id}`,
        isoDate,
        dateLabel,
        windowId: window.id,
        windowLabel: window.label,
      });
    }
    includedDates += 1;
  }

  return options;
}

export function isValidDeliverySlot(value: string, now = new Date()): boolean {
  return buildDeliveryOptions(now).some((option) => option.id === value)
    || isValidAustraliaPostDeliverySlot(value, now);
}

export function describeDeliverySlot(value: string): string {
  const [isoDate, windowId] = value.split("|");
  const date = /^\d{4}-\d{2}-\d{2}$/.test(isoDate ?? "")
    ? new Date(`${isoDate}T00:00:00.000Z`)
    : undefined;
  const window = DELIVERY_WINDOWS.find((candidate) => candidate.id === windowId);
  if (!date || Number.isNaN(date.getTime())) return value;
  const label = new Intl.DateTimeFormat("en-AU", {
    weekday: "long",
    day: "numeric",
    month: "long",
    timeZone: "UTC",
  }).format(date);
  if (windowId === AUSTRALIA_POST_WINDOW_ID) {
    return `Australia Post next-available-business-day dispatch · ${label}`;
  }
  if (!window) return value;
  return `${label}, ${window.label}`;
}

export function buildAustraliaPostNextBusinessDayOption(
  now = new Date(),
): AustraliaPostDeliveryOption {
  const isoDate = nextBusinessDayIsoDate(now);
  const date = new Date(`${isoDate}T00:00:00.000Z`);
  const weekday = new Intl.DateTimeFormat("en-AU", {
    weekday: "short",
    timeZone: "UTC",
  }).format(date);
  const calendarDate = new Intl.DateTimeFormat("en-AU", {
    day: "numeric",
    month: "short",
    timeZone: "UTC",
  }).format(date);

  return {
    id: `${isoDate}|${AUSTRALIA_POST_WINDOW_ID}`,
    isoDate,
    dateLabel: `Next available business day · ${weekday} ${calendarDate}`,
    windowId: AUSTRALIA_POST_WINDOW_ID,
    windowLabel: "Next available business day via Australia Post (subject to network)",
  };
}

export function nextBusinessDayIsoDate(now = new Date()): string {
  const current = melbourneDateTimeParts(now);
  const currentDate = new Date(Date.UTC(current.year, current.month - 1, current.day));
  // A weekend or configured closure has already missed the preceding owner
  // handover report. Start two open business days ahead in that case. On an
  // open weekday, orders before cutoff can still join the next report; orders
  // at or after cutoff move to the following open business day.
  const businessDays = isAustraliaPostClosedDate(currentDate)
    || current.hour >= australiaPostCutoffHour()
    ? 2
    : 1;
  return advanceBusinessDays(current, businessDays);
}

/** Date covered by the afternoon owner report, after the normal-order cutoff. */
export function nextBusinessDayReportIsoDate(now = new Date()): string {
  return advanceBusinessDays(melbourneDateTimeParts(now), 1);
}

export function melbourneTodayIsoDate(now = new Date()): string {
  const current = melbourneDateTimeParts(now);
  return [current.year, String(current.month).padStart(2, "0"), String(current.day).padStart(2, "0")].join("-");
}

export function isValidAustraliaPostDeliverySlot(value: string, now = new Date()): boolean {
  return value === buildAustraliaPostNextBusinessDayOption(now).id;
}

export function isAustraliaPostDeliverySlot(value: string): boolean {
  return /^\d{4}-\d{2}-\d{2}\|auspost$/.test(value);
}

function melbourneDateTimeParts(value: Date): {
  year: number;
  month: number;
  day: number;
  hour: number;
  minute: number;
} {
  const parts = new Intl.DateTimeFormat("en-CA", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    hourCycle: "h23",
    minute: "2-digit",
    timeZone: STORE_TIMEZONE,
  }).formatToParts(value);
  const part = (type: Intl.DateTimeFormatPartTypes) => Number(parts.find((item) => item.type === type)?.value);

  return {
    year: part("year"),
    month: part("month"),
    day: part("day"),
    hour: part("hour"),
    minute: part("minute"),
  };
}

function advanceBusinessDays(
  current: ReturnType<typeof melbourneDateTimeParts>,
  businessDays: number,
): string {
  const date = new Date(Date.UTC(current.year, current.month - 1, current.day));
  let remaining = businessDays;
  while (remaining > 0) {
    date.setUTCDate(date.getUTCDate() + 1);
    if (!isAustraliaPostClosedDate(date)) remaining -= 1;
  }
  return date.toISOString().slice(0, 10);
}

function isAustraliaPostClosedDate(date: Date): boolean {
  if (date.getUTCDay() === 0 || date.getUTCDay() === 6) return true;
  return configuredClosedDates().has(date.toISOString().slice(0, 10));
}

function configuredClosedDates(): Set<string> {
  const raw = process.env.NEXT_PUBLIC_AUSPOST_CLOSED_DATES || process.env.AUSPOST_CLOSED_DATES || "";
  return new Set(raw.split(",").map((value) => value.trim()).filter((value) => /^\d{4}-\d{2}-\d{2}$/.test(value)));
}

function australiaPostCutoffHour(): number {
  const raw = process.env.NEXT_PUBLIC_AUSPOST_ORDER_CUTOFF_HOUR || process.env.AUSPOST_ORDER_CUTOFF_HOUR;
  const parsed = Number(raw);
  return Number.isInteger(parsed) && parsed >= 0 && parsed <= 23
    ? parsed
    : DEFAULT_AUSPOST_ORDER_CUTOFF_HOUR;
}
