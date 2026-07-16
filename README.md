# Liquor Stax

Liquor Stax is a Next.js 16 storefront for browsing drinks, choosing a delivery
window, and charging an internal customer account. It is configured for native
Vercel deployment.

## Local development

Requirements:

- Node.js 22
- pnpm 10.32

```bash
pnpm install
pnpm dev
```

Open <http://localhost:3000>. Run the complete deployment check with:

```bash
pnpm check
```

## Database

The durable database is PostgreSQL. Neon is the recommended Vercel provider,
although any serverless Postgres service that supplies `DATABASE_URL` or
`POSTGRES_URL` will work.

1. In the Vercel project, open **Storage** and add a Postgres integration such
   as Neon.
2. Connect it to the Production, Preview, and Development environments.
3. Redeploy. Vercel injects the connection string automatically.

The checkout route creates the required tables and the preview account on its
first database request. Money is stored as integer cents, and each order uses
an atomic guarded balance deduction so two checkouts cannot spend the same
credit. A unique checkout token also makes retries idempotent, preventing a
timeout retry from charging the account twice.

When no Postgres connection is present, the storefront remains usable in demo
mode. Demo credit is stored in a signed, HTTP-only browser cookie and has no
cash value. Set `DEMO_ACCOUNT_SECRET` to a long random value if this preview
mode is exposed publicly.

Copy [`.env.example`](./.env.example) to `.env.local` to connect local
development to Postgres.

## Deploy to Vercel

Import `BuildwithMe-stack/Liquorstax` into Vercel or keep the existing Git
integration. The repository pins the framework to Next.js, Node 22, and pnpm
10.32. Vercel runs `pnpm build` and deploys the resulting `.next` output.

No Cloudflare Worker, Wrangler, vinext, or D1 binding is required.

## Production note

The current account is an explicit storefront demo (`stax-1001`). Before using
real customer funds, add authenticated customer sessions, bind each session to
its own account, and connect an authorised payment/ledger provider. The current
flow charges stored demo credit; it does not process bank cards.
