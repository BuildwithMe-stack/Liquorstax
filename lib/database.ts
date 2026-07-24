import { neon, type NeonQueryFunction } from "@neondatabase/serverless";
import { createHash, randomUUID } from "node:crypto";
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

export class DeliverySlotUnavailableError extends Error {
  constructor() {
    super("That delivery window has just filled. Please choose another time.");
    this.name = "DeliverySlotUnavailableError";
  }
}

export class CheckoutTokenConflictError extends Error {
  constructor(message = "This checkout attempt no longer matches the reserved order. Please refresh your cart and try again.") {
    super(message);
    this.name = "CheckoutTokenConflictError";
  }
}

export class InventoryUnavailableError extends Error {
  constructor() {
    super("One or more products changed or sold out. Please refresh your cart and try again.");
    this.name = "InventoryUnavailableError";
  }
}

export type PaidOrderSummary = {
  orderNumber: string;
  notificationClaimToken: string;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
  deliveryAddress: string;
  deliveryInstructions: string;
  deliveryMethod: "express" | "normal";
  deliverySlot: string;
  receiptPreference: "email" | "sms" | "both";
  subtotalCents: number;
  deliveryFeeCents: number;
  maintenanceFeeCents: number;
  gstIncludedCents: number;
  totalCents: number;
  items: Array<{ productName: string; quantity: number }>;
};

export type PaymentSessionStatus = {
  status: "pending" | "paid";
  orderNumber: string;
  deliverySlot: string;
  totalCents: number;
  itemIds: number[];
};

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
        customer_phone, receipt_preference, delivery_address, delivery_instructions, delivery_slot,
        subtotal_cents, delivery_fee_cents, total_cents, status
      )
      VALUES (
        ${order.checkoutToken}, ${orderNumber}, ${DEMO_ACCOUNT_ID},
        ${order.customer.name}, ${order.customer.email}, ${order.customer.phone},
        ${order.receiptPreference}, ${order.customer.address}, ${order.customer.instructions},
        ${order.deliverySlot}, ${order.subtotalCents},
        ${order.deliveryFeeCents}, ${order.totalCents}, 'pending'
      )
      ON CONFLICT (checkout_token) WHERE checkout_token IS NOT NULL DO NOTHING
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

