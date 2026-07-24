"use server";

import { redirect } from "next/navigation";
import { headers } from "next/headers";
import {
  createAdminSession,
  destroyAdminSession,
  setAdminLoginFlash,
  verifyAdminCredentials,
} from "../../../lib/admin-auth";

const attempts = new Map<string, { count: number; resetAt: number }>();
const ATTEMPT_WINDOW_MS = 10 * 60_000;
const MAX_ATTEMPT_BUCKETS = 500;

function formText(formData: FormData, key: string): string {
  const value = formData.get(key);
  return typeof value === "string" ? value : "";
}

export async function loginAction(formData: FormData): Promise<void> {
  const requestHeaders = await headers();
  const address = requestHeaders.get("x-real-ip")?.trim()
    || requestHeaders.get("x-vercel-forwarded-for")?.split(",")[0]?.trim()
    || requestHeaders.get("x-forwarded-for")?.split(",").at(-1)?.trim()
    || "unknown";
  const email = formText(formData, "email").trim().toLowerCase().slice(0, 254);
  const attemptKey = `${address}:${email}`;
  if (!takeAttempt(attemptKey)) {
    await setAdminLoginFlash("invalid");
    redirect("/admin/login");
  }
  const result = await verifyAdminCredentials(email, formText(formData, "password"));
  if (!result.ok) {
    await setAdminLoginFlash(result.reason);
    redirect("/admin/login");
  }

  await createAdminSession(result.email);
  attempts.delete(attemptKey);
  redirect("/admin");
}

export async function logoutAction(): Promise<void> {
  await destroyAdminSession();
  redirect("/admin/login");
}

function takeAttempt(key: string): boolean {
  const now = Date.now();
  for (const [candidate, bucket] of attempts) {
    if (bucket.resetAt <= now) attempts.delete(candidate);
  }
  if (attempts.size >= MAX_ATTEMPT_BUCKETS && !attempts.has(key)) {
    const oldest = attempts.keys().next().value;
    if (oldest) attempts.delete(oldest);
  }
  const current = attempts.get(key);
  if (!current || current.resetAt <= now) {
    attempts.set(key, { count: 1, resetAt: now + ATTEMPT_WINDOW_MS });
    return true;
  }
  if (current.count >= 6) return false;
  current.count += 1;
  return true;
}
