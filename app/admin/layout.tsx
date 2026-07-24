import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import {
  getAdminLoginFlash,
  getAdminSession,
  isAdminAuthConfigured,
} from "../../lib/admin-auth";
import { loginAction, logoutAction } from "./login/actions";
import styles from "./admin.module.css";

export const metadata: Metadata = {
  title: { default: "Owner portal", template: "%s | Liquor Stax owner portal" },
  robots: { index: false, follow: false },
};

export default async function AdminLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  const session = await getAdminSession();

  if (!session) {
    const flash = await getAdminLoginFlash();
    const configured = isAdminAuthConfigured();
    return (
      <main className={styles.loginCanvas}>
        <section className={styles.brandPanel} aria-label="Liquor Stax owner portal">
          <div className={styles.brandLockup}>
            <Image
              src="/brand/liquor-stax-craigieburn-logo.jpg"
              width={74}
              height={74}
              alt="Liquor Stax Craigieburn"
              priority
            />
            <div>
              <strong>LIQUOR STAX</strong>
              <span>CRAIGIEBURN</span>
            </div>
          </div>
          <div className={styles.brandMessage}>
            <p>OWNER PORTAL</p>
            <h1>Your shop, organised for the day ahead.</h1>
            <span>Manage daily offers, catalogue items and delivery preparation from one secure place.</span>
          </div>
          <small>Authorised store staff only</small>
        </section>

        <section className={styles.loginPanel}>
          <div className={styles.loginCard}>
            <p className={styles.eyebrow}>SECURE SIGN IN</p>
            <h2>Welcome back</h2>
            <p className={styles.intro}>Use the owner credentials configured for this store.</p>

            {flash === "invalid" ? (
              <p className={styles.alert} role="alert">
                The email or password was not recognised. Please try again.
              </p>
            ) : null}
            {flash === "configuration" || !configured ? (
              <p className={styles.configurationAlert} role="alert">
                Owner access is locked until the secure admin environment variables are configured.
              </p>
            ) : null}

            <form action={loginAction} className={styles.loginForm}>
              <label htmlFor="admin-email">Email address</label>
              <input
                id="admin-email"
                name="email"
                type="email"
                autoComplete="username"
                inputMode="email"
                maxLength={254}
                required
                disabled={!configured}
              />
              <label htmlFor="admin-password">Password</label>
              <input
                id="admin-password"
                name="password"
                type="password"
                autoComplete="current-password"
                maxLength={1024}
                required
                disabled={!configured}
              />
              <button type="submit" disabled={!configured}>Sign in to owner portal</button>
            </form>

            <div className={styles.securityNote}>
              <span aria-hidden="true">●</span>
              <p>Your session is signed, HTTP-only and automatically expires after eight hours.</p>
            </div>
            <Link href="/">← Return to the shop</Link>
          </div>
        </section>
      </main>
    );
  }

  return (
    <div className={styles.portal}>
      <header className={styles.portalHeader}>
        <Link className={styles.portalBrand} href="/admin">
          <Image src="/brand/liquor-stax-craigieburn-logo.jpg" width={43} height={43} alt="" />
          <span><strong>Liquor Stax</strong><small>Owner portal</small></span>
        </Link>
        <nav aria-label="Owner portal">
          <Link href="/admin">Dashboard</Link>
          <Link href="/admin/dispatch">Delivery report</Link>
          <Link href="/">View shop</Link>
        </nav>
        <div className={styles.sessionMenu}>
          <span><small>Signed in as</small>{session.email}</span>
          <form action={logoutAction}><button type="submit">Sign out</button></form>
        </div>
      </header>
      <div className={styles.portalContent}>{children}</div>
    </div>
  );
}