export async function createPendingPaymentOrder(order: ValidatedCheckout, capacity: number): Promise<string> {
  await ensureSchema();
  const sql = getClient();
  if (!Number.isInteger(capacity) || capacity < 1 || capacity > 1_000) {
    throw new Error("Delivery capacity is not configured");
  }
  await releaseExpiredPaymentReservations(sql);
  const orderNumber = `LS-${randomUUID().replaceAll("-", "").slice(0, 12).toUpperCase()}`;
  const proposedCustomerId = randomUUID();
  const checkoutFingerprint = fingerprintCheckout(order);
  const slotCapacity = order.deliveryMethod === "normal" ? 1_000 : capacity;
  const itemPayload = JSON.stringify(order.items.map((item) => ({
    product_id: item.productId,
    product_name: item.productName,
    unit_price_cents: item.unitPriceCents,
    quantity: item.quantity,
  })));

  const results = await sql.transaction((transaction) => [
    transaction`SELECT pg_advisory_xact_lock(hashtext(${`checkout:${order.checkoutToken}`}))`,
    transaction`SELECT pg_advisory_xact_lock(hashtext(${`delivery-slot:${order.deliverySlot}`}))`,
    transaction`SELECT pg_advisory_xact_lock(hashtext(${`customer:${order.customer.email}`}))`,
    transaction`
      WITH requested AS MATERIALIZED (
        SELECT *
        FROM jsonb_to_recordset(${itemPayload}::jsonb) AS item(
          product_id integer,
          product_name text,
          unit_price_cents integer,
          quantity integer
        )
      ),
      token_state AS MATERIALIZED (
        SELECT
          order_number,
          checkout_fingerprint,
          status,
          inventory_reservation_state
        FROM orders
        WHERE checkout_token = ${order.checkoutToken}
        LIMIT 1
      ),
      locked_products AS MATERIALIZED (
        SELECT
          products.id,
          products.name,
          products.price_cents,
          products.inventory_quantity,
          products.is_active,
          products.is_placeholder,
          requested.product_name,
          requested.unit_price_cents,
          requested.quantity
        FROM store_products AS products
        JOIN requested ON requested.product_id = products.id
        ORDER BY products.id
        FOR UPDATE OF products
      ),
      eligibility AS (
        SELECT
          (SELECT count(*) FROM requested) = (SELECT count(*) FROM locked_products)
          AND NOT EXISTS (
            SELECT 1
            FROM locked_products
            WHERE is_active IS NOT TRUE
              OR is_placeholder IS TRUE
              OR inventory_quantity IS NULL
              OR inventory_quantity < quantity
              OR price_cents IS DISTINCT FROM unit_price_cents
              OR name IS DISTINCT FROM product_name
          ) AS stock_ok
      ),
      slot AS (
        SELECT count(*) < ${slotCapacity} AS available
        FROM orders
        WHERE delivery_slot = ${order.deliverySlot}
          AND (
            status = 'paid'
            OR (
              status = 'pending_payment'
              AND inventory_reservation_state = 'reserved'
              AND created_at > now() - interval '35 minutes'
            )
          )
      ),
      existing_customer AS MATERIALIZED (
        SELECT id
        FROM customers
        WHERE lower(email) = lower(${order.customer.email})
        ORDER BY id
        LIMIT 1
        FOR UPDATE
      ),
      updated_customer AS (
        UPDATE customers
        SET
          name = ${order.customer.name},
          phone_e164 = ${order.customer.phone},
          updated_at = now()
        FROM eligibility, slot
        WHERE customers.id = (SELECT id FROM existing_customer)
          AND eligibility.stock_ok
          AND slot.available
          AND NOT EXISTS (SELECT 1 FROM token_state)
        RETURNING customers.id
      ),
      inserted_customer AS (
        INSERT INTO customers (id, name, email, phone_e164)
        SELECT
          ${proposedCustomerId},
          ${order.customer.name},
          ${order.customer.email},
          ${order.customer.phone}
        FROM eligibility, slot
        WHERE eligibility.stock_ok
          AND slot.available
          AND NOT EXISTS (SELECT 1 FROM token_state)
          AND NOT EXISTS (SELECT 1 FROM existing_customer)
        ON CONFLICT (email) DO UPDATE SET
          name = EXCLUDED.name,
          phone_e164 = EXCLUDED.phone_e164,
          updated_at = now()
        RETURNING customers.id
      ),
      customer_record AS (
        SELECT id FROM updated_customer
        UNION ALL
        SELECT id FROM inserted_customer
      ),
      cleared_addresses AS (
        UPDATE customer_addresses
        SET is_default = false, updated_at = now()
        FROM customer_record
        WHERE customer_addresses.customer_id = customer_record.id
          AND customer_addresses.formatted_address <> ${order.customer.address}
          AND customer_addresses.is_default = true
        RETURNING customer_addresses.id
      ),
      address_clear_barrier AS (
        SELECT count(*) AS cleared_count
        FROM cleared_addresses
      ),
      stored_address AS (
        INSERT INTO customer_addresses (
          customer_id, google_place_id, formatted_address, is_default
        )
        SELECT
          customer_record.id,
          ${order.destinationPlaceId || null},
          ${order.customer.address},
          true
        FROM customer_record, address_clear_barrier
        ON CONFLICT (customer_id, formatted_address) DO UPDATE SET
          google_place_id = COALESCE(EXCLUDED.google_place_id, customer_addresses.google_place_id),
          is_default = true,
          updated_at = now()
        RETURNING customer_addresses.customer_id
      ),
      inserted_order AS (
        INSERT INTO orders (
          checkout_token, checkout_fingerprint, order_number, account_id, customer_id,
          customer_name, customer_email, customer_phone, receipt_preference,
          delivery_address, delivery_instructions, delivery_method, delivery_date,
          delivery_slot, destination_place_id, distance_meters, duration_seconds,
          delivery_rate_cents_per_km, subtotal_cents, delivery_fee_cents,
          maintenance_fee_cents, gst_included_cents, total_cents, payment_method,
          status, inventory_reservation_state, inventory_reserved_at
        )
        SELECT
          ${order.checkoutToken}, ${checkoutFingerprint}, ${orderNumber}, NULL, customer_record.id,
          ${order.customer.name}, ${order.customer.email}, ${order.customer.phone},
          ${order.receiptPreference}, ${order.customer.address}, ${order.customer.instructions},
          ${order.deliveryMethod}, ${order.deliveryDate}, ${order.deliverySlot},
          ${order.destinationPlaceId || null}, ${order.distanceMeters}, ${order.durationSeconds},
          ${order.deliveryRateCentsPerKm}, ${order.subtotalCents}, ${order.deliveryFeeCents},
          ${order.maintenanceFeeCents}, ${order.gstIncludedCents}, ${order.totalCents},
          'stripe', 'pending_payment', 'reserved', now()
        FROM eligibility, slot, customer_record, stored_address
        WHERE eligibility.stock_ok
          AND slot.available
          AND NOT EXISTS (SELECT 1 FROM token_state)
          AND stored_address.customer_id = customer_record.id
        ON CONFLICT (checkout_token) WHERE checkout_token IS NOT NULL DO NOTHING
        RETURNING order_number
      ),
      decremented AS (
        UPDATE store_products AS products
        SET
          inventory_quantity = products.inventory_quantity - requested.quantity,
          updated_at = now()
        FROM requested, inserted_order, locked_products
        WHERE products.id = requested.product_id
          AND locked_products.id = products.id
        RETURNING products.id
      ),
      inserted_items AS (
        INSERT INTO order_items (order_number, product_id, product_name, unit_price_cents, quantity)
        SELECT
          inserted_order.order_number,
          requested.product_id,
          requested.product_name,
          requested.unit_price_cents,
          requested.quantity
        FROM inserted_order, requested
        RETURNING id
      ),
      result AS (
        SELECT
          eligibility.stock_ok,
          slot.available AS slot_available,
          (SELECT order_number FROM inserted_order) AS inserted_order_number,
          (SELECT order_number FROM token_state) AS existing_order_number,
          (SELECT checkout_fingerprint FROM token_state) AS existing_checkout_fingerprint,
          (SELECT status FROM token_state) AS existing_status,
          (SELECT inventory_reservation_state FROM token_state) AS existing_reservation_state,
          (SELECT count(*) FROM requested)::integer AS requested_count,
          (SELECT count(*) FROM decremented)::integer AS decremented_count,
          (SELECT count(*) FROM inserted_items)::integer AS inserted_item_count
        FROM eligibility, slot
      )
      SELECT
        stock_ok,
        slot_available,
        inserted_order_number,
        existing_order_number,
        existing_checkout_fingerprint,
        existing_status,
        existing_reservation_state,
        1 / CASE
          WHEN inserted_order_number IS NULL
            OR (requested_count = decremented_count AND requested_count = inserted_item_count)
          THEN 1
          ELSE 0
        END AS reservation_invariant
      FROM result
    `,
  ]);

  const reservation = results[3]?.[0] as {
    stock_ok?: boolean;
    slot_available?: boolean;
    inserted_order_number?: string | null;
    existing_order_number?: string | null;
    existing_checkout_fingerprint?: string | null;
    existing_status?: string | null;
    existing_reservation_state?: string | null;
  } | undefined;
  if (reservation?.inserted_order_number) return reservation.inserted_order_number;
  if (reservation?.existing_order_number) {
    if (reservation.existing_checkout_fingerprint !== checkoutFingerprint) throw new CheckoutTokenConflictError();
    if (reservation.existing_status !== "pending_payment" || reservation.existing_reservation_state !== "reserved") {
      throw new CheckoutTokenConflictError("This checkout attempt has already finished. Please start a new checkout.");
    }
    return reservation.existing_order_number;
  }
  if (reservation?.stock_ok === false) throw new InventoryUnavailableError();
  if (reservation?.slot_available === false) throw new DeliverySlotUnavailableError();
  throw new Error("Unable to reserve the order");
}

