import { neon, type NeonQueryFunction } from "@neondatabase/serverless";
import { randomUUID } from "node:crypto";
import type { ValidatedCheckout } from "./checkout";
import { DEMO_ACCOUNT_OPENING_BALANCE_CENTS } from "./catalogue";

const DEMO_ACCOUNT_ID = "stax-1001";

let client: NeonQueryFunction<false, false> | undefined;
let schemaPromise: Promise<void> | undefined;

export class InsufficientAccountCreditError extends Error {
  constructor() {
    super("Insufficient account credit");
    this.name = "InsufficientAccountCreditError";
  }
}

export function isDatabaseConfigured(): boolean {
  return Boolean(databaseUrl());
}

export async function getAccountBalanceCents(): Promise<number> {
  await ensureSchema();
  const sql = getClient();
  const rows = await sql`
    SELECT credit_balance_cents
    FROM customer_accounts
    WHERE id = ${DEMO_ACCOUNT_ID}
    LIMIT 1
  `;
  const row = rows[0] as { credit_balance_cents?: number | string } | undefined;
  if (!row) throw new Error("Demo customer account was not created");
  return Number(row.credit_balance_cents);
}

export async function placeDatabaseOrder(order: ValidatedCheckout): Promise<{
  orderNumber: string;
  balanceCents: number;
}> {
  await ensureSchema();
  const sql = getClient();
  const orderNumber = `LS-${randomUUID().replaceAll("-", "").slice(0, 12).toUpperCase()}`;
  const itemPayload = JSON.stringify(order.items.map((item) => ({
    product_id: item.productId,
    product_name: item.productName,
    unit_price_cents: item.unitPriceCents,
    quantity: item.quantity,
  })));

  const results = await sql.transaction((transaction) => [
    transaction`
      INSERT INTO orders (
        checkout_token, order_number, account_id, customer_name, customer_email,
        delivery_address, delivery_instructions, delivery_slot,
        subtotal_cents, delivery_fee_cents, total_cents, status
      )
      VALUES (
        ${order.checkoutToken}, ${orderNumber}, ${DEMO_ACCOUNT_ID},
        ${order.customer.name}, ${order.customer.email}, ${order.customer.address},
        ${order.customer.instructions}, ${order.deliverySlot}, ${order.subtotalCents},
        ${order.deliveryFeeCents}, ${order.totalCents}, 'pending'
      )
      ON CONFLICT (checkout_token) DO NOTHING
      RETURNING order_number
    `,
    transaction`
      WITH debited AS (
        UPDATE customer_accounts
        SET credit_balance_cents = credit_balance_cents - ${order.totalCents}
        WHERE id = ${DEMO_ACCOUNT_ID}
          AND credit_balance_cents >= ${order.totalCents}
          AND EXISTS (
            SELECT 1 FROM orders
            WHERE checkout_token = ${order.checkoutToken}
              AND account_id = ${DEMO_ACCOUNT_ID}
              AND status = 'pending'
          )
        RETURNING credit_balance_cents
      )
      UPDATE orders
      SET status = 'processing'
      FROM debited
      WHERE checkout_token = ${order.checkoutToken}
        AND account_id = ${DEMO_ACCOUNT_ID}
        AND status = 'pending'
      RETURNING order_number
    `,
    transaction`
      INSERT INTO order_items (
        order_number, product_id, product_name, unit_price_cents, quantity
      )
      SELECT
        orders.order_number,
        item.product_id,
        item.product_name,
        item.unit_price_cents,
        item.quantity
      FROM orders
      CROSS JOIN jsonb_to_recordset(${itemPayload}::jsonb) AS item(
        product_id integer,
        product_name text,
        unit_price_cents integer,
        quantity integer
      )
      WHERE orders.checkout_token = ${order.checkoutToken}
        AND orders.account_id = ${DEMO_ACCOUNT_ID}
        AND orders.status = 'processing'
      RETURNING id
    `,
    transaction`
      INSERT INTO account_transactions (
        account_id, order_number, amount_cents, transaction_type
      )
      SELECT ${DEMO_ACCOUNT_ID}, order_number, ${-order.totalCents}, 'order_charge'
      FROM orders
      WHERE checkout_token = ${order.checkoutToken}
        AND account_id = ${DEMO_ACCOUNT_ID}
        AND status = 'processing'
      ON CONFLICT (order_number) DO NOTHING
      RETURNING id
    `,
    transaction`
      UPDATE orders
      SET status = 'confirmed'
      WHERE checkout_token = ${order.checkoutToken}
        AND account_id = ${DEMO_ACCOUNT_ID}
        AND status = 'processing'
      RETURNING order_number
    `,
    transaction`
      DELETE FROM orders
      WHERE checkout_token = ${order.checkoutToken}
        AND account_id = ${DEMO_ACCOUNT_ID}
        AND status = 'pending'
      RETURNING order_number
    `,
    transaction`
      SELECT orders.order_number, customer_accounts.credit_balance_cents
      FROM orders
      JOIN customer_accounts ON customer_accounts.id = orders.account_id
      WHERE orders.checkout_token = ${order.checkoutToken}
        AND orders.account_id = ${DEMO_ACCOUNT_ID}
        AND orders.status = 'confirmed'
      LIMIT 1
    `,
  ]);

  const finalRows = results.at(-1) ?? [];
  const row = finalRows[0] as {
    order_number?: string;
    credit_balance_cents?: number | string;
  } | undefined;
  if (!row?.order_number) throw new InsufficientAccountCreditError();

  return {
    orderNumber: row.order_number,
    balanceCents: Number(row.credit_balance_cents),
  };
}

