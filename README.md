# Liquor Stax Craigieburn

Responsive Next.js 16 ecommerce owner sample for Liquor Stax. It combines an
original local brand with familiar Australian bottle-shop patterns: offer
slideshow, swipeable rails, category search, lists, order-again, cart,
scheduled delivery, customer receipts and a protected owner portal.

## What is included

- Home, Products, Cart, My Lists, Account and About Us pages.
- Age gate, sign-up prompt, returning-customer greeting and browser-local sample account.
- Wine, Whisky, Bourbon, Premix, Vodka, Gin, Rum, Tequila, Beer, Cider,
  Sparkling, Liqueur, Non-alcoholic and Promotion filters.
- Clearly unavailable placeholder cards until the owner provides the real stock list.
- New, Sale, Member and Price Drop stickers.
- Express delivery using a Google-selected address and server-calculated road
  distance from 119 Highlander Dr at $1.50/km.
- Normal delivery for the next available business day, prepared for Australia
  Post handover and included in the owner’s daily report. Open weekdays ordered
  before cutoff use one open-business-day lead time; orders at/after cutoff, on
  weekends, or on configured closure dates use two.
- One Stripe Checkout payment supporting card and eligible Apple Pay / Google
  Pay wallets.
- A disclosed $0.99 maintenance line. Stripe Connect routes that amount to the
  platform as an application fee without charging the customer a second time.
- GST-inclusive customer totals and an “Includes GST” breakdown.
- Email and optional SMS receipts.
- Secure `/admin` owner login, product and timed-offer forms, printable/CSV
  Australia Post report, plus a weekday email-report job.
- Database fields ready for later Shopfront catalogue, promotion, inventory and
  fulfilment sync.

## Local development

Requirements: Node.js 22 and pnpm 10.32.0.

```bash
pnpm install
pnpm dev
```

Open <http://127.0.0.1:3000>. Validate a deployment with:

```bash
pnpm check
```

The repository pins Node `22.x` and pnpm `10.32.0`, preventing Vercel from
silently moving to a future Node major. If Vercel ignores the pnpm pin, set
`ENABLE_EXPERIMENTAL_COREPACK=1` in Project Settings.

## Owner-sample safety

The archived Facebook products are visual samples, not a current stock file.
Keep these values until current SKUs, prices and inventory are approved:

```dotenv
NEXT_PUBLIC_CATALOGUE_PREVIEW_ONLY=true
COMMERCE_LIVE=false
NEXT_PUBLIC_COMMERCE_LIVE=false
SHOPFRONT_INVENTORY_SYNC_LIVE=false
```

Preview checkout creates only a signed, zero-value sample order. A preview
express quote is visibly labelled and is cryptographically rejected as soon as
live commerce is enabled. Placeholder products cannot enter the cart.

## Database and owner portal

1. Connect Neon Postgres and set `DATABASE_URL`.
2. Apply [`db/migrations/001_commerce_admin.sql`](./db/migrations/001_commerce_admin.sql)
   in the Neon SQL editor before accepting real data.
3. Generate an owner password hash in an interactive terminal:

   ```bash
   pnpm admin:hash
   ```

4. Set `ADMIN_EMAIL`, the generated `ADMIN_PASSWORD_HASH`, and a random
   `ADMIN_SESSION_SECRET` of at least 32 characters.
5. Sign in at `/admin`. There are no demo owner credentials.

The migration stores customer name, E.164 phone, email and addresses, along
with products, daily offers, delivery details, fee/GST components, Shopfront
IDs and idempotent sync events. Admin sessions are signed, HttpOnly,
SameSite=Strict and expire after eight hours.

## Express delivery

Enable Places API (New) and Routes API in one restricted Google Cloud project.
Set:

- `GOOGLE_MAPS_API_KEY` — server-only and API-restricted.
- `GOOGLE_SHOP_PLACE_ID` — the resolved Place ID for 119 Highlander Dr,
  Craigieburn VIC 3064.
- `DELIVERY_QUOTE_SECRET` — at least 32 random characters.
- `EXPRESS_MAX_DISTANCE_KM` — owner-approved delivery radius.

The browser sends only a Google Place ID. The server obtains the canonical
address, distance and duration, calculates `round(distance metres × 150 / 1000)`
cents, and signs an expiring quote. Checkout verifies that token and never
trusts a browser-supplied fee.

## Normal delivery and daily report

Set the same amount in `AUSPOST_NEXT_DAY_FEE_CENTS` and
`NEXT_PUBLIC_AUSPOST_NEXT_DAY_FEE_CENTS`. The sample default is $12 and must be
confirmed by the owner.