export async function releasePendingPaymentOrder(orderNumber: string): Promise<void> {
  await ensureSchema();
  const sql = getClient();
  await sql`
    WITH released AS (
      UPDATE orders
      SET
        status = 'payment_setup_failed',
        inventory_reservation_state = 'released',
        inventory_released_at = now()
      WHERE order_number = ${orderNumber}
        AND status = 'pending_payment'
        AND stripe_session_id IS NULL
        AND inventory_reservation_state = 'reserved'
      RETURNING order_number
    ),
    returned_inventory AS (
      SELECT items.product_id, sum(items.quantity)::integer AS quantity
      FROM order_items AS items
      JOIN released ON released.order_number = items.order_number
      GROUP BY items.product_id
    ),
    restored AS (
      UPDATE store_products AS products
      SET
        inventory_quantity = products.inventory_quantity + returned_inventory.quantity,
        updated_at = now()
      FROM returned_inventory
      WHERE products.id = returned_inventory.product_id
        AND products.inventory_quantity IS NOT NULL
      RETURNING products.id
    )
    SELECT 1 / CASE
      WHEN (SELECT count(*) FROM returned_inventory) = (SELECT count(*) FROM restored) THEN 1
      ELSE 0
    END AS restoration_invariant
  `;
}

export async function attachStripeSession(orderNumber: string, sessionId: string): Promise<void> {
  await ensureSchema();
  const sql = getClient();
  const rows = await sql`
    UPDATE orders
    SET stripe_session_id = ${sessionId}
    WHERE order_number = ${orderNumber}
      AND status = 'pending_payment'
      AND inventory_reservation_state = 'reserved'
      AND (stripe_session_id IS NULL OR stripe_session_id = ${sessionId})
    RETURNING order_number
  `;
  if (!rows.length) throw new Error("The pending order is no longer active");
}

