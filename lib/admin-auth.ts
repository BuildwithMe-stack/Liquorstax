import { createHmac, randomBytes, scryptSync, timingSafeEqual } from "node:crypto";
import { cookies } from "next/headers";

const SESSION_COOKIE = "liquor_stax_admin_session";
const LOGIN_FLASH_COOKIE = "liquor_stax_admin_login_flash";
const SESSION_TTL_SECONDS = 8 * 60 * 60;
const MINIMUM_SESSION_SECRET_LENGTH = 32;
const MAX_EMAIL_LENGTH = 254;
const MAX_PASSWORD_LENGTH = 1024;

type PasswordHash = {
  cost: number;
  blockSize: number;
  parallelization: number;
  salt: Buffer;
  digest: Buffer;
};

type SessionPayload = {
  version: 1;
  email: string;
  issuedAt: number;
  expiresAt: number;
  nonce: string;
};

export type AdminSession = Readonly<{
  email: string;
  issuedAt: Date;
  expiresAt: Date;
}>;

export type AdminLoginFlash = "invalid" | "configuration" | undefined;

export type AdminCredentialResult =
  | { ok: true; email: string }
  | { ok: false; reason: "invalid" | "configuration" };

function normaliseEmail(value: string): string {
  return value.trim().toLowerCase();
}

function sessionSecret(): string | undefined {
  const value = process.env.ADMIN_SESSION_SECRET;
  return value && value.length >= MINIMUM_SESSION_SECRET_LENGTH ? value : undefined;
}

function configuredEmail(): string | undefined {
  const value = process.env.ADMIN_EMAIL;
  if (!value || value.length > MAX_EMAIL_LENGTH) return undefined;
  const normalised = normaliseEmail(value);
  return normalised.includes("@") ? normalised : undefined;
}

function decodeBase64Url(value: string): Buffer | undefined {
  if (!/^[A-Za-z0-9_-]+$/.test(value)) return undefined;
  try {
    return Buffer.from(value, "base64url");
  } catch {
    return undefined;
  }
}

/**
 * ADMIN_PASSWORD_HASH format:
 * scrypt$16384$8$1$<base64url-salt>$<base64url-64-byte-derived-key>
 */
function parsePasswordHash(value: string | undefined): PasswordHash | undefined {
  if (!value) return undefined;
  const [algorithm, rawCost, rawBlockSize, rawParallelization, rawSalt, rawDigest, ...rest] = value.split("$");
  if (algorithm !== "scrypt" || rest.length > 0) return undefined;

  const cost = Number(rawCost);
  const blockSize = Number(rawBlockSize);
  const parallelization = Number(rawParallelization);
  const salt = decodeBase64Url(rawSalt ?? "");
  const digest = decodeBase64Url(rawDigest ?? "");

  if (
    !Number.isInteger(cost) ||
    cost < 16_384 ||
    cost > 262_144 ||
    (cost & (cost - 1)) !== 0 ||
    !Number.isInteger(blockSize) ||
    blockSize < 8 ||
    blockSize > 32 ||
    !Number.isInteger(parallelization) ||
    parallelization < 1 ||
    parallelization > 8 ||
    !salt ||
    salt.length < 16 ||
    !digest ||
    digest.length < 32 ||
    digest.length > 64
  ) {
    return undefined;
  }

  return { cost, blockSize, parallelization, salt, digest };
}

function derivePassword(password: string, hash: PasswordHash): Buffer {
  const requiredMemory = 128 * hash.cost * hash.blockSize + 1024 * 1024;
  return scryptSync(password, hash.salt, hash.digest.length, {
    N: hash.cost,
    r: hash.blockSize,
    p: hash.parallelization,
    maxmem: Math.max(64 * 1024 * 1024, requiredMemory),
  });
}

function constantTimeTextEqual(left: string, right: string): boolean {
  const leftDigest = createHmac("sha256", "liquor-stax-admin-email").update(left).digest();
  const rightDigest = createHmac("sha256", "liquor-stax-admin-email").update(right).digest();
  return timingSafeEqual(leftDigest, rightDigest);
}

export function isAdminAuthConfigured(): boolean {
  return Boolean(configuredEmail() && parsePasswordHash(process.env.ADMIN_PASSWORD_HASH) && sessionSecret());
}

export function createAdminPasswordHash(password: string): string {
  if (!password || password.length > MAX_PASSWORD_LENGTH) {
    throw new Error("Admin password must be between 1 and 1024 characters");
  }
  const cost = 16_384;
  const blockSize = 8;
  const parallelization = 1;
  const salt = randomBytes(16);
  const digest = scryptSync(password, salt, 64, {
    N: cost,
    r: blockSize,
    p: parallelization,
    maxmem: 64 * 1024 * 1024,
  });
  return [
    "scrypt",
    cost,
    blockSize,
    parallelization,
    salt.toString("base64url"),
    digest.toString("base64url"),
  ].join("$");
}

