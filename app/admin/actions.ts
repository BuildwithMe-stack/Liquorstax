"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { alcoholTypes, type AlcoholType } from "../../lib/catalogue";
import { createAdminOffer, createAdminProduct } from "../../lib/admin-data";
import { getAdminSession } from "../../lib/admin-auth";

function text(formData: FormData, key: string, maximum = 500): string {
  const value = formData.get(key);
  return typeof value === "string" ? value.replace(/\s+/g, " ").trim().slice(0, maximum) : "";
}

function optionalCents(value: string): number | null {
  if (!value) return null;
  if (!/^\d{1,6}(?:\.\d{1,2})?$/.test(value)) throw new Error("Enter a valid price");
  return Math.round(Number(value) * 100);
}

function optionalWholeNumber(value: string): number | null {
  if (!value) return null;
  const parsed = Number(value);
  if (!Number.isInteger(parsed) || parsed < 0 || parsed > 1_000_000) throw new Error("Enter a valid stock quantity");
  return parsed;
}

async function requireAdmin(): Promise<void> {
  if (!await getAdminSession()) redirect("/admin/login");
}

function melbourneLocalDate(value: string): Date {
  const match = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})$/.exec(value);
  if (!match) return new Date(Number.NaN);
  const [, year, month, day, hour, minute] = match;
  const wallClock = Date.UTC(Number(year), Number(month) - 1, Number(day), Number(hour), Number(minute));
  let candidate = new Date(wallClock);
  for (let iteration = 0; iteration < 3; iteration += 1) {
    const parts = melbourneParts(candidate);
    const localAsUtc = Date.UTC(parts.year, parts.month - 1, parts.day, parts.hour, parts.minute);
    candidate = new Date(wallClock - (localAsUtc - candidate.getTime()));
  }
  const verified = melbourneParts(candidate);
  return verified.year === Number(year) && verified.month === Number(month) &&
    verified.day === Number(day) && verified.hour === Number(hour) && verified.minute === Number(minute)
    ? candidate
    : new Date(Number.NaN);
}

function melbourneParts(value: Date) {
  const parts = new Intl.DateTimeFormat("en-CA", {
    year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit",
    hourCycle: "h23", timeZone: "Australia/Melbourne",
  }).formatToParts(value);
  const part = (type: Intl.DateTimeFormatPartTypes) => Number(parts.find((item) => item.type === type)?.value);
  return { year: part("year"), month: part("month"), day: part("day"), hour: part("hour"), minute: part("minute") };
}

export async function addProductAction(formData: FormData): Promise<void> {
  await requireAdmin();
  const name = text(formData, "name", 140);
  const rawType = text(formData, "alcoholType", 40);
  const placeholder = formData.get("placeholder") === "on";
  const priceCents = optionalCents(text(formData, "price", 20));
  const inventoryQuantity = optionalWholeNumber(text(formData, "inventory", 20));
  if (!name) throw new Error("Product name is required");
  if (!(alcoholTypes as readonly string[]).includes(rawType)) throw new Error("Choose a valid alcohol type");
  if (!placeholder && (priceCents === null || priceCents < 1)) {
    throw new Error("A purchasable product needs a confirmed price");
  }
  if (!placeholder && (inventoryQuantity === null || inventoryQuantity < 1)) {
    throw new Error("A purchasable product needs a positive stock quantity");
  }
  const imageUrl = text(formData, "imageUrl", 500);
  if (imageUrl && !/^\/[A-Za-z0-9/_.,@() -]+$/.test(imageUrl)) {
    throw new Error("Use a local public image path such as /catalogue/product.jpg");
  }
  await createAdminProduct({
    name,
    alcoholType: rawType as AlcoholType,
    description: text(formData, "description", 500),
    volumeLabel: text(formData, "volumeLabel", 80),
    priceCents,
    inventoryQuantity,
    imageUrl,
    placeholder,
    isNew: formData.get("isNew") === "on",
    onSale: formData.get("onSale") === "on",
    memberOffer: formData.get("memberOffer") === "on",
  });
  revalidatePath("/");
  revalidatePath("/products");
  redirect("/admin?saved=product");
}

export async function addOfferAction(formData: FormData): Promise<void> {
  await requireAdmin();
  const title = text(formData, "title", 140);
  const startsAt = melbourneLocalDate(text(formData, "startsAt", 40));
  const endsAt = melbourneLocalDate(text(formData, "endsAt", 40));
  if (!title) throw new Error("Offer title is required");
  if (Number.isNaN(startsAt.getTime()) || Number.isNaN(endsAt.getTime()) || endsAt <= startsAt) {
    throw new Error("Choose a valid offer start and end time");
  }
  const imageUrl = text(formData, "imageUrl", 500);
  if (imageUrl && !/^\/[A-Za-z0-9/_.,@() -]+$/.test(imageUrl)) {
    throw new Error("Use a local public image path such as /catalogue/offer.jpg");
  }
  const rawSort = text(formData, "sortOrder", 10);
  const sortOrder = rawSort ? Number(rawSort) : 0;
  if (!Number.isInteger(sortOrder) || sortOrder < -100 || sortOrder > 100) {
    throw new Error("Sort order must be between -100 and 100");
  }
  await createAdminOffer({
    title,
    description: text(formData, "description", 500),
    eyebrow: text(formData, "eyebrow", 80) || "DAILY OFFER",
    imageUrl,
    linkUrl: text(formData, "linkUrl", 300) || "/products",
    startsAt,
    endsAt,
    sortOrder,
  });
  revalidatePath("/");
  redirect("/admin?saved=offer");
}