export async function confirmStripePayment(
  sessionId: string,
  paymentIntentId: string,
  paidAmountCents?: number | null,
  paidCurrency?: string | null,
): Promise<PaidOrderSummary | undefined> {
  await ensureSchema();
  const sql = getClient();
  const expectedRows = await sql`
    SELECT order_number, total_cents
    FROM orders
    WHERE stripe_session_id = ${sessionId}
    LIMIT 1
  `;
  const expected = expectedRows[0] as { order_number?: string; total_cents?: number | string } | undefined;
  if (!expected?.order_number) return undefined;
  if (
    !Number.isInteger(paidAmountCents) ||
    Number(paidAmountCents) !== Number(expected.total_cents) ||
    paidCurrency?.toLowerCase() !== "aud"
  ) {
    throw new Error("Stripe payment amount or currency did not match the reserved order");
  }
  const paymentRows = await sql`
    UPDATE orders
    SET
      status = 'paid',
      stripe_payment_intent_id = ${paymentIntentId},
      paid_at = now(),
      inventory_reservation_state = 'consumed'
    WHERE stripe_session_id = ${sessionId}
      AND status = 'pending_payment'
      AND inventory_reservation_state = 'reserved'
    RETURNING order_number
  `;
  if (!paymentRows.length) {
    const currentRows = await sql`
      SELECT status, inventory_reservation_state
      FROM orders
      WHERE stripe_session_id = ${sessionId}
      LIMIT 1
    `;
    const current = currentRows[0] as {
      status?: string;
      inventory_reservation_state?: string;
    } | undefined;
    if (current?.status !== "paid" || current.inventory_reservation_state !== "consumed") {
      throw new Error("The Stripe session is not attached to an active inventory reservation");
    }
  }
  const notificationClaimToken = randomUUID();
  const claimedRows = await sql`
    UPDATE orders
    SET
      notifications_claimed_at = now(),
      notifications_claim_token = ${notificationClaimToken}
    WHERE order_number = ${expected.order_number}
      AND stripe_session_id = ${sessionId}
      AND status = 'paid'
      AND notifications_sent_at IS NULL
      AND (
        notifications_claimed_at IS NULL
        OR notifications_claimed_at < now() - interval '10 minutes'
      )
    RETURNING order_number
  `;
  if (!claimedRows.length) {
    const notificationRows = await sql`
      SELECT status, notifications_sent_at, notifications_claimed_at
      FROM orders
      WHERE order_number = ${expected.order_number}
        AND stripe_session_id = ${sessionId}
      LIMIT 1
    `;
    const notification = notificationRows[0] as {
      status?: string;
      notifications_sent_at?: string | null;
      notifications_claimed_at?: string | null;
    } | undefined;
    if (
      notification?.status === "paid"
      && !notification.notifications_sent_at
      && notification.notifications_claimed_at
    ) {
      // A concurrent signed Stripe delivery is already sending these messages.
      // Returning a retryable failure keeps Stripe trying if that worker dies.
      throw new Error("Paid-order notifications are already being delivered");
    }
    return undefined;
  }
  const rows = await sql`
    SELECT
      orders.order_number,
      orders.customer_name,
      orders.customer_email,
      orders.customer_phone,
      orders.delivery_address,
      orders.delivery_instructions,
      orders.delivery_method,
      orders.delivery_slot,
      orders.receipt_preference,
      orders.subtotal_cents,
      orders.delivery_fee_cents,
      orders.maintenance_fee_cents,
      orders.gst_included_cents,
      orders.total_cents,
      COALESCE(
        json_agg(
          json_build_object(
            'productName', order_items.product_name,
            'quantity', order_items.quantity
          ) ORDER BY order_items.id
        ) FILTER (WHERE order_items.id IS NOT NULL),
        '[]'::json
      ) AS items
    FROM orders
    LEFT JOIN order_items ON order_items.order_number = orders.order_number
    WHERE orders.stripe_session_id = ${sessionId}
      AND orders.status = 'paid'
      AND orders.notifications_sent_at IS NULL
      AND orders.notifications_claim_token = ${notificationClaimToken}
    GROUP BY orders.id
    LIMIT 1
  `;
  const row = rows[0] as {
    order_number?: string;
    customer_name?: string;
    customer_email?: string;
    customer_phone?: string;
    delivery_address?: string;
    delivery_instructions?: string;
    delivery_method?: "express" | "normal";
    delivery_slot?: string;
    receipt_preference?: "email" | "sms" | "both";
    subtotal_cents?: number | string;
    delivery_fee_cents?: number | string;
    maintenance_fee_cents?: number | string;
    gst_included_cents?: number | string;
    total_cents?: number | string;
    items?: Array<{ productName: string; quantity: number }>;
  } | undefined;
  if (!row?.order_number) return undefined;
  return {
    orderNumber: row.order_number,
    notificationClaimToken,
    customerName: row.customer_name ?? "Customer",
    customerEmail: row.customer_email ?? "",
    customerPhone: row.customer_phone ?? "",
    deliveryAddress: row.delivery_address ?? "",
    deliveryInstructions: row.delivery_instructions ?? "",
    deliveryMethod: row.delivery_method === "normal" ? "normal" : "express",
    deliverySlot: row.delivery_slot ?? "",
    receiptPreference: row.receipt_preference ?? "email",
    subtotalCents: Number(row.subtotal_cents ?? 0),
    deliveryFeeCents: Number(row.delivery_fee_cents ?? 0),
    maintenanceFeeCents: Number(row.maintenance_fee_cents ?? 0),
    gstIncludedCents: Number(row.gst_included_cents ?? 0),
    totalCents: Number(row.total_cents ?? 0),
    items: row.items ?? [],
  };
}