export function verifyAdminPassword(password: string, encodedHash: string): boolean {
  const hash = parsePasswordHash(encodedHash);
  if (!hash || !password || password.length > MAX_PASSWORD_LENGTH) return false;
  const candidate = derivePassword(password, hash);
  return timingSafeEqual(candidate, hash.digest);
}

export async function verifyAdminCredentials(email: string, password: string): Promise<AdminCredentialResult> {
  const expectedEmail = configuredEmail();
  const encodedHash = process.env.ADMIN_PASSWORD_HASH;
  const hash = parsePasswordHash(encodedHash);
  const secret = sessionSecret();

  if (!expectedEmail || !hash || !secret) {
    return { ok: false, reason: "configuration" };
  }

  const suppliedEmail = normaliseEmail(email).slice(0, MAX_EMAIL_LENGTH + 1);
  const emailMatches = constantTimeTextEqual(suppliedEmail, expectedEmail);
  const passwordMatches =
    password.length > 0 && password.length <= MAX_PASSWORD_LENGTH
      ? timingSafeEqual(derivePassword(password, hash), hash.digest)
      : false;

  return emailMatches && passwordMatches
    ? { ok: true, email: expectedEmail }
    : { ok: false, reason: "invalid" };
}

function signPayload(encodedPayload: string, secret: string): string {
  return createHmac("sha256", secret).update(encodedPayload).digest("base64url");
}

function serialiseSession(email: string, secret: string): string {
  const issuedAt = Math.floor(Date.now() / 1000);
  const payload: SessionPayload = {
    version: 1,
    email,
    issuedAt,
    expiresAt: issuedAt + SESSION_TTL_SECONDS,
    nonce: randomBytes(16).toString("base64url"),
  };
  const encodedPayload = Buffer.from(JSON.stringify(payload)).toString("base64url");
  return `${encodedPayload}.${signPayload(encodedPayload, secret)}`;
}

function parseSession(value: string, secret: string, expectedEmail: string): AdminSession | undefined {
  const [encodedPayload, suppliedSignature, ...rest] = value.split(".");
  if (!encodedPayload || !suppliedSignature || rest.length > 0) return undefined;

  const expectedSignature = signPayload(encodedPayload, secret);
  const supplied = Buffer.from(suppliedSignature);
  const expected = Buffer.from(expectedSignature);
  if (supplied.length !== expected.length || !timingSafeEqual(supplied, expected)) return undefined;

  try {
    const parsed = JSON.parse(Buffer.from(encodedPayload, "base64url").toString("utf8")) as Partial<SessionPayload>;
    const now = Math.floor(Date.now() / 1000);
    if (
      parsed.version !== 1 ||
      typeof parsed.email !== "string" ||
      typeof parsed.issuedAt !== "number" ||
      typeof parsed.expiresAt !== "number" ||
      typeof parsed.nonce !== "string" ||
      parsed.issuedAt > now + 60 ||
      parsed.expiresAt <= now ||
      parsed.expiresAt - parsed.issuedAt !== SESSION_TTL_SECONDS ||
      !constantTimeTextEqual(parsed.email, expectedEmail)
    ) {
      return undefined;
    }
    return {
      email: parsed.email,
      issuedAt: new Date(parsed.issuedAt * 1000),
      expiresAt: new Date(parsed.expiresAt * 1000),
    };
  } catch {
    return undefined;
  }
}

export async function createAdminSession(email: string): Promise<void> {
  const expectedEmail = configuredEmail();
  const secret = sessionSecret();
  if (!expectedEmail || !secret || !constantTimeTextEqual(normaliseEmail(email), expectedEmail)) {
    throw new Error("Admin authentication is not configured correctly");
  }
  const cookieStore = await cookies();
  cookieStore.set(SESSION_COOKIE, serialiseSession(expectedEmail, secret), {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    path: "/",
    maxAge: SESSION_TTL_SECONDS,
  });
  cookieStore.set(LOGIN_FLASH_COOKIE, "", {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    path: "/admin",
    maxAge: 0,
  });
}

export async function getAdminSession(): Promise<AdminSession | undefined> {
  const expectedEmail = configuredEmail();
  const secret = sessionSecret();
  if (!expectedEmail || !secret) return undefined;
  const value = (await cookies()).get(SESSION_COOKIE)?.value;
  return value ? parseSession(value, secret, expectedEmail) : undefined;
}

export async function destroyAdminSession(): Promise<void> {
  const cookieStore = await cookies();
  cookieStore.set(SESSION_COOKIE, "", {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    path: "/",
    maxAge: 0,
  });
}

export async function setAdminLoginFlash(value: Exclude<AdminLoginFlash, undefined>): Promise<void> {
  (await cookies()).set(LOGIN_FLASH_COOKIE, value, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    path: "/admin",
    maxAge: 90,
  });
}

export async function getAdminLoginFlash(): Promise<AdminLoginFlash> {
  const value = (await cookies()).get(LOGIN_FLASH_COOKIE)?.value;
  return value === "invalid" || value === "configuration" ? value : undefined;
}