Normal orders placed on an open weekday before `AUSPOST_ORDER_CUTOFF_HOUR` use
the next Melbourne business day. Orders at/after cutoff, on weekends, or on a
configured closed date use two open business days of lead time so they cannot
miss the prior owner report. Add known non-service dates to
`AUSPOST_CLOSED_DATES` and keep both public values in sync with their server
equivalents.

`/admin/dispatch` defaults to today’s Melbourne post-office handover and accepts
a validated `?date=YYYY-MM-DD`; its CSV download uses the same date. Vercel
calls `/api/cron/auspost-report` at 06:00 UTC Monday–Friday. The protected route
emails the next-business-day report to `OWNER_DISPATCH_EMAIL`, using provider
idempotency, queues each handover date before sending, retries unfinished queued
dates on the next run, and records completion only after a successful send. This is an
afternoon Melbourne report, with a one-hour DST shift.

“Next available business day” is not a universal arrival guarantee. Before launch,
confirm the store’s Australia Post Business Credit Account alcohol service,
network, cutoff, packaging, declarations, signature and ID requirements.

## Stripe, wallets, GST and receipts

Set the platform `STRIPE_SECRET_KEY`, Connect webhook secret and Liquor Stax
`STRIPE_CONNECTED_ACCOUNT_ID`. Checkout creates a direct charge in the shop’s
connected Stripe account and sets `application_fee_amount=99` for
Techbykennedy. Configure the webhook at `/api/payments/webhook` for connected
account events. `APP_BASE_URL` is required and must be the canonical HTTPS site
origin so payment return URLs never depend on request headers. Stripe shows Apple Pay and Google Pay when the account, domain,
browser and device are eligible; card remains available.

Retail prices, delivery and the maintenance line are treated as GST-inclusive;
the displayed GST component is one-eleventh of the taxable total. Add
`STORE_ABN` only after the legal seller and accountant confirm the invoice and
GST treatment. Obtain accounting/legal approval before live launch.

Resend sends the itemised email receipt and owner alerts. Twilio is optional
for transactional SMS. All provider values are listed in [`.env.example`](./.env.example).

## Shopfront handoff

Shopfront remains the intended catalogue and inventory source of truth. A live
custom integration needs the store’s eligible plan, vendor subdomain, OAuth
application, outlet, online register, price set and Stripe payment-method
mapping. The recommended production flow is:

1. Initial product sync from Shopfront GraphQL.
2. Signed, idempotent product, promotion and inventory webhooks.
3. Stripe remains website payment authority.
4. Verified paid web orders create Shopfront fulfilment/sale records against
   the approved online register.
5. Reconciliation and manual retry screens handle delayed or failed syncs.

The current admin catalogue is the working interim path; it does not pretend
that Shopfront credentials or live inventory are already connected. Keep
`SHOPFRONT_INVENTORY_SYNC_LIVE=false` until signed inventory sync is operating
and verified. Live checkout uses only database products, rejects missing or
zero inventory and refuses quantities above the latest Shopfront stock value.
It reserves stock atomically while Stripe Checkout is open, restores that stock
once after setup failure, session expiry or asynchronous payment failure, and
keeps the decrement only after a verified paid webhook.

## Before switching commerce live

- Confirm legal entity, ABN, liquor licence, responsible-delivery rules,
  current products/prices/stock, refunds, delivery radius and capacity.
- Set matching public/server liquor licence numbers and enable
  `LCV_OFF_PREMISES_NOTIFIED` only after Liquor Control Victoria confirms the
  off-premises notification. The ordering screen includes the prescribed warning.
- Complete Stripe Connect onboarding, wallet/domain verification, webhook and
  refund/application-fee tests.
- Restrict Google credentials and add billing quotas/alerts.
- Test email/SMS failures, duplicate webhooks, quote expiry/tampering,
  Melbourne DST, postal report idempotency and Shopfront reconciliation.
- Set `SHOPFRONT_INVENTORY_SYNC_LIVE=true` only after the production inventory
  feed and its update monitoring have been verified.
- Then set all three preview/live flags to their production values.

## Store and build details

- Dispatch/store address supplied by the owner: 119 Highlander Dr, Craigieburn VIC 3064.
- The archived Facebook page previously listed Shop 3, 176 Elevation Bvd;
  the owner should confirm which address is public before launch.
- Build support: Techbykennedy — `techbykennedy@gmail.com`,
  `buildwithme@techbykennedy.org`, +61 450 683 088.