export async function markOrderNotificationsSent(
  orderNumber: string,
  notificationClaimToken: string,
): Promise<void> {
  await ensureSchema();
  const sql = getClient();
  await sql`
    UPDATE orders
    SET
      notifications_sent_at = now(),
      notifications_claimed_at = NULL,
      notifications_claim_token = NULL
    WHERE order_number = ${orderNumber}
      AND status = 'paid'
      AND notifications_sent_at IS NULL
      AND notifications_claim_token = ${notificationClaimToken}
  `;
}

export async function markStripeSessionUnavailable(
  sessionId: string,
  status: "payment_expired" | "payment_failed",
): Promise<void> {
  await ensureSchema();
  const sql = getClient();
  await sql`
    WITH released AS (
      UPDATE orders
      SET
        status = ${status},
        inventory_reservation_state = 'released',
        inventory_released_at = now()
      WHERE stripe_session_id = ${sessionId}
        AND status = 'pending_payment'
        AND inventory_reservation_state = 'reserved'
      RETURNING order_number
    ),
    returned_inventory AS (
      SELECT items.product_id, sum(items.quantity)::integer AS quantity
      FROM order_items AS items
      JOIN released ON released.order_number = items.order_number
      GROUP BY items.product_id
    ),
    restored AS (
      UPDATE store_products AS products
      SET
        inventory_quantity = products.inventory_quantity + returned_inventory.quantity,
        updated_at = now()
      FROM returned_inventory
      WHERE products.id = returned_inventory.product_id
        AND products.inventory_quantity IS NOT NULL
      RETURNING products.id
    )
    SELECT 1 / CASE
      WHEN (SELECT count(*) FROM returned_inventory) = (SELECT count(*) FROM restored) THEN 1
      ELSE 0
    END AS restoration_invariant
  `;
}

