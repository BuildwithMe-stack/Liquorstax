import { env } from "cloudflare:workers";
import { NextResponse } from "next/server";

type CheckoutItem = { productId: number; quantity: number };

const catalogue = new Map([
  [1, { name: "Yarra Valley Pinot Noir", price: 24 }],
  [2, { name: "Coastal Pale Ale", price: 22 }],
  [3, { name: "North Star Dry Gin", price: 49 }],
  [4, { name: "Limoncello Spritz", price: 19 }],
  [5, { name: "Barossa Shiraz", price: 18 }],
  [6, { name: "Japanese Malt Whisky", price: 76 }],
  [7, { name: "Crisp Apple Cider", price: 27 }],
  [8, { name: "Zero Proof Aperitivo", price: 29 }],
]);

async function ensureSchema(db: D1Database) {
  await db.batch([
    db.prepare(`CREATE TABLE IF NOT EXISTS customer_accounts (id TEXT PRIMARY KEY, email TEXT NOT NULL, display_name TEXT NOT NULL, credit_balance REAL NOT NULL DEFAULT 250, created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP)`),
    db.prepare(`CREATE TABLE IF NOT EXISTS orders (id INTEGER PRIMARY KEY AUTOINCREMENT, order_number TEXT NOT NULL UNIQUE, account_id TEXT NOT NULL, customer_name TEXT NOT NULL, customer_email TEXT NOT NULL, delivery_address TEXT NOT NULL, delivery_instructions TEXT NOT NULL DEFAULT '', delivery_slot TEXT NOT NULL, subtotal REAL NOT NULL, delivery_fee REAL NOT NULL, total REAL NOT NULL, payment_method TEXT NOT NULL DEFAULT 'account_credit', status TEXT NOT NULL DEFAULT 'confirmed', created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP)`),
    db.prepare(`CREATE TABLE IF NOT EXISTS order_items (id INTEGER PRIMARY KEY AUTOINCREMENT, order_number TEXT NOT NULL, product_id INTEGER NOT NULL, product_name TEXT NOT NULL, unit_price REAL NOT NULL, quantity INTEGER NOT NULL)`),
    db.prepare(`CREATE TABLE IF NOT EXISTS account_transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, account_id TEXT NOT NULL, order_number TEXT NOT NULL, amount REAL NOT NULL, type TEXT NOT NULL DEFAULT 'order_charge', created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP)`),
    db.prepare(`CREATE INDEX IF NOT EXISTS orders_account_idx ON orders (account_id)`),
    db.prepare(`CREATE INDEX IF NOT EXISTS order_items_order_idx ON order_items (order_number)`),
  ]);
  await db.prepare(`INSERT OR IGNORE INTO customer_accounts (id, email, display_name, credit_balance) VALUES (?, ?, ?, ?)`).bind("stax-1001", "alex@example.com", "Alex Morgan", 250).run();
}

export async function POST(request: Request) {
  try {
    const body = await request.json() as {
      items?: CheckoutItem[];
      deliverySlot?: string;
      customer?: { name?: string; email?: string; address?: string; instructions?: string };
    };
    if (!body.items?.length || !body.deliverySlot || !body.customer?.name || !body.customer.email || !body.customer.address) {
      return NextResponse.json({ error: "Missing order details" }, { status: 400 });
    }

    const validated = body.items.map((item) => {
      const product = catalogue.get(Number(item.productId));
      const quantity = Math.min(24, Math.max(1, Math.floor(Number(item.quantity))));
      if (!product) throw new Error("Unknown product");
      return { ...product, id: Number(item.productId), quantity };
    });
    const subtotal = validated.reduce((sum, item) => sum + item.price * item.quantity, 0);
    const deliveryFee = subtotal >= 100 ? 0 : 9;
    const total = subtotal + deliveryFee;
    const db = env.DB;
    if (!db) throw new Error("Account service unavailable");
    await ensureSchema(db);

    const account = await db.prepare(`SELECT credit_balance FROM customer_accounts WHERE id = ?`).bind("stax-1001").first<{ credit_balance: number }>();
    if (!account || Number(account.credit_balance) < total) {
      return NextResponse.json({ error: "Insufficient account credit" }, { status: 402 });
    }

    const orderNumber = `LS-${Date.now().toString(36).toUpperCase()}`;
    const statements = [
      db.prepare(`INSERT INTO orders (order_number, account_id, customer_name, customer_email, delivery_address, delivery_instructions, delivery_slot, subtotal, delivery_fee, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`).bind(orderNumber, "stax-1001", String(body.customer.name), String(body.customer.email), String(body.customer.address), String(body.customer.instructions || ""), body.deliverySlot, subtotal, deliveryFee, total),
      ...validated.map((item) => db.prepare(`INSERT INTO order_items (order_number, product_id, product_name, unit_price, quantity) VALUES (?, ?, ?, ?, ?)`).bind(orderNumber, item.id, item.name, item.price, item.quantity)),
      db.prepare(`UPDATE customer_accounts SET credit_balance = credit_balance - ? WHERE id = ? AND credit_balance >= ?`).bind(total, "stax-1001", total),
      db.prepare(`INSERT INTO account_transactions (account_id, order_number, amount, type) VALUES (?, ?, ?, ?)`).bind("stax-1001", orderNumber, -total, "order_charge"),
    ];
    await db.batch(statements);
    return NextResponse.json({ orderNumber, total });
  } catch (error) {
    console.error("Checkout failed", error);
    return NextResponse.json({ error: "Unable to place order" }, { status: 500 });
  }
}
