import { sql } from "drizzle-orm";
import { integer, real, sqliteTable, text } from "drizzle-orm/sqlite-core";

export const customerAccounts = sqliteTable("customer_accounts", {
  id: text("id").primaryKey(),
  email: text("email").notNull(),
  displayName: text("display_name").notNull(),
  creditBalance: real("credit_balance").notNull().default(250),
  createdAt: text("created_at").notNull().default(sql`CURRENT_TIMESTAMP`),
});

export const orders = sqliteTable("orders", {
  id: integer("id").primaryKey({ autoIncrement: true }),
  orderNumber: text("order_number").notNull().unique(),
  accountId: text("account_id").notNull(),
  customerName: text("customer_name").notNull(),
  customerEmail: text("customer_email").notNull(),
  deliveryAddress: text("delivery_address").notNull(),
  deliveryInstructions: text("delivery_instructions").notNull().default(""),
  deliverySlot: text("delivery_slot").notNull(),
  subtotal: real("subtotal").notNull(),
  deliveryFee: real("delivery_fee").notNull(),
  total: real("total").notNull(),
  paymentMethod: text("payment_method").notNull().default("account_credit"),
  status: text("status").notNull().default("confirmed"),
  createdAt: text("created_at").notNull().default(sql`CURRENT_TIMESTAMP`),
});

export const orderItems = sqliteTable("order_items", {
  id: integer("id").primaryKey({ autoIncrement: true }),
  orderNumber: text("order_number").notNull(),
  productId: integer("product_id").notNull(),
  productName: text("product_name").notNull(),
  unitPrice: real("unit_price").notNull(),
  quantity: integer("quantity").notNull(),
});

export const accountTransactions = sqliteTable("account_transactions", {
  id: integer("id").primaryKey({ autoIncrement: true }),
  accountId: text("account_id").notNull(),
  orderNumber: text("order_number").notNull(),
  amount: real("amount").notNull(),
  type: text("type").notNull().default("order_charge"),
  createdAt: text("created_at").notNull().default(sql`CURRENT_TIMESTAMP`),
});