async function ensureSchema(): Promise<void> {
  if (!schemaPromise) {
    schemaPromise = initializeSchema().catch((error) => {
      schemaPromise = undefined;
      throw error;
    });
  }
  await schemaPromise;
}

async function initializeSchema(): Promise<void> {
  const sql = getClient();
  await sql.transaction((transaction) => [
    transaction`SELECT pg_advisory_xact_lock(506782641)`,
    transaction`
      CREATE TABLE IF NOT EXISTS customer_accounts (
        id text PRIMARY KEY,
        email text NOT NULL UNIQUE,
        display_name text NOT NULL,
        credit_balance_cents integer NOT NULL DEFAULT 25000 CHECK (credit_balance_cents >= 0),
        created_at timestamptz NOT NULL DEFAULT now()
      )
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS orders (
        id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        checkout_token text,
        order_number text NOT NULL UNIQUE,
        account_id text NOT NULL REFERENCES customer_accounts(id),
        customer_name text NOT NULL,
        customer_email text NOT NULL,
        delivery_address text NOT NULL,
        delivery_instructions text NOT NULL DEFAULT '',
        delivery_slot text NOT NULL,
        subtotal_cents integer NOT NULL CHECK (subtotal_cents >= 0),
        delivery_fee_cents integer NOT NULL CHECK (delivery_fee_cents >= 0),
        total_cents integer NOT NULL CHECK (total_cents >= 0),
        payment_method text NOT NULL DEFAULT 'account_credit',
        status text NOT NULL DEFAULT 'confirmed',
        created_at timestamptz NOT NULL DEFAULT now()
      )
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS order_items (
        id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        order_number text NOT NULL REFERENCES orders(order_number) ON DELETE CASCADE,
        product_id integer NOT NULL,
        product_name text NOT NULL,
        unit_price_cents integer NOT NULL CHECK (unit_price_cents >= 0),
        quantity integer NOT NULL CHECK (quantity > 0 AND quantity <= 24)
      )
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS account_transactions (
        id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        account_id text NOT NULL REFERENCES customer_accounts(id),
        order_number text NOT NULL REFERENCES orders(order_number),
        amount_cents integer NOT NULL,
        transaction_type text NOT NULL DEFAULT 'order_charge',
        created_at timestamptz NOT NULL DEFAULT now()
      )
    `,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS checkout_token text`,
    transaction`CREATE UNIQUE INDEX IF NOT EXISTS orders_checkout_token_idx ON orders (checkout_token)`,
    transaction`CREATE INDEX IF NOT EXISTS orders_account_idx ON orders (account_id)`,
    transaction`CREATE INDEX IF NOT EXISTS order_items_order_idx ON order_items (order_number)`,
    transaction`CREATE UNIQUE INDEX IF NOT EXISTS account_transactions_order_idx ON account_transactions (order_number)`,
    transaction`
      INSERT INTO customer_accounts (id, email, display_name, credit_balance_cents)
      VALUES (${DEMO_ACCOUNT_ID}, 'alex@example.com', 'Alex Morgan', ${DEMO_ACCOUNT_OPENING_BALANCE_CENTS})
      ON CONFLICT (id) DO NOTHING
    `,
  ]);
}

function getClient(): NeonQueryFunction<false, false> {
  const url = databaseUrl();
  if (!url) throw new Error("DATABASE_URL is not configured");
  client ??= neon(url);
  return client;
}

function databaseUrl(): string | undefined {
  return process.env.DATABASE_URL || process.env.POSTGRES_URL;
}