export async function getPaymentSessionStatus(sessionId: string): Promise<PaymentSessionStatus | undefined> {
  await ensureSchema();
  const sql = getClient();
  const rows = await sql`
    SELECT
      orders.order_number,
      orders.status,
      orders.delivery_slot,
      orders.total_cents,
      COALESCE(
        json_agg(
          json_build_object(
            'productId', order_items.product_id,
            'quantity', order_items.quantity
          ) ORDER BY order_items.id
        ) FILTER (WHERE order_items.id IS NOT NULL),
        '[]'::json
      ) AS items
    FROM orders
    LEFT JOIN order_items ON order_items.order_number = orders.order_number
    WHERE orders.stripe_session_id = ${sessionId}
      AND orders.status IN ('pending_payment', 'paid')
    GROUP BY orders.id
    LIMIT 1
  `;
  const row = rows[0] as {
    order_number?: string;
    status?: "pending_payment" | "paid";
    delivery_slot?: string;
    total_cents?: number | string;
    items?: Array<{ productId: number; quantity: number }>;
  } | undefined;
  if (!row?.order_number || !row.status) return undefined;
  return {
    status: row.status === "paid" ? "paid" : "pending",
    orderNumber: row.order_number,
    deliverySlot: row.delivery_slot ?? "",
    totalCents: Number(row.total_cents ?? 0),
    itemIds: (row.items ?? []).flatMap((item) => Array.from({ length: item.quantity }, () => item.productId)),
  };
}

function fingerprintCheckout(order: ValidatedCheckout): string {
  const immutableOrder = {
    version: 1,
    customer: order.customer,
    receiptPreference: order.receiptPreference,
    paymentMethod: order.paymentMethod,
    delivery: {
      method: order.deliveryMethod,
      slot: order.deliverySlot,
      date: order.deliveryDate,
      destinationPlaceId: order.destinationPlaceId,
      distanceMeters: order.distanceMeters,
      durationSeconds: order.durationSeconds,
      rateCentsPerKm: order.deliveryRateCentsPerKm,
    },
    items: [...order.items]
      .sort((left, right) => left.productId - right.productId)
      .map((item) => ({
        productId: item.productId,
        productName: item.productName,
        unitPriceCents: item.unitPriceCents,
        quantity: item.quantity,
      })),
    subtotalCents: order.subtotalCents,
    deliveryFeeCents: order.deliveryFeeCents,
    maintenanceFeeCents: order.maintenanceFeeCents,
    gstIncludedCents: order.gstIncludedCents,
    totalCents: order.totalCents,
  };
  return createHash("sha256").update(JSON.stringify(immutableOrder)).digest("hex");
}

async function releaseExpiredPaymentReservations(
  sql: NeonQueryFunction<false, false>,
): Promise<void> {
  await sql`
    WITH released AS (
      UPDATE orders
      SET
        status = 'payment_expired',
        inventory_reservation_state = 'released',
        inventory_released_at = now()
      WHERE status = 'pending_payment'
        AND inventory_reservation_state = 'reserved'
        AND stripe_session_id IS NULL
        AND created_at <= now() - interval '35 minutes'
      RETURNING order_number
    ),
    returned_inventory AS (
      SELECT items.product_id, sum(items.quantity)::integer AS quantity
      FROM order_items AS items
      JOIN released ON released.order_number = items.order_number
      GROUP BY items.product_id
    ),
    restored AS (
      UPDATE store_products AS products
      SET
        inventory_quantity = products.inventory_quantity + returned_inventory.quantity,
        updated_at = now()
      FROM returned_inventory
      WHERE products.id = returned_inventory.product_id
        AND products.inventory_quantity IS NOT NULL
      RETURNING products.id
    )
    SELECT 1 / CASE
      WHEN (SELECT count(*) FROM returned_inventory) = (SELECT count(*) FROM restored) THEN 1
      ELSE 0
    END AS restoration_invariant
  `;
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
      CREATE TABLE IF NOT EXISTS customers (
        id text PRIMARY KEY,
        name text NOT NULL,
        email text NOT NULL UNIQUE,
        phone_e164 text NOT NULL,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now()
      )
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS customer_addresses (
        id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        customer_id text NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
        google_place_id text,
        formatted_address text NOT NULL,
        is_default boolean NOT NULL DEFAULT false,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now(),
        UNIQUE (customer_id, formatted_address)
      )
    `,
    transaction`
      CREATE TABLE IF NOT EXISTS orders (
        id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        checkout_token text,
        checkout_fingerprint text CHECK (
          checkout_fingerprint IS NULL OR checkout_fingerprint ~ '^[0-9a-f]{64}$'
        ),
        order_number text NOT NULL UNIQUE,
        account_id text REFERENCES customer_accounts(id),
        customer_id text REFERENCES customers(id),
        customer_name text NOT NULL,
        customer_email text NOT NULL,
        customer_phone text NOT NULL DEFAULT '',
        receipt_preference text NOT NULL DEFAULT 'email',
        delivery_address text NOT NULL,
        delivery_instructions text NOT NULL DEFAULT '',
        delivery_method text NOT NULL DEFAULT 'express',
        delivery_date date,
        delivery_slot text NOT NULL,
        destination_place_id text,
        distance_meters integer NOT NULL DEFAULT 0 CHECK (distance_meters >= 0),
        duration_seconds integer NOT NULL DEFAULT 0 CHECK (duration_seconds >= 0),
        delivery_rate_cents_per_km integer NOT NULL DEFAULT 0 CHECK (delivery_rate_cents_per_km >= 0),
        subtotal_cents integer NOT NULL CHECK (subtotal_cents >= 0),
        delivery_fee_cents integer NOT NULL CHECK (delivery_fee_cents >= 0),
        maintenance_fee_cents integer NOT NULL DEFAULT 99 CHECK (maintenance_fee_cents >= 0),
        gst_included_cents integer NOT NULL DEFAULT 0 CHECK (gst_included_cents >= 0),
        total_cents integer NOT NULL CHECK (total_cents >= 0),
        payment_method text NOT NULL DEFAULT 'account_credit',
        stripe_session_id text,
        stripe_payment_intent_id text,
        status text NOT NULL DEFAULT 'confirmed',
        inventory_reservation_state text NOT NULL DEFAULT 'not_applicable' CHECK (
          inventory_reservation_state IN ('not_applicable', 'reserved', 'released', 'consumed')
        ),
        inventory_reserved_at timestamptz,
        inventory_released_at timestamptz,
        paid_at timestamptz,
        notifications_sent_at timestamptz,
        notifications_claimed_at timestamptz,
        notifications_claim_token text,
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
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS checkout_fingerprint text`,
    transaction`ALTER TABLE orders ALTER COLUMN account_id DROP NOT NULL`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS customer_id text REFERENCES customers(id)`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS customer_phone text NOT NULL DEFAULT ''`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS receipt_preference text NOT NULL DEFAULT 'email'`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS delivery_method text NOT NULL DEFAULT 'express'`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS delivery_date date`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS destination_place_id text`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS distance_meters integer NOT NULL DEFAULT 0`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS duration_seconds integer NOT NULL DEFAULT 0`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS delivery_rate_cents_per_km integer NOT NULL DEFAULT 0`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS maintenance_fee_cents integer NOT NULL DEFAULT 99`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS gst_included_cents integer NOT NULL DEFAULT 0`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS stripe_session_id text`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS stripe_payment_intent_id text`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS inventory_reservation_state text NOT NULL DEFAULT 'not_applicable'`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS inventory_reserved_at timestamptz`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS inventory_released_at timestamptz`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS paid_at timestamptz`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS notifications_sent_at timestamptz`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS notifications_claimed_at timestamptz`,
    transaction`ALTER TABLE orders ADD COLUMN IF NOT EXISTS notifications_claim_token text`,
    transaction`ALTER TABLE orders ALTER COLUMN maintenance_fee_cents SET DEFAULT 99`,
    transaction`
      DO $$
      BEGIN
        IF NOT EXISTS (
          SELECT 1 FROM pg_constraint
          WHERE conname = 'orders_checkout_fingerprint_check'
            AND conrelid = 'orders'::regclass
        ) THEN
          ALTER TABLE orders ADD CONSTRAINT orders_checkout_fingerprint_check
            CHECK (checkout_fingerprint IS NULL OR checkout_fingerprint ~ '^[0-9a-f]{64}$');
        END IF;
        IF NOT EXISTS (
          SELECT 1 FROM pg_constraint
          WHERE conname = 'orders_inventory_reservation_state_check'
            AND conrelid = 'orders'::regclass
        ) THEN
          ALTER TABLE orders ADD CONSTRAINT orders_inventory_reservation_state_check
            CHECK (inventory_reservation_state IN ('not_applicable', 'reserved', 'released', 'consumed'));
        END IF;
        IF NOT EXISTS (
          SELECT 1 FROM pg_constraint
          WHERE conname = 'orders_inventory_reservation_fingerprint_check'
            AND conrelid = 'orders'::regclass
        ) THEN
          ALTER TABLE orders ADD CONSTRAINT orders_inventory_reservation_fingerprint_check
            CHECK (
              inventory_reservation_state = 'not_applicable'
              OR (checkout_fingerprint IS NOT NULL AND inventory_reserved_at IS NOT NULL)
            );
        END IF;
      END $$
    `,
    transaction`CREATE UNIQUE INDEX IF NOT EXISTS orders_checkout_token_idx ON orders (checkout_token)`,
    transaction`CREATE UNIQUE INDEX IF NOT EXISTS orders_stripe_session_idx ON orders (stripe_session_id) WHERE stripe_session_id IS NOT NULL`,
    transaction`CREATE INDEX IF NOT EXISTS orders_inventory_reservation_idx ON orders (status, inventory_reservation_state, created_at)`,
    transaction`CREATE INDEX IF NOT EXISTS orders_account_idx ON orders (account_id)`,
    transaction`CREATE INDEX IF NOT EXISTS orders_customer_idx ON orders (customer_id)`,
    transaction`CREATE INDEX IF NOT EXISTS orders_delivery_report_idx ON orders (delivery_method, delivery_date, status)`,
    transaction`CREATE INDEX IF NOT EXISTS orders_notifications_pending_idx ON orders (notifications_claimed_at) WHERE status = 'paid' AND notifications_sent_at IS NULL`,
    transaction`CREATE INDEX IF NOT EXISTS order_items_order_idx ON order_items (order_number)`,
    transaction`CREATE UNIQUE INDEX IF NOT EXISTS order_items_order_product_idx ON order_items (order_number, product_id)`,
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
