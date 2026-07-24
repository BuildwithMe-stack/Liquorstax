-- Generated from data/stock-catalogue.json. Do not hand-edit.
-- Contains only public catalogue fields; no cost or profit values are included.
-- Apply db/migrations/001_commerce_admin.sql before this file.
-- Source export: stocklist (3).csv; generated 2026-07-24T15:26:04.180Z.
BEGIN;

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddf8512bf600217aa93cc65', 'stock-11f0d0fbdddf8512bf600217aa93cc65', 'WOODSTOCK&COLA RSV12%10PK200ML', 'stock-11f0d0fbdddf8512bf600217aa93cc65', 'Premix', 'Imported owner stock list', NULL, '10-pack', 6299, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe2c9145ceebda50674dcfaa5f3', 'stock-11f0cfe2c9145ceebda50674dcfaa5f3', 'GLENFIDDICH MALT 12YO 700ML', 'stock-11f0cfe2c9145ceebda50674dcfaa5f3', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7699, 65, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb83af5246aac2902a3fa20923b', 'stock-11f0dcb83af5246aac2902a3fa20923b', 'MINI OUZO 700ML .700', 'stock-11f0dcb83af5246aac2902a3fa20923b', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 78, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddc6ddcb7e60217aa93cc65', 'stock-11f0d0fbdddc6ddcb7e60217aa93cc65', 'J/DANIEL AMER SRV & COLA 10PK 250ML 10%', 'stock-11f0d0fbdddc6ddcb7e60217aa93cc65', 'Premix', 'Imported owner stock list', NULL, '10-pack · 250mL', 7499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddf506aa4130217aa93cc65', 'stock-11f0d0fbdddf506aa4130217aa93cc65', 'HARD RATED ORANGE 10PK 375ML', 'stock-11f0d0fbdddf506aa4130217aa93cc65', 'Premix', 'Imported owner stock list', NULL, '10-pack · 375mL', 4999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe2a6e405b6a24302824e01c829', 'stock-11f0cfe2a6e405b6a24302824e01c829', 'Glenfiddich single malt whisky 12 yr old 1 L', 'stock-11f0cfe2a6e405b6a24302824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 11099, 31, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cf134ac13e86beaf0a40587cc18f', 'stock-11f0cf134ac13e86beaf0a40587cc18f', 'J/WALKER GOLD RESERVE 700ML', 'stock-11f0cf134ac13e86beaf0a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8999, 38, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe01918fdcea6220a93514bd9ad', 'stock-11f0cfe01918fdcea6220a93514bd9ad', 'J/walker blue label 700 ml', 'stock-11f0cfe01918fdcea6220a93514bd9ad', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 28900, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9d194ac260217aa93cc65', 'stock-11f0d0fbddd9d194ac260217aa93cc65', 'J/DANIEL & COLA 10PK 375ML 4.8%', 'stock-11f0d0fbddd9d194ac260217aa93cc65', 'Premix', 'Imported owner stock list', NULL, '10-pack · 375mL', 5999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d005888c2878833f0217aa93cc65', 'stock-11f0d005888c2878833f0217aa93cc65', 'CORONA Extra BTL 355ML', 'stock-11f0d005888c2878833f0217aa93cc65', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 355mL', 499, 587, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cf1698b24d7689cc0692fc259475', 'stock-11f0cf1698b24d7689cc0692fc259475', 'J/WALKER BLACK LBL 700ML', 'stock-11f0cf1698b24d7689cc0692fc259475', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 47, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cf1740b70e80aa1f02de0525e70d', 'stock-11f0cf1740b70e80aa1f02de0525e70d', 'J/WALKER DBL BLACK 700ML', 'stock-11f0cf1740b70e80aa1f02de0525e70d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 36, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd4d446a2930217aa93cc65', 'stock-11f0d0fbddd4d446a2930217aa93cc65', 'GLENMORANGIE ORIGINAL 700ML 12 year', 'stock-11f0d0fbddd4d446a2930217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9499, 25, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9a20abdf30217aa93cc65', 'stock-11f0d0fbddd9a20abdf30217aa93cc65', 'CAN CLUB & DRY 4.8% 10PK 375ML', 'stock-11f0d0fbddd9a20abdf30217aa93cc65', 'Other', 'Imported owner stock list', NULL, '10-pack · 375mL', 4999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e7a9924a930cb04302759fdc33f5', 'stock-11f0e7a9924a930cb04302759fdc33f5', 'Chivas 1L', 'stock-11f0e7a9924a930cb04302759fdc33f5', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 8499, 26, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5bc8c8a96a083d002825451f435', 'stock-11f0d5bc8c8a96a083d002825451f435', 'YENI RAKI Export TURKISH SPIRIT 700ML', 'stock-11f0d5bc8c8a96a083d002825451f435', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 34, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13db82e5cf05abb0f0a9a61b55857', 'stock-11f13db82e5cf05abb0f0a9a61b55857', 'ABSOLUT & SPRITE 5% 10PKS Cans 330ML', 'stock-11f13db82e5cf05abb0f0a9a61b55857', 'Premix', 'Imported owner stock list', NULL, '10-pack · 330mL', 5299, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe83e9e42fe97c50217aa93cc65', 'stock-11f0cfe83e9e42fe97c50217aa93cc65', 'GLENLIVET 12YR 700ML', 'stock-11f0cfe83e9e42fe97c50217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8499, 23, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb1ecf4a67e8af10246a9fe065b', 'stock-11f0dcb1ecf4a67e8af10246a9fe065b', 'WILD TURKEY 101 & COLA ZERO 10PK 375ML', 'stock-11f0dcb1ecf4a67e8af10246a9fe065b', 'Non-alcoholic', 'Imported owner stock list', NULL, '10-pack · 375mL', 6399, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9256e9c8a0217aa93cc65', 'stock-11f0d0fbddd9256e9c8a0217aa93cc65', 'BELVEDERE VODKA PURE 40% 1L', 'stock-11f0d0fbddd9256e9c8a0217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 1L', 11999, 15, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd54b4c802b0217aa93cc65', 'stock-11f0d0fbddd54b4c802b0217aa93cc65', 'GRANTS SCOTCH 1L', 'stock-11f0d0fbddd54b4c802b0217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 6500, 26, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d03178b8cce0bc8506d464089785', 'stock-11f0d03178b8cce0bc8506d464089785', 'GREY GOOSE VODKA 700ML', 'stock-11f0d03178b8cce0bc8506d464089785', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7299, 23, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fe39c5c587cca3d906f1a4d1bdf3', 'stock-11f0fe39c5c587cca3d906f1a4d1bdf3', 'Bro Code Beer', 'stock-11f0fe39c5c587cca3d906f1a4d1bdf3', 'Beer', 'Imported owner stock list', NULL, 'Single unit', 599, 276, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13af4d22038a8a3b502541c3ef0cb', 'stock-11f13af4d22038a8a3b502541c3ef0cb', 'MACALLAN SHERRY OAK 12YO 700ML', 'stock-11f13af4d22038a8a3b502541c3ef0cb', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 16999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfecc513a140afdf02824e01c829', 'stock-11f0cfecc513a140afdf02824e01c829', 'CHIVAS REGAL SCOTCH 12YO 700ML', 'stock-11f0cfecc513a140afdf02824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5799, 26, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda54fc99a20217aa93cc65', 'stock-11f0d0fbddda54fc99a20217aa93cc65', 'SMIRNOFF VODKA RED 700ML', 'stock-11f0d0fbddda54fc99a20217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 30, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb72c2e38aa985102356471c905', 'stock-11f0dcb72c2e38aa985102356471c905', 'CHIVAS REGAL SCOTCH 18YO 700ML Blue', 'stock-11f0dcb72c2e38aa985102356471c905', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 13499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddee2d88c7c0217aa93cc65', 'stock-11f0d0fbdddee2d88c7c0217aa93cc65', 'JIM BEAM B/DB 10PK CAN 6.9%', 'stock-11f0d0fbdddee2d88c7c0217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, '10-pack', 6999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d7da41620a62acfe0ac4fe9045b7', 'stock-11f0d7da41620a62acfe0ac4fe9045b7', 'HENNESSY COG VSOP 700ML', 'stock-11f0d7da41620a62acfe0ac4fe9045b7', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11499, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffc8a411f6abceb02824e01c829', 'stock-11f0cffc8a411f6abceb02824e01c829', 'Challa', 'stock-11f0cffc8a411f6abceb02824e01c829', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6499, 21, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff5934ea2aa8aae0a93514bd9ad', 'stock-11f0cff5934ea2aa8aae0a93514bd9ad', 'HENNESSY COGNAC V.S. 700ML', 'stock-11f0cff5934ea2aa8aae0a93514bd9ad', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8900, 15, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfdefd3263a896040a93514bd9ad', 'stock-11f0cfdefd3263a896040a93514bd9ad', 'J/WALKER GREEN LABEL 700ML', 'stock-11f0cfdefd3263a896040a93514bd9ad', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9999, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0edec840e830e86ab026626a3b28f', 'stock-11f0edec840e830e86ab026626a3b28f', 'Black & white 1L', 'stock-11f0edec840e830e86ab026626a3b28f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 7999, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d155100a956eb52f02409e5289ef', 'stock-11f0d155100a956eb52f02409e5289ef', 'SINGLETON Luscious nectar 12YO 700ML', 'stock-11f0d155100a956eb52f02409e5289ef', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7299, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d03a2017eb4497ec0a40587cc18f', 'stock-11f0d03a2017eb4497ec0a40587cc18f', 'Kingfisher ultra 330 mls bottles', 'stock-11f0d03a2017eb4497ec0a40587cc18f', 'Beer', 'Imported owner stock list', NULL, 'Single unit', 499, 243, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b84200897caffa02825451f435', 'stock-11f0d5b84200897caffa02825451f435', 'CASA VODKA 700ML', 'stock-11f0d5b84200897caffa02825451f435', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f143993fd43e92bf230aa2301186a5', 'stock-11f143993fd43e92bf230aa2301186a5', 'Budweiser Magnum beer', 'stock-11f143993fd43e92bf230aa2301186a5', 'Beer', 'Imported owner stock list', NULL, 'Single unit', 599, 179, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f16abb647aeb1ca3320a0c87af562b', 'stock-11f16abb647aeb1ca3320a0c87af562b', 'BELVEDERE PURE VODKA F1 1L', 'stock-11f16abb647aeb1ca3320a0c87af562b', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 1L', 14999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f102660fff0c8e8eab02c8e8913a8d', 'stock-11f102660fff0c8e8eab02c8e8913a8d', 'BLACK & WHITE BLENDED SCOTCH WHISKY 700ml', 'stock-11f102660fff0c8e8eab02c8e8913a8d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 21, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f16ab0e0778ffab0890222b4e3c963', 'stock-11f16ab0e0778ffab0890222b4e3c963', 'Old Monk Rum 375 ml', 'stock-11f16ab0e0778ffab0890222b4e3c963', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 375mL', 2999, 35, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d02dfc315794a4c30a40587cc18f', 'stock-11f0d02dfc315794a4c30a40587cc18f', 'BOMBAY GIN SAPPHIRE 700ML', 'stock-11f0d02dfc315794a4c30a40587cc18f', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb5d02b3470217aa93cc65', 'stock-11f0d0fbdddb5d02b3470217aa93cc65', 'JAGERMEISTER 700ML', 'stock-11f0d0fbdddb5d02b3470217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5349, 19, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d030a09442aea6d106f1f9fab3ed', 'stock-11f0d030a09442aea6d106f1f9fab3ed', 'GREY GOOSE VODKA 1L', 'stock-11f0d030a09442aea6d106f1f9fab3ed', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 1L', 9999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddba47e9a390217aa93cc65', 'stock-11f0d0fbdddba47e9a390217aa93cc65', 'CAN CLUB & P/DRY 6% 10PK 375ML', 'stock-11f0d0fbdddba47e9a390217aa93cc65', 'Other', 'Imported owner stock list', NULL, '10-pack · 375mL', 5500, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffa9bf64570879f0a40587cc18f', 'stock-11f0cffa9bf64570879f0a40587cc18f', 'Black dog black 750 ml', 'stock-11f0cffa9bf64570879f0a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 6599, 15, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd5e9308bc70217aa93cc65', 'stock-11f0d0fbddd5e9308bc70217aa93cc65', 'ABSOLUT VODKA LIME 700ML', 'stock-11f0d0fbddd5e9308bc70217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e6541289c4bcd70a6bd93cc895', 'stock-11f0d6e6541289c4bcd70a6bd93cc895', 'Madirraa dry gin 700ml', 'stock-11f0d6e6541289c4bcd70a6bd93cc895', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 22, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfec774c1cf890330a40587cc18f', 'stock-11f0cfec774c1cf890330a40587cc18f', 'DIMPLE SCOTCH 12YO 700ML', 'stock-11f0cfec774c1cf890330a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5699, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff105ed1fee9f6d02824e01c829', 'stock-11f0cff105ed1fee9f6d02824e01c829', 'JAMESON IRISH WSKY 1L', 'stock-11f0cff105ed1fee9f6d02824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 7999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffa0b0f9fb6b0000217aa93cc65', 'stock-11f0cffa0b0f9fb6b0000217aa93cc65', 'INDRI SINGLE MALT WHISKY 750ML', 'stock-11f0cffa0b0f9fb6b0000217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 750mL', 10500, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13182b88435aabd340683110270b7', 'stock-11f13182b88435aabd340683110270b7', 'Jameson 1.75 L', 'stock-11f13182b88435aabd340683110270b7', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1.75L', 12999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd5267694380217aa93cc65', 'stock-11f0d0fbddd5267694380217aa93cc65', 'CANADIAN CLUB ORIG 37% 1L', 'stock-11f0d0fbddd5267694380217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1L', 6499, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffb31de710ca9e30217aa93cc65', 'stock-11f0cffb31de710ca9e30217aa93cc65', 'Signature rare aged whisky 750 ml', 'stock-11f0cffb31de710ca9e30217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 750mL', 6499, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd42ae695800217aa93cc65', 'stock-11f0d0fbddd42ae695800217aa93cc65', 'ABSOLUT VODKA 700ML', 'stock-11f0d0fbddd42ae695800217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5299, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffd02130ab2b50d0a40587cc18f', 'stock-11f0cffd02130ab2b50d0a40587cc18f', '100 Pipers 12 year old', 'stock-11f0cffd02130ab2b50d0a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 7499, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd5f222a5310217aa93cc65', 'stock-11f0d0fbddd5f222a5310217aa93cc65', 'J/WALKER AGED 18YRS 40% 700ML', 'stock-11f0d0fbddd5f222a5310217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 17900, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf9153200168ee1020c4780605d', 'stock-11f0fcf9153200168ee1020c4780605d', 'DALMORE MALT SCOTCH 12YO 700ML', 'stock-11f0fcf9153200168ee1020c4780605d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 14699, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f151c45303ecccba4702743a991aeb', 'stock-11f151c45303ecccba4702743a991aeb', 'J/WALKER RED LBL NUPK 1125ML', 'stock-11f151c45303ecccba4702743a991aeb', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1125mL', 7999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15ee73ec6018ebd600a56f59fd215', 'stock-11f15ee73ec6018ebd600a56f59fd215', 'CRUISER BLUEBERRY 10% 4PK Cans 200ML', 'stock-11f15ee73ec6018ebd600a56f59fd215', 'Premix', 'Imported owner stock list', NULL, '4-pack · 200mL', 2399, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd40a0287e30217aa93cc65', 'stock-11f0d0fbddd40a0287e30217aa93cc65', 'ABSOLUT VODKA 1L', 'stock-11f0d0fbddd40a0287e30217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 1L', 6999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffce5509cb48bb50275d0a0b38b', 'stock-11f0cffce5509cb48bb50275d0a0b38b', '100 Pipers deluxe', 'stock-11f0cffce5509cb48bb50275d0a0b38b', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 6899, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd4ea80bc670217aa93cc65', 'stock-11f0d0fbddd4ea80bc670217aa93cc65', 'JIM BEAM WHITE LBL 37% 1L', 'stock-11f0d0fbddd4ea80bc670217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 1L', 7499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1331718dd49e29fd6028576fd314d', 'stock-11f1331718dd49e29fd6028576fd314d', 'yeni raki gift pack', 'stock-11f1331718dd49e29fd6028576fd314d', 'Other', 'Imported owner stock list', NULL, 'Single unit', 7499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f17809f6c9ab502e1e74299a3', 'stock-11f10c3f17809f6c9ab502e1e74299a3', 'JAMESON DRY LIME ULTRA 10% 4PK Cans 250ML', 'stock-11f10c3f17809f6c9ab502e1e74299a3', 'Whisky', 'Imported owner stock list', NULL, '4-pack · 250mL', 3699, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3497884e00217aa93cc65', 'stock-11f0d0fbddd3497884e00217aa93cc65', 'BALLANTINES SCOTCH 700ML', 'stock-11f0d0fbddd3497884e00217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd189ab0e70217aa93cc65', 'stock-11f0d0fbdddd189ab0e70217aa93cc65', 'FRIS VODKA 700ML', 'stock-11f0d0fbdddd189ab0e70217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e542cfd8c91eb70906c9e543d6dd', 'stock-11f0e542cfd8c91eb70906c9e543d6dd', 'Magic Moments 1.75 l', 'stock-11f0e542cfd8c91eb70906c9e543d6dd', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1.75L', 13000, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffac247b52497a30674dcfaa5f3', 'stock-11f0cffac247b52497a30674dcfaa5f3', 'Antiquity Blue 750 ml', 'stock-11f0cffac247b52497a30674dcfaa5f3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 6499, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0de20131fe95c849d06be1bbd1c43', 'stock-11f0de20131fe95c849d06be1bbd1c43', 'INDRI AGNEYA S/MALT WSK 700ML', 'stock-11f0de20131fe95c849d06be1bbd1c43', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 10999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d7f8a2bc40d4885a02c37847d7df', 'stock-11f0d7f8a2bc40d4885a02c37847d7df', 'BOMBAY SAPPHIRE GOBLETVAP700ML', 'stock-11f0d7f8a2bc40d4885a02c37847d7df', 'Gin', 'Imported owner stock list', NULL, 'Single unit', 6999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15ee73ec60bc0a15f0a56f59fd215', 'stock-11f15ee73ec60bc0a15f0a56f59fd215', 'CRUISER GRAPE 10% 4PK Cans 200ML', 'stock-11f15ee73ec60bc0a15f0a56f59fd215', 'Premix', 'Imported owner stock list', NULL, '4-pack · 200mL', 2399, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f124227896fbf2b04102265ba2b15f', 'stock-11f124227896fbf2b04102265ba2b15f', 'Jamun dry gin', 'stock-11f124227896fbf2b04102265ba2b15f', 'Gin', 'Imported owner stock list', NULL, 'Single unit', 8499, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b82824213abfba0a18399e6dd5', 'stock-11f0d5b82824213abfba0a18399e6dd5', 'CASA SPIRITS WHISKEY 700ML', 'stock-11f0d5b82824213abfba0a18399e6dd5', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff8c27d780088470217aa93cc65', 'stock-11f0cff8c27d780088470217aa93cc65', 'single malt 700 ml', 'stock-11f0cff8c27d780088470217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 3499, 21, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d4025475824abc280ad7896e75b9', 'stock-11f0d4025475824abc280ad7896e75b9', 'JIM BEAM WHITE LBL PET 375ML', 'stock-11f0d4025475824abc280ad7896e75b9', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 375mL', 3299, 22, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10b01c98d85429ff00aa8d0f113bf', 'stock-11f10b01c98d85429ff00aa8d0f113bf', 'benriach 12yr old 700ml', 'stock-11f10b01c98d85429ff00aa8d0f113bf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e463e1c6ee8895ed0a86e335f925', 'stock-11f0e463e1c6ee8895ed0a86e335f925', 'ksarak Arak', 'stock-11f0e463e1c6ee8895ed0a86e335f925', 'Other', 'Imported owner stock list', NULL, 'Single unit', 8999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ea9d8132370e91330635e0f47561', 'stock-11f0ea9d8132370e91330635e0f47561', 'Tekirdag gold gift pack', 'stock-11f0ea9d8132370e91330635e0f47561', 'Other', 'Imported owner stock list', NULL, 'Single unit', 7999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13c74b8d0bfe09b7c0a9a61b55857', 'stock-11f13c74b8d0bfe09b7c0a9a61b55857', 'Madirraa vodka 700 ml', 'stock-11f13c74b8d0bfe09b7c0a9a61b55857', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 3999, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d16eda994dc0914002409e5289ef', 'stock-11f0d16eda994dc0914002409e5289ef', 'Royal Salute 700 ml', 'stock-11f0d16eda994dc0914002409e5289ef', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 23900, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfec38b5b562bd2d0a93514bd9ad', 'stock-11f0cfec38b5b562bd2d0a93514bd9ad', 'SINGLETON MALT MASTER 700ML', 'stock-11f0cfec38b5b562bd2d0a93514bd9ad', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7000, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9e0fecea06e062a0ca9a125', 'stock-11f1172eb9e0fecea06e062a0ca9a125', 'DON JULIO BLANCO 38% GP 700ML', 'stock-11f1172eb9e0fecea06e062a0ca9a125', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd1b10898310217aa93cc65', 'stock-11f0d0fbddd1b10898310217aa93cc65', 'FOUR PILLARS GIN 700ML', 'stock-11f0d0fbddd1b10898310217aa93cc65', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1296d9dd4c91cb44f02934d1fedd9', 'stock-11f1296d9dd4c91cb44f02934d1fedd9', 'INDRI AGNEYA GIFT PACK', 'stock-11f1296d9dd4c91cb44f02934d1fedd9', 'Other', 'Imported owner stock list', NULL, 'Single unit', 11499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddc9618a52a0217aa93cc65', 'stock-11f0d0fbdddc9618a52a0217aa93cc65', 'SUNTORY CHITA WHISKY 43% 700ML', 'stock-11f0d0fbdddc9618a52a0217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13db82e5c065eb6fc0a9a61b55857', 'stock-11f13db82e5c065eb6fc0a9a61b55857', 'REMY MARTIN XO 700ML', 'stock-11f13db82e5c065eb6fc0a9a61b55857', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 33999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f4393332ba889fb706d343ddfbc5', 'stock-11f0f4393332ba889fb706d343ddfbc5', 'SMIRNOFF RED VODKA 37% 1125ML', 'stock-11f0f4393332ba889fb706d343ddfbc5', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 1125mL', 7499, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ed20d574fd8aa0c602d733bec8cb', 'stock-11f0ed20d574fd8aa0c602d733bec8cb', 'PATRON XO CAFE 700ML', 'stock-11f0ed20d574fd8aa0c602d733bec8cb', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ea9bc38aba929f8f06d0e2a77c03', 'stock-11f0ea9bc38aba929f8f06d0e2a77c03', 'BEYLERBEY GOBEK 700 ml', 'stock-11f0ea9bc38aba929f8f06d0e2a77c03', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 10999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf047dbf8a7ba0adfd189d115', 'stock-11f0e06bf047dbf8a7ba0adfd189d115', 'ABSOLUT VODKA 6PK 200ML', 'stock-11f0e06bf047dbf8a7ba0adfd189d115', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2199, 30, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cf188383eb6ab86b02de0525e70d', 'stock-11f0cf188383eb6ab86b02de0525e70d', 'J/WALKER RED LBL 700ML', 'stock-11f0cf188383eb6ab86b02de0525e70d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4699, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe34d3eab6e81070a93514bd9ad', 'stock-11f0cfe34d3eab6e81070a93514bd9ad', 'GLENFIDDICH 14YO BOUR BAR700ML', 'stock-11f0cfe34d3eab6e81070a93514bd9ad', 'Other', 'Imported owner stock list', NULL, 'Single unit', 12900, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd43e78ad8f0217aa93cc65', 'stock-11f0d0fbddd43e78ad8f0217aa93cc65', 'GRANTS SCOTCH 700ML', 'stock-11f0d0fbddd43e78ad8f0217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4599, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1143766c1e414b3fb0aa8d0f113bf', 'stock-11f1143766c1e414b3fb0aa8d0f113bf', 'GLENLIVET FOUNDER RES 700ML', 'stock-11f1143766c1e414b3fb0aa8d0f113bf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f0fbc1642b849b76020c4780605d', 'stock-11f0f0fbc1642b849b76020c4780605d', 'Yeni Raki uzun demleme', 'stock-11f0f0fbc1642b849b76020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit', 8999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd8dcf8840c0217aa93cc65', 'stock-11f0d0fbddd8dcf8840c0217aa93cc65', 'MOET CHANDON BRUT NV 750ML', 'stock-11f0d0fbddd8dcf8840c0217aa93cc65', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 6999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb6ec95fd6882040a2c8c6b1a25', 'stock-11f0dcb6ec95fd6882040a2c8c6b1a25', 'VOIR Blueberry Vodka 700ml', 'stock-11f0dcb6ec95fd6882040a2c8c6b1a25', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d02e70cc570cb70806d464089785', 'stock-11f0d02e70cc570cb70806d464089785', 'BOMBAY PRESSE 37.5% GIN 37.5% 700ML', 'stock-11f0d02e70cc570cb70806d464089785', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6299, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff764e2f022b06a0217aa93cc65', 'stock-11f0cff764e2f022b06a0217aa93cc65', 'BLACK BTL BRANDY 700ML', 'stock-11f0cff764e2f022b06a0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4800, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffa6bf95a38be730674dcfaa5f3', 'stock-11f0cffa6bf95a38be730674dcfaa5f3', 'Royal Stag 700 ml', 'stock-11f0cffa6bf95a38be730674dcfaa5f3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd795d295070217aa93cc65', 'stock-11f0d0fbddd795d295070217aa93cc65', 'JIM BEAM WHITE LABEL 700ML', 'stock-11f0d0fbddd795d295070217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15ee73ec5386283d20a56f59fd215', 'stock-11f15ee73ec5386283d20a56f59fd215', 'NIKKA WHISKY FROM BARREL 500ML', 'stock-11f15ee73ec5386283d20a56f59fd215', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 500mL', 9899, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb8b7eaf180217aa93cc65', 'stock-11f0d0fbdddb8b7eaf180217aa93cc65', 'VODKA O NUCO 700ML', 'stock-11f0d0fbdddb8b7eaf180217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5399, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cf0a1456a93e94530a40587cc18f', 'stock-11f0cf0a1456a93e94530a40587cc18f', 'Solan black 700 ml', 'stock-11f0cf0a1456a93e94530a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5899, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b70fac49588cfa02825451f435', 'stock-11f0d5b70fac49588cfa02825451f435', 'DON JULIO BLANCO 38% 700ML', 'stock-11f0d5b70fac49588cfa02825451f435', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9799, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffb000e4314ba310a40587cc18f', 'stock-11f0cffb000e4314ba310a40587cc18f', 'Black Dog Triple Gold Res Whisky 750ml', 'stock-11f0cffb000e4314ba310a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 750mL', 7299, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd6c9febd2a0217aa93cc65', 'stock-11f0d0fbddd6c9febd2a0217aa93cc65', 'KRAKEN BLACK SPICED RUM 1L', 'stock-11f0d0fbddd6c9febd2a0217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 1L', 9700, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda8170b2810217aa93cc65', 'stock-11f0d0fbddda8170b2810217aa93cc65', 'WILD TURKEY A/H COLA CAN 375ML', 'stock-11f0d0fbddda8170b2810217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 799, 72, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d02fe8c87abe82830a40587cc18f', 'stock-11f0d02fe8c87abe82830a40587cc18f', 'SUNTORY TOKI BLEND WHISKY 43% 700ML', 'stock-11f0d02fe8c87abe82830a40587cc18f', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8200, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ce97116b9d429afe0692fc259475', 'stock-11f0ce97116b9d429afe0692fc259475', 'The Mcallan12 year old 700 ml', 'stock-11f0ce97116b9d429afe0692fc259475', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 13999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddcc8c282060217aa93cc65', 'stock-11f0d0fbdddcc8c282060217aa93cc65', 'THE SEXTON IRISH WHISKEY 700ML', 'stock-11f0d0fbdddcc8c282060217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ff1a88f111a494910a2ca96c3541', 'stock-11f0ff1a88f111a494910a2ca96c3541', 'J/WALKER BLACK RUBY 700ML', 'stock-11f0ff1a88f111a494910a2ca96c3541', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5bf00a39670a78f0a18399e6dd5', 'stock-11f0d5bf00a39670a78f0a18399e6dd5', 'Tekirdag Raki 700ml Blue', 'stock-11f0d5bf00a39670a78f0a18399e6dd5', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff9ef28ba8ab7cd06f1f9fab3ed', 'stock-11f0cff9ef28ba8ab7cd06f1f9fab3ed', 'AMRUT FUSION MALT WHISKY 700ML', 'stock-11f0cff9ef28ba8ab7cd06f1f9fab3ed', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11099, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c83f54812d02433d717f57', 'stock-11f132bc12c83f54812d02433d717f57', 'HARD RATED LEMON LIME 6% 10PK Cans 330ML', 'stock-11f132bc12c83f54812d02433d717f57', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 330mL', 5499, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfee49417dc486400a40587cc18f', 'stock-11f0cfee49417dc486400a40587cc18f', 'DEWARS SCOTCH WHISKY 700ML', 'stock-11f0cfee49417dc486400a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb3156a99e0217aa93cc65', 'stock-11f0d0fbdddb3156a99e0217aa93cc65', 'SKYY VODKA 37.5% 700ML', 'stock-11f0d0fbdddb3156a99e0217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb4ad8b8e80217aa93cc65', 'stock-11f0d0fbdddb4ad8b8e80217aa93cc65', 'TALISKER MALT 10YO 700ML', 'stock-11f0d0fbdddb4ad8b8e80217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 10799, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d7fbdb94b1c2934e0a6bd93cc895', 'stock-11f0d7fbdb94b1c2934e0a6bd93cc895', 'Arak Fakra', 'stock-11f0d7fbdb94b1c2934e0a6bd93cc895', 'Other', 'Imported owner stock list', NULL, 'Single unit', 8999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5c0cae50f588c4d062f9a568477', 'stock-11f0d5c0cae50f588c4d062f9a568477', 'BARBARESSO OUZO 700ML', 'stock-11f0d5c0cae50f588c4d062f9a568477', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4899, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d16f37c1ac72afaa06cce9ac00ad', 'stock-11f0d16f37c1ac72afaa06cce9ac00ad', 'GLENFIDDICH 21 GRAN RES 700ML', 'stock-11f0d16f37c1ac72afaa06cce9ac00ad', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 26900, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1595a7ecf08bcb78d0ac186fc166d', 'stock-11f1595a7ecf08bcb78d0ac186fc166d', 'JAMESON DRY & LIME 6.3% 10PK 375ML', 'stock-11f1595a7ecf08bcb78d0ac186fc166d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 375mL', 5899, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd5382a6050217aa93cc65', 'stock-11f0d0fbdddd5382a6050217aa93cc65', 'J/DANIELS DBL J&NS/CL10PK375ML 6.9%', 'stock-11f0d0fbdddd5382a6050217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit', 999, 53, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b84ccd8f3a9b310a18399e6dd5', 'stock-11f0d5b84ccd8f3a9b310a18399e6dd5', 'CASA DRY GIN 700ML', 'stock-11f0d5b84ccd8f3a9b310a18399e6dd5', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4399, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd56c5887410217aa93cc65', 'stock-11f0d0fbddd56c5887410217aa93cc65', 'HENDRICKS GIN 700ML', 'stock-11f0d0fbddd56c5887410217aa93cc65', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8700, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd33caaafc0217aa93cc65', 'stock-11f0d0fbdddd33caaafc0217aa93cc65', '1800 COCONUT TEQUILA 700ML', 'stock-11f0d0fbdddd33caaafc0217aa93cc65', 'Tequila', 'Imported owner stock list', '/catalogue/stock/1800-coconut.jpg', 'Single unit · 700mL', 8499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cf14b8b7f370ae8f0692fc259475', 'stock-11f0cf14b8b7f370ae8f0692fc259475', 'J/WALKER BLACK LABEL 1L', 'stock-11f0cf14b8b7f370ae8f0692fc259475', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 8499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e21b38bbf332ad1502b859a188e9', 'stock-11f0e21b38bbf332ad1502b859a188e9', 'Royal Challenge', 'stock-11f0e21b38bbf332ad1502b859a188e9', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6299, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe074c95b32b7400a93514bd9ad', 'stock-11f0cfe074c95b32b7400a93514bd9ad', 'D''YAVOL INCEPTION BM/WSK 750ML', 'stock-11f0cfe074c95b32b7400a93514bd9ad', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 12500, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12696cd8552fabba602f5a6b155f7', 'stock-11f12696cd8552fabba602f5a6b155f7', 'J/WALKER XR 21Y CNY TIGER750ML', 'stock-11f12696cd8552fabba602f5a6b155f7', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 24999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2a3b08ee70217aa93cc65', 'stock-11f0d0fbddd2a3b08ee70217aa93cc65', 'ARKTIKA VODKA 700ML', 'stock-11f0d0fbddd2a3b08ee70217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff9d872b502bf790674dcfaa5f3', 'stock-11f0cff9d872b502bf790674dcfaa5f3', 'AMRUT INDIAN SINGLE MALT 700ml', 'stock-11f0cff9d872b502bf790674dcfaa5f3', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9899, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d02eec023824abef0217aa93cc65', 'stock-11f0d02eec023824abef0217aa93cc65', 'JAMESON IRISH WSKY 700ML', 'stock-11f0d02eec023824abef0217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffb96c6c9d497790a40587cc18f', 'stock-11f0cffb96c6c9d497790a40587cc18f', 'Sangam 700 ml', 'stock-11f0cffb96c6c9d497790a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9600, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f158ffb6845f92a5680219550eeb73', 'stock-11f158ffb6845f92a5680219550eeb73', 'DALWHINNIE MALT 15YO 700ML', 'stock-11f158ffb6845f92a5680219550eeb73', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dfa0fa9f5d36bb1002895ac5edbb', 'stock-11f0dfa0fa9f5d36bb1002895ac5edbb', 'yeni Raki Ustalarin', 'stock-11f0dfa0fa9f5d36bb1002895ac5edbb', 'Other', 'Imported owner stock list', NULL, 'Single unit', 7999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddcb08aa8bd0217aa93cc65', 'stock-11f0d0fbdddcb08aa8bd0217aa93cc65', 'PROPER NO12 IRISH WHISKEY700ML', 'stock-11f0d0fbdddcb08aa8bd0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit', 5999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1433858a614ce852506a85b6f6d41', 'stock-11f1433858a614ce852506a85b6f6d41', 'SMIRNOFF RASPBERRY CRUSH 700ML', 'stock-11f1433858a614ce852506a85b6f6d41', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffc17d789288d5a0217aa93cc65', 'stock-11f0cffc17d789288d5a0217aa93cc65', 'Madirraa Paan', 'stock-11f0cffc17d789288d5a0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4799, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f5d32abe506aa606020c4780605d', 'stock-11f0f5d32abe506aa606020c4780605d', 'KAHLUA MEXICAN LIQUEUR 700ML', 'stock-11f0f5d32abe506aa606020c4780605d', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 3999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddded43caf090217aa93cc65', 'stock-11f0d0fbddded43caf090217aa93cc65', 'SMIRNOFF CRUSH OG& PAPL 440ML', 'stock-11f0d0fbddded43caf090217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 440mL', 799, 60, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3eedc8c970217aa93cc65', 'stock-11f0d0fbddd3eedc8c970217aa93cc65', 'J/DANIEL BLACK LABEL 1L', 'stock-11f0d0fbddd3eedc8c970217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 1L', 7699, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ef8e6ba7e1ae99be062cd87d4c25', 'stock-11f0ef8e6ba7e1ae99be062cd87d4c25', 'Blenders Pride 750ml', 'stock-11f0ef8e6ba7e1ae99be062cd87d4c25', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 6499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd4ccf89cb60217aa93cc65', 'stock-11f0d0fbddd4ccf89cb60217aa93cc65', 'JAMESON BLACK BARREL 700ML', 'stock-11f0d0fbddd4ccf89cb60217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd925c928f0217aa93cc65', 'stock-11f0d0fbdddd925c928f0217aa93cc65', 'PROPER NO12 IRISH WHISKEY 1LT', 'stock-11f0d0fbdddd925c928f0217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 8999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f177bb894954002e1e74299a3', 'stock-11f10c3f177bb894954002e1e74299a3', 'MUMM CORD ROUGE NV CHAMP 750ML', 'stock-11f10c3f177bb894954002e1e74299a3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 7499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f16ab2a6c3474898370aea4d8a93b1', 'stock-11f16ab2a6c3474898370aea4d8a93b1', 'Old Monk Rum 1L', 'stock-11f16ab2a6c3474898370aea4d8a93b1', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 1L', 7499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070d34e89c2f0aa8d0f113bf', 'stock-11f105e5070d34e89c2f0aa8d0f113bf', 'KIRIN HYOKETSU G/APL C330ML', 'stock-11f105e5070d34e89c2f0aa8d0f113bf', 'Premix', 'Imported owner stock list', NULL, 'Single unit', 699, 64, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f104a07b4ac6fe948d0a42d7f68c41', 'stock-11f104a07b4ac6fe948d0a42d7f68c41', 'Rampur double cask', 'stock-11f104a07b4ac6fe948d0a42d7f68c41', 'Other', 'Imported owner stock list', NULL, 'Single unit', 10999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff18ca726b08e5406f1f9fab3ed', 'stock-11f0cff18ca726b08e5406f1f9fab3ed', 'BACARDI SPICED RUM 700ML', 'stock-11f0cff18ca726b08e5406f1f9fab3ed', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff86e85ecc894ae0674dcfaa5f3', 'stock-11f0cff86e85ecc894ae0674dcfaa5f3', 'koala vodka 700 ml', 'stock-11f0cff86e85ecc894ae0674dcfaa5f3', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 3999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd99904be300217aa93cc65', 'stock-11f0d0fbddd99904be300217aa93cc65', 'PATRON SILVER 700ML', 'stock-11f0d0fbddd99904be300217aa93cc65', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 10800, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd8d384b5550217aa93cc65', 'stock-11f0d0fbddd8d384b5550217aa93cc65', 'CIROC VODKA 700ML', 'stock-11f0d0fbddd8d384b5550217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7199, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbe53be3aa9ec10217aa93cc65', 'stock-11f0d0fbe53be3aa9ec10217aa93cc65', 'SACHI8 MIXED 10PK Cans 375ML', 'stock-11f0d0fbe53be3aa9ec10217aa93cc65', 'Other', 'Imported owner stock list', NULL, '10-pack · 375mL', 4299, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffe226201d2ba6606d464089785', 'stock-11f0cffe226201d2ba6606d464089785', 'The Solan Gold 750 ml', 'stock-11f0cffe226201d2ba6606d464089785', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 7100, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd602e48c9f0217aa93cc65', 'stock-11f0d0fbddd602e48c9f0217aa93cc65', 'BUMBU RUM 700ML', 'stock-11f0d0fbddd602e48c9f0217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ec536ce913aa913c026626a3b28f', 'stock-11f0ec536ce913aa913c026626a3b28f', 'GLEN GRANT ARBORALIS G/BX700ML', 'stock-11f0ec536ce913aa913c026626a3b28f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 6999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f177e2a70bba802e1e74299a3', 'stock-11f10c3f177e2a70bba802e1e74299a3', 'NV H.LANVIN & FILS 750ML', 'stock-11f10c3f177e2a70bba802e1e74299a3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 6999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd6fcb291970217aa93cc65', 'stock-11f0d0fbddd6fcb291970217aa93cc65', 'SUNTORY HAKU VODKA 40% 700ML', 'stock-11f0d0fbddd6fcb291970217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd5856cb4e10217aa93cc65', 'stock-11f0d0fbddd5856cb4e10217aa93cc65', 'ABSOLUT VODKA RASP 700ML', 'stock-11f0d0fbddd5856cb4e10217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1433858a60d3a9e8806a85b6f6d41', 'stock-11f1433858a60d3a9e8806a85b6f6d41', 'SMIRNOFF MGO P/FRUIT TWST700ML', 'stock-11f1433858a60d3a9e8806a85b6f6d41', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 5999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd6624b6920217aa93cc65', 'stock-11f0d0fbdddd6624b6920217aa93cc65', 'WILD TURKEY 81 PROOF 700ML', 'stock-11f0d0fbdddd6624b6920217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffd98f95b5282bf0674dcfaa5f3', 'stock-11f0cffd98f95b5282bf0674dcfaa5f3', 'McDowells No 1 Reserve Whisky', 'stock-11f0cffd98f95b5282bf0674dcfaa5f3', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 6799, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d03895e15eac899606f1f9fab3ed', 'stock-11f0d03895e15eac899606f1f9fab3ed', 'Haywards 5000 super strong beer 500 ml cans', 'stock-11f0d03895e15eac899606f1f9fab3ed', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 500mL', 599, 68, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e21a3c6f00a68f9e0ae93dcd8c23', 'stock-11f0e21a3c6f00a68f9e0ae93dcd8c23', 'Premium Vodka 700 ml', 'stock-11f0e21a3c6f00a68f9e0ae93dcd8c23', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd955fca3c80217aa93cc65', 'stock-11f0d0fbddd955fca3c80217aa93cc65', 'GREY GOOSE 200ML', 'stock-11f0d0fbddd955fca3c80217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2499, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe1d115aade8ed70a40587cc18f', 'stock-11f0cfe1d115aade8ed70a40587cc18f', 'D''YAVOL SINGLE EST VODKA 750ML', 'stock-11f0cfe1d115aade8ed70a40587cc18f', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 750mL', 9900, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe193dcb05e890b0a93514bd9ad', 'stock-11f0cfe193dcb05e890b0a93514bd9ad', 'D''yavol Vortex blended scotch whisky 750 ml', 'stock-11f0cfe193dcb05e890b0a93514bd9ad', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 750mL', 9900, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d02d5f4daa40aeff06f1f9fab3ed', 'stock-11f0d02d5f4daa40aeff06f1f9fab3ed', 'J/WALKER DBL BLACK 1L', 'stock-11f0d02d5f4daa40aeff06f1f9fab3ed', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 9899, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b863a9c61aa10302825451f435', 'stock-11f0d5b863a9c61aa10302825451f435', 'CASA SPIRITS DARK RUM 700ML', 'stock-11f0d5b863a9c61aa10302825451f435', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4399, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddda2d895a80217aa93cc65', 'stock-11f0d0fbdddda2d895a80217aa93cc65', 'WILD TURKEY 81 PROOF 40.5% 1L', 'stock-11f0d0fbdddda2d895a80217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 1L', 7899, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffc9bdb40709f420a93514bd9ad', 'stock-11f0cffc9bdb40709f420a93514bd9ad', 'Saunfiya', 'stock-11f0cffc9bdb40709f420a93514bd9ad', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6500, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f149d6302f01d28900027da9d844a7', 'stock-11f149d6302f01d28900027da9d844a7', 'absolut Mango', 'stock-11f149d6302f01d28900027da9d844a7', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 6499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd31ac0b0120217aa93cc65', 'stock-11f0d0fbddd31ac0b0120217aa93cc65', 'J/DANIEL GENTLEMAN JACK 700ML', 'stock-11f0d0fbddd31ac0b0120217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9fcc8a5f00217aa93cc65', 'stock-11f0d0fbddd9fcc8a5f00217aa93cc65', 'MONKEY SHOULDER SCOTCH 700ML', 'stock-11f0d0fbddd9fcc8a5f00217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff7b0d47f829f5d0674dcfaa5f3', 'stock-11f0cff7b0d47f829f5d0674dcfaa5f3', 'BAILEYS IRISH CRM 1L', 'stock-11f0cff7b0d47f829f5d0674dcfaa5f3', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 1L', 5499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fb3c19ab3838be1806349a2e7263', 'stock-11f0fb3c19ab3838be1806349a2e7263', 'Grand Domalt Whiskey 700ml', 'stock-11f0fb3c19ab3838be1806349a2e7263', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 3499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe8b12c0fcc8d8902824e01c829', 'stock-11f0cfe8b12c0fcc8d8902824e01c829', 'MONKEY SHOULDER WHISKY 1L', 'stock-11f0cfe8b12c0fcc8d8902824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 9600, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd90ec6b9430217aa93cc65', 'stock-11f0d0fbddd90ec6b9430217aa93cc65', 'BUMBU RUM XO 700ML', 'stock-11f0d0fbddd90ec6b9430217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9599, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda387880300217aa93cc65', 'stock-11f0d0fbddda387880300217aa93cc65', 'J/WALKER RED & COLA 4.6% CAN 375ML', 'stock-11f0d0fbddda387880300217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 799, 48, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffb7a728dd6a94b06d464089785', 'stock-11f0cffb7a728dd6a94b06d464089785', '8 PM', 'stock-11f0cffb7a728dd6a94b06d464089785', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6299, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfef7ba33b08ab5e02824e01c829', 'stock-11f0cfef7ba33b08ab5e02824e01c829', 'VAT 69 SCOTCH WHISKY 700ML', 'stock-11f0cfef7ba33b08ab5e02824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6299, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddcb904b19c0217aa93cc65', 'stock-11f0d0fbdddcb904b19c0217aa93cc65', 'WILD BOAR B/COLA15% 375ML', 'stock-11f0d0fbdddcb904b19c0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 375mL', 1399, 27, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffcaefe541c85d90275d0a0b38b', 'stock-11f0cffcaefe541c85d90275d0a0b38b', 'Mota Sangtra', 'stock-11f0cffcaefe541c85d90275d0a0b38b', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6199, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddc871884470217aa93cc65', 'stock-11f0d0fbdddc871884470217aa93cc65', 'SOUTHERN COMFORT BLK 40% 700ML', 'stock-11f0d0fbdddc871884470217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6199, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf91532262cbd8f020c4780605d', 'stock-11f0fcf91532262cbd8f020c4780605d', 'KIRIN HYOKETSU VDK LEMON 330ML', 'stock-11f0fcf91532262cbd8f020c4780605d', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 330mL', 799, 46, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12222780048628b1c0ab5b3601ec3', 'stock-11f12222780048628b1c0ab5b3601ec3', 'HAKU VODKA YUZU 40% 700ML', 'stock-11f12222780048628b1c0ab5b3601ec3', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7299, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1540a3a3ecd7ca0ef06fc5f102425', 'stock-11f1540a3a3ecd7ca0ef06fc5f102425', 'WOODFORD RES BOURBON 700ML', 'stock-11f1540a3a3ecd7ca0ef06fc5f102425', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7299, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f108088ed0cfa085f0024ea5fa0c95', 'stock-11f108088ed0cfa085f0024ea5fa0c95', 'Mansion house Brandy', 'stock-11f108088ed0cfa085f0024ea5fa0c95', 'Other', 'Imported owner stock list', NULL, 'Single unit', 5999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13a29893bbc96a661068923a54da9', 'stock-11f13a29893bbc96a661068923a54da9', 'Mini ouzo gift pack', 'stock-11f13a29893bbc96a661068923a54da9', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit', 5999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd1c2ec83870217aa93cc65', 'stock-11f0d0fbddd1c2ec83870217aa93cc65', 'CAPT MORGAN SPICED GOLD 700ML', 'stock-11f0d0fbddd1c2ec83870217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5100, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2f2acb9a70217aa93cc65', 'stock-11f0d0fbddd2f2acb9a70217aa93cc65', 'BELVEDERE VODKA 700ML', 'stock-11f0d0fbddd2f2acb9a70217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddc9d70a0800217aa93cc65', 'stock-11f0d0fbdddc9d70a0800217aa93cc65', 'STARWARD TWO-FOLD 700ML', 'stock-11f0d0fbdddc9d70a0800217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf9152de79c9ad5020c4780605d', 'stock-11f0fcf9152de79c9ad5020c4780605d', 'GALLIANO BLACK SAMBUCA30%500ML', 'stock-11f0fcf9152de79c9ad5020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 500mL', 4999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ed1ebed4be46a731026626a3b28f', 'stock-11f0ed1ebed4be46a731026626a3b28f', 'PS ALIZE GOLD PASSION 700ML', 'stock-11f0ed1ebed4be46a731026626a3b28f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe983129632b5b50a40587cc18f', 'stock-11f0cfe983129632b5b50a40587cc18f', 'MAKERS MARK BOURBON 40% 700ML', 'stock-11f0cfe983129632b5b50a40587cc18f', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6900, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f5d198a0bb9ca45106d343ddfbc5', 'stock-11f0f5d198a0bb9ca45106d343ddfbc5', 'KAHLUA MEXICAN LIQUEUR 1L', 'stock-11f0f5d198a0bb9ca45106d343ddfbc5', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 1L', 5699, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070c3f98b0a50aa8d0f113bf', 'stock-11f105e5070c3f98b0a50aa8d0f113bf', 'JACOBS CK RES CAB SAUV 750ML', 'stock-11f105e5070c3f98b0a50aa8d0f113bf', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1899, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10b01ee2dac9ca9e606e3dc9e7261', 'stock-11f10b01ee2dac9ca9e606e3dc9e7261', 'Glenfiddich 15 year old gift pack', 'stock-11f10b01ee2dac9ca9e606e3dc9e7261', 'Other', 'Imported owner stock list', NULL, 'Single unit', 16999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ef8792ab7d3aa6cc06e800ccddc5', 'stock-11f0ef8792ab7d3aa6cc06e800ccddc5', 'Signature Whisky', 'stock-11f0ef8792ab7d3aa6cc06e800ccddc5', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 8499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d02f6d9664789c020275d0a0b38b', 'stock-11f0d02f6d9664789c020275d0a0b38b', 'GLENFIDDICH 18YO 700ML', 'stock-11f0d02f6d9664789c020275d0a0b38b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 16900, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddaa43ebe560217aa93cc65', 'stock-11f0d0fbdddaa43ebe560217aa93cc65', 'CRUISER WILD RASPBERRY 4.6% 275ML', 'stock-11f0d0fbdddaa43ebe560217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 275mL', 699, 48, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd1cab283e80217aa93cc65', 'stock-11f0d0fbddd1cab283e80217aa93cc65', 'JAMESON CASKMATES 700ML', 'stock-11f0d0fbddd1cab283e80217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6699, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13db82e5b6406b0a80a9a61b55857', 'stock-11f13db82e5b6406b0a80a9a61b55857', 'GLEN GRANT MALT 10YO NCO 700ML', 'stock-11f13db82e5b6406b0a80a9a61b55857', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8299, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2b288bb550217aa93cc65', 'stock-11f0d0fbddd2b288bb550217aa93cc65', 'BEGIN GIN 700ML', 'stock-11f0d0fbddd2b288bb550217aa93cc65', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1599bfc421dd4be17064cf11ecd73', 'stock-11f1599bfc421dd4be17064cf11ecd73', 'JAGERMEISTER 200ML', 'stock-11f1599bfc421dd4be17064cf11ecd73', 'Other', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2199, 15, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd29c1cbb1e0217aa93cc65', 'stock-11f0d0fbddd29c1cbb1e0217aa93cc65', '19 CRIMES SHIRAZ 750ML', 'stock-11f0d0fbddd29c1cbb1e0217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 22, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddecba4bd410217aa93cc65', 'stock-11f0d0fbdddecba4bd410217aa93cc65', 'SMIRNOFF CRUSH PEACH/MANGO CANS 440ML', 'stock-11f0d0fbdddecba4bd410217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 440mL', 699, 46, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f170e0e21d1966b6a702ad914c702b', 'stock-11f170e0e21d1966b6a702ad914c702b', 'MALIBU COCONUT RUM 700ML', 'stock-11f170e0e21d1966b6a702ad914c702b', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fb3c68c88376955906349a2e7263', 'stock-11f0fb3c68c88376955906349a2e7263', 'Real Beast bourbon whiskey', 'stock-11f0fb3c68c88376955906349a2e7263', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit', 4499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1595a7ed08f1698ef0ac186fc166d', 'stock-11f1595a7ed08f1698ef0ac186fc166d', 'UDL DBL CRUSH ORANGE MANGO 8% Cans 375ML', 'stock-11f1595a7ed08f1698ef0ac186fc166d', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 899, 35, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ef858ca14804a8c2062cd87d4c25', 'stock-11f0ef858ca14804a8c2062cd87d4c25', 'TANQUERAY GIN 1L', 'stock-11f0ef858ca14804a8c2062cd87d4c25', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 1L', 7799, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f14474e96a8b56b1d902f95bd68cad', 'stock-11f14474e96a8b56b1d902f95bd68cad', 'bro code red', 'stock-11f14474e96a8b56b1d902f95bd68cad', 'Beer', 'Imported owner stock list', NULL, 'Single unit', 599, 52, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ed28db6deb2283ab0a17a67d8269', 'stock-11f0ed28db6deb2283ab0a17a67d8269', 'INDRI DRU INDIAN S/M WSK 700ML', 'stock-11f0ed28db6deb2283ab0a17a67d8269', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 14999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddde9878a6df0217aa93cc65', 'stock-11f0d0fbddde9878a6df0217aa93cc65', 'NUVE VODKA 40% 700ML', 'stock-11f0d0fbddde9878a6df0217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd30b988e170217aa93cc65', 'stock-11f0d0fbddd30b988e170217aa93cc65', 'BUFFALO TRACE BOURBN 40% 700ML', 'stock-11f0d0fbddd30b988e170217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda7130ad560217aa93cc65', 'stock-11f0d0fbddda7130ad560217aa93cc65', 'SIERRA TEQUILA SILVER 700ML', 'stock-11f0d0fbddda7130ad560217aa93cc65', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f16e075f82e0c081370a6138cadccf', 'stock-11f16e075f82e0c081370a6138cadccf', 'ALIZE BLEU PASSION 700ML', 'stock-11f16e075f82e0c081370a6138cadccf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f181483cb537a6a1f202af50f1f15f', 'stock-11f181483cb537a6a1f202af50f1f15f', 'CAMPARI APERITIF NUPK 700ML', 'stock-11f181483cb537a6a1f202af50f1f15f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17658a60f9d68bada0a49b8994a81', 'stock-11f17658a60f9d68bada0a49b8994a81', 'PENFOLDS BIN 28 SHZ 23CRK750ML', 'stock-11f17658a60f9d68bada0a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02dace2b90806a73aac0f0d', 'stock-11f0e06bf02dace2b90806a73aac0f0d', 'CHANDON BRUT ROSE NV 750ML', 'stock-11f0e06bf02dace2b90806a73aac0f0d', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f138448f7536d2b04f0af4cd5524a3', 'stock-11f138448f7536d2b04f0af4cd5524a3', 'PEPPERJACK DISH SHIRAZ 750ML', 'stock-11f138448f7536d2b04f0af4cd5524a3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd8e540a4600217aa93cc65', 'stock-11f0d0fbddd8e540a4600217aa93cc65', 'VB BTL 3PK 750ML', 'stock-11f0d0fbddd8e540a4600217aa93cc65', 'Beer', 'Imported owner stock list', NULL, '3-pack · 750mL', 1999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f8d655856f76a4ed0a7f3ca525df', 'stock-11f0f8d655856f76a4ed0a7f3ca525df', 'J.WALKER SHERRY FINISH 15YO 700ML', 'stock-11f0f8d655856f76a4ed0a7f3ca525df', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9900, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddbc9f4b28c0217aa93cc65', 'stock-11f0d0fbdddbc9f4b28c0217aa93cc65', 'SMIRNOFF ICE DB 6.5% 10P 375ML', 'stock-11f0d0fbdddbc9f4b28c0217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 799, 37, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfed0c7c37f4abdb0a40587cc18f', 'stock-11f0cfed0c7c37f4abdb0a40587cc18f', 'BLACK BUSH WHISKEY 700ML', 'stock-11f0cfed0c7c37f4abdb0a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5900, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070bda129ea50aa8d0f113bf', 'stock-11f105e5070bda129ea50aa8d0f113bf', 'DIVAS VKAT BLACK LABEL 700ML', 'stock-11f105e5070bda129ea50aa8d0f113bf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 1699, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c82a82a8e802433d717f57', 'stock-11f132bc12c82a82a8e802433d717f57', 'BELENA MOSCATO 750ML', 'stock-11f132bc12c82a82a8e802433d717f57', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2199, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f181483cb4c582a8cb02af50f1f15f', 'stock-11f181483cb4c582a8cb02af50f1f15f', 'JACOBS CK PINOT NOIR 750ML', 'stock-11f181483cb4c582a8cb02af50f1f15f', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 19, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfedf45b52eeb3400a40587cc18f', 'stock-11f0cfedf45b52eeb3400a40587cc18f', 'CANADIAN CLUB ORIG 37% 700ML', 'stock-11f0cfedf45b52eeb3400a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4699, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ba512892f908523022fecc2707f', 'stock-11f11ba512892f908523022fecc2707f', 'TEELING SMALL BATCH WHSK 700ML', 'stock-11f11ba512892f908523022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffd4efe003ea2650a93514bd9ad', 'stock-11f0cffd4efe003ea2650a93514bd9ad', 'All Seasons', 'stock-11f0cffd4efe003ea2650a93514bd9ad', 'Other', 'Imported owner stock list', NULL, 'Single unit', 5499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd564a692110217aa93cc65', 'stock-11f0d0fbddd564a692110217aa93cc65', 'PEPPERJACK SHIRAZ 750ML', 'stock-11f0d0fbddd564a692110217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13e206d7f10f2be750aff1faed0db', 'stock-11f13e206d7f10f2be750aff1faed0db', 'PATRON ANEJO 700ML', 'stock-11f13e206d7f10f2be750aff1faed0db', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 13699, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f5d1e659bbc284460a3582634c41', 'stock-11f0f5d1e659bbc284460a3582634c41', 'ST AGNES VS BRANDY 150ML', 'stock-11f0f5d1e659bbc284460a3582634c41', 'Other', 'Imported owner stock list', NULL, 'Single unit · 150mL', 1699, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f108b2e0d8f71eb4e10a22361a611b', 'stock-11f108b2e0d8f71eb4e10a22361a611b', 'PAUL JOHN NIRVANA 700ml', 'stock-11f108b2e0d8f71eb4e10a22361a611b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1433858a61c089a6106a85b6f6d41', 'stock-11f1433858a61c089a6106a85b6f6d41', 'KICK THE RULES TEQ MANCRM700ML', 'stock-11f1433858a61c089a6106a85b6f6d41', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f148f32c976034ba280a0370a541b1', 'stock-11f148f32c976034ba280a0370a541b1', 'KICK THE RULES TEQ S/BCRM700ML', 'stock-11f148f32c976034ba280a0370a541b1', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070bd15ca3a60aa8d0f113bf', 'stock-11f105e5070bd15ca3a60aa8d0f113bf', 'J/DANIEL G/MAN JACK & COLA 330ML', 'stock-11f105e5070bd15ca3a60aa8d0f113bf', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 330mL', 999, 27, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfeb7e0c10a8821402824e01c829', 'stock-11f0cfeb7e0c10a8821402824e01c829', 'BALLANTINES SCOTCH 1L', 'stock-11f0cfeb7e0c10a8821402824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 6500, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd4611eaa580217aa93cc65', 'stock-11f0d0fbddd4611eaa580217aa93cc65', 'ESPOLON TEQUILA BLANCO 700ML', 'stock-11f0d0fbddd4611eaa580217aa93cc65', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff92f28af88b51f06f1f9fab3ed', 'stock-11f0cff92f28af88b51f06f1f9fab3ed', 'Magic Moments premium grain vodka', 'stock-11f0cff92f28af88b51f06f1f9fab3ed', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 6399, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ba5edc501e2b691022fecc2707f', 'stock-11f11ba5edc501e2b691022fecc2707f', 'LARK chinotto citrus WHSKY500ML', 'stock-11f11ba5edc501e2b691022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit', 25499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ba58804768a89950653b23d3665', 'stock-11f11ba58804768a89950653b23d3665', 'LARK TAS PEATED S/MLT WSK500ML', 'stock-11f11ba58804768a89950653b23d3665', 'Other', 'Imported owner stock list', NULL, 'Single unit', 25499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda5e98a7220217aa93cc65', 'stock-11f0d0fbddda5e98a7220217aa93cc65', 'SMIRNOFF VODKA RED 1L', 'stock-11f0d0fbddda5e98a7220217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 1L', 6299, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf915321c4a8ac7020c4780605d', 'stock-11f0fcf915321c4a8ac7020c4780605d', 'TANQUERAY & TONIC 250ML', 'stock-11f0fcf915321c4a8ac7020c4780605d', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 250mL', 699, 36, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfe46a8354f8b6f70a40587cc18f', 'stock-11f0cfe46a8354f8b6f70a40587cc18f', 'The Glenlivet 12 yr old 1 L', 'stock-11f0cfe46a8354f8b6f70a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1L', 12499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15410c3342644b55a0a8d2a608a41', 'stock-11f15410c3342644b55a0a8d2a608a41', 'MOLLYS IRISH CREAM 1L', 'stock-11f15410c3342644b55a0a8d2a608a41', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1L', 4999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3e504b55e0217aa93cc65', 'stock-11f0d0fbddd3e504b55e0217aa93cc65', 'DE BORTOLI S/HIL CHARD 750ML', 'stock-11f0d0fbddd3e504b55e0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd458aeab670217aa93cc65', 'stock-11f0d0fbddd458aeab670217aa93cc65', 'DE BORTOLI S/HIL SHIRAZ 750ML', 'stock-11f0d0fbddd458aeab670217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf91531f2888665020c4780605d', 'stock-11f0fcf91531f2888665020c4780605d', 'PENFOLDS K/HILL SHIRAZ 750ML', 'stock-11f0fcf91531f2888665020c4780605d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f152978cdc12988f7b0675a209922f', 'stock-11f152978cdc12988f7b0675a209922f', 'JAMESON IRISH WHISKY 200ML', 'stock-11f152978cdc12988f7b0675a209922f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2699, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f138448f73ee1cb0280af4cd5524a3', 'stock-11f138448f73ee1cb0280af4cd5524a3', 'ABSOLUT VODKA VANILLA 700ML', 'stock-11f138448f73ee1cb0280af4cd5524a3', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb53668a9e0217aa93cc65', 'stock-11f0d0fbdddb53668a9e0217aa93cc65', 'SIERRA TEQUILA REPOSADO 700ML', 'stock-11f0d0fbdddb53668a9e0217aa93cc65', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0edf5c9386ebea6ac026626a3b28f', 'stock-11f0edf5c9386ebea6ac026626a3b28f', 'kingfisher strong cans 500ml', 'stock-11f0edf5c9386ebea6ac026626a3b28f', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 500mL', 599, 40, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97de548aeb8020c4780605d', 'stock-11f0f61cf97de548aeb8020c4780605d', 'JIM BEAM WHITE DS ZERO 6.7% CANS 375ML', 'stock-11f0f61cf97de548aeb8020c4780605d', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit · 375mL', 699, 34, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1080ac9effa0aae4d0aa8d0f113bf', 'stock-11f1080ac9effa0aae4d0aa8d0f113bf', 'PAUL JOHN BRILLIANCE WHISKY 700ML', 'stock-11f1080ac9effa0aae4d0aa8d0f113bf', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f148f32c973ac88ba20a0370a541b1', 'stock-11f148f32c973ac88ba20a0370a541b1', 'KICK THE RULES TEQ W/MCRM700ML', 'stock-11f148f32c973ac88ba20a0370a541b1', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f68201ac1964bbf706d343ddfbc5', 'stock-11f0f68201ac1964bbf706d343ddfbc5', 'ABSOLUT VODKA 200ML', 'stock-11f0f68201ac1964bbf706d343ddfbc5', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2499, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd6dbe2b85d0217aa93cc65', 'stock-11f0d0fbddd6dbe2b85d0217aa93cc65', 'ARKTIKA VODKA 150ML', 'stock-11f0d0fbddd6dbe2b85d0217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 150mL', 1599, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddf8d648c6e0217aa93cc65', 'stock-11f0d0fbdddf8d648c6e0217aa93cc65', 'ROKU GIN SAKURA BLOOM 43%700ML', 'stock-11f0d0fbdddf8d648c6e0217aa93cc65', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7399, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ea9bbb0f36ca0f102eff026e731', 'stock-11f11ea9bbb0f36ca0f102eff026e731', 'GIANCHAND IND S/MALT WSK 750ML', 'stock-11f11ea9bbb0f36ca0f102eff026e731', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 750mL', 10999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12c19e59fdd2882a8028f3ad8b743', 'stock-11f12c19e59fdd2882a8028f3ad8b743', 'J & B RARE SCOTCH 700ML', 'stock-11f12c19e59fdd2882a8028f3ad8b743', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd44846b4630217aa93cc65', 'stock-11f0d0fbddd44846b4630217aa93cc65', 'J/DANIEL BLACK LABEL 700ML', 'stock-11f0d0fbddd44846b4630217aa93cc65', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9e24ca8620217aa93cc65', 'stock-11f0d0fbddd9e24ca8620217aa93cc65', 'WOODSTOCK&COLA 6% 10PK 375ML', 'stock-11f0d0fbddd9e24ca8620217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 5499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd4bda9e0b0217aa93cc65', 'stock-11f0d0fbdddd4bda9e0b0217aa93cc65', 'DIVAS PINK TOPAZ WMELON 330ML', 'stock-11f0d0fbdddd4bda9e0b0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 499, 44, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9f2649a8d0217aa93cc65', 'stock-11f0d0fbddd9f2649a8d0217aa93cc65', 'SAILOR JERRY RUM 700ML', 'stock-11f0d0fbddd9f2649a8d0217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5399, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddf2fa4809f0217aa93cc65', 'stock-11f0d0fbdddf2fa4809f0217aa93cc65', 'BILLSONS TANGLE D/VDK NEW250ML', 'stock-11f0d0fbdddf2fa4809f0217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 899, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1e7e7f108fb60685313f190f', 'stock-11f0e9de1e7e7f108fb60685313f190f', 'J/DANIEL & DRY CAN 375ML', 'stock-11f0e9de1e7e7f108fb60685313f190f', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 899, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12d2f5c5f214cb01c0a51ae7bdf19', 'stock-11f12d2f5c5f214cb01c0a51ae7bdf19', 'SMIRNOFF ICE DB ORANGE 375ML', 'stock-11f12d2f5c5f214cb01c0a51ae7bdf19', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 899, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd5741e956d0217aa93cc65', 'stock-11f0d0fbddd5741e956d0217aa93cc65', 'J/WALKER RED LBL 1L', 'stock-11f0d0fbddd5741e956d0217aa93cc65', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 6999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffdfbe55e2890cb0a40587cc18f', 'stock-11f0cffdfbe55e2890cb0a40587cc18f', 'The Glenwalk blended scotch whisky 700 ml', 'stock-11f0cffdfbe55e2890cb0a40587cc18f', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97dee089a3d020c4780605d', 'stock-11f0f61cf97dee089a3d020c4780605d', 'VOK COFFEE LIQUEUR 17% 500ML', 'stock-11f0f61cf97dee089a3d020c4780605d', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 500mL', 3499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddcdc4ab87a0217aa93cc65', 'stock-11f0d0fbdddcdc4ab87a0217aa93cc65', 'BROOKVALE V&P ICE TEA 330ML', 'stock-11f0d0fbdddcdc4ab87a0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 699, 30, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd894298690217aa93cc65', 'stock-11f0d0fbdddd894298690217aa93cc65', 'ST REMY BRANDY VSOP 37% 700ML', 'stock-11f0d0fbdddd894298690217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5199, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd5c4be89470217aa93cc65', 'stock-11f0d0fbddd5c4be89470217aa93cc65', 'DA LUCA PROSECCO LS 750ML', 'stock-11f0d0fbddd5c4be89470217aa93cc65', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2599, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12d2f5c5f6576a98f0a51ae7bdf19', 'stock-11f12d2f5c5f6576a98f0a51ae7bdf19', 'UDL Vodka Lemon Lime & Soda Can 375ml24pk', 'stock-11f12d2f5c5f6576a98f0a51ae7bdf19', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit', 899, 23, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02efae8aff306a73aac0f0d', 'stock-11f0e06bf02efae8aff306a73aac0f0d', 'FLINDERS BAY CHARD LS 750ML', 'stock-11f0e06bf02efae8aff306a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1699, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd8f79292380217aa93cc65', 'stock-11f0d0fbddd8f79292380217aa93cc65', 'MERCURY DBL CIDER C250ML', 'stock-11f0d0fbddd8f79292380217aa93cc65', 'Cider', 'Imported owner stock list', NULL, 'Single unit', 599, 34, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f104a216a3b40cb1160a42d7f68c41', 'stock-11f104a216a3b40cb1160a42d7f68c41', 'CHIVAS REGAL SCOTCH XV 700ML', 'stock-11f104a216a3b40cb1160a42d7f68c41', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ef8671749e90a71b02e63fd03243', 'stock-11f0ef8671749e90a71b02e63fd03243', 'Aristocrat Black', 'stock-11f0ef8671749e90a71b02e63fd03243', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd27caabf5d0217aa93cc65', 'stock-11f0d0fbddd27caabf5d0217aa93cc65', 'BUNDY RUM UP 700ML', 'stock-11f0d0fbddd27caabf5d0217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97ddd5a9d11020c4780605d', 'stock-11f0f61cf97ddd5a9d11020c4780605d', '28 SHOTS BUCKET LITFATLAMB30ML', 'stock-11f0f61cf97ddd5a9d11020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit', 3999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf9152e538aa2b0020c4780605d', 'stock-11f0fcf9152e538aa2b0020c4780605d', 'APEROL APERITIF 700ML', 'stock-11f0fcf9152e538aa2b0020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 3999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd82d6cbeb30217aa93cc65', 'stock-11f0d0fbddd82d6cbeb30217aa93cc65', 'P.LEHMANN P/TRAIT PINOT GRIGIO 750ML', 'stock-11f0d0fbddd82d6cbeb30217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d4d8126f936eac36062f9a568477', 'stock-11f0d4d8126f936eac36062f9a568477', 'Peter Lehmann 750 ml sauv/ blanc', 'stock-11f0d4d8126f936eac36062f9a568477', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10639d599d574b1620a53019d711d', 'stock-11f10639d599d574b1620a53019d711d', 'BOMBAY G&T DOUBLE SERVE 10% CANS 250ML', 'stock-11f10639d599d574b1620a53019d711d', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 250mL', 999, 20, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddde4f6c87ff0217aa93cc65', 'stock-11f0d0fbddde4f6c87ff0217aa93cc65', 'CHINGU LYCHEE 360ML', 'stock-11f0d0fbddde4f6c87ff0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 360mL', 999, 20, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddcc10682850217aa93cc65', 'stock-11f0d0fbdddcc10682850217aa93cc65', 'DIVAS SAPPHIRE B/BERRY 330ML', 'stock-11f0d0fbdddcc10682850217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 499, 40, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f823746bf800ba3b0a7c48c5fd89', 'stock-11f0f823746bf800ba3b0a7c48c5fd89', 'Label 5 Scotch 700ml', 'stock-11f0f823746bf800ba3b0a7c48c5fd89', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4900, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ba48780ab6292c40653b23d3665', 'stock-11f11ba48780ab6292c40653b23d3665', 'Glen Moray 700ml', 'stock-11f11ba48780ab6292c40653b23d3665', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda68f2b3e90217aa93cc65', 'stock-11f0d0fbddda68f2b3e90217aa93cc65', 'KRAKEN BLACK SPICED RUM 700ML', 'stock-11f0d0fbddda68f2b3e90217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9df4a3e9cac062a0ca9a125', 'stock-11f1172eb9df4a3e9cac062a0ca9a125', 'JACOBS CK RES CHARDONNAY 750ML', 'stock-11f1172eb9df4a3e9cac062a0ca9a125', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d17b2a5b590abcd202409e5289ef', 'stock-11f0d17b2a5b590abcd202409e5289ef', 'JACOBS CK MERLOT 750ML', 'stock-11f0d17b2a5b590abcd202409e5289ef', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 15, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffc4821f1ccb0000a40587cc18f', 'stock-11f0cffc4821f1ccb0000a40587cc18f', 'Madira Gulab', 'stock-11f0cffc4821f1ccb0000a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4799, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15998ce8da0c8a837027779892959', 'stock-11f15998ce8da0c8a837027779892959', 'CHIVAS REGAL SCOTCH 12YO 200ML', 'stock-11f15998ce8da0c8a837027779892959', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2399, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd9908a868c0217aa93cc65', 'stock-11f0d0fbddd9908a868c0217aa93cc65', 'J/DANIEL & COLA BTL 330ML', 'stock-11f0d0fbddd9908a868c0217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 330mL', 799, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddddb2b48e510217aa93cc65', 'stock-11f0d0fbddddb2b48e510217aa93cc65', 'CRUISER DBL GUAVA 6.8% 375ML cans', 'stock-11f0d0fbddddb2b48e510217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 599, 32, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1013662f9347c84fc0a2ca96c3541', 'stock-11f1013662f9347c84fc0a2ca96c3541', 'MALIBU PINA COLADA 250ML', 'stock-11f1013662f9347c84fc0a2ca96c3541', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 250mL', 599, 32, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd498828fc10217aa93cc65', 'stock-11f0d0fbddd498828fc10217aa93cc65', 'GEKKEIKAN SAKE 720ML', 'stock-11f0d0fbddd498828fc10217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 720mL', 3799, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb41aa920c0217aa93cc65', 'stock-11f0d0fbdddb41aa920c0217aa93cc65', 'TANQUERAY GIN 700ML', 'stock-11f0d0fbdddb41aa920c0217aa93cc65', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6299, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd59d68b4440217aa93cc65', 'stock-11f0d0fbddd59d68b4440217aa93cc65', 'BAROSSA TWR GREN SHZ MOR 750ML', 'stock-11f0d0fbddd59d68b4440217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2699, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a4eb46a3bd06a76708ff1b', 'stock-11f0d6e917a4eb46a3bd06a76708ff1b', 'FIREBALL CINNAMON WHISKY 200ML', 'stock-11f0d6e917a4eb46a3bd06a76708ff1b', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 200mL', 1699, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1433858a5f052b27106a85b6f6d41', 'stock-11f1433858a5f052b27106a85b6f6d41', 'GORDONS PINK GIN 700ML', 'stock-11f1433858a5f052b27106a85b6f6d41', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6199, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f159643fdb217c871606a4fe01f2bd', 'stock-11f159643fdb217c871606a4fe01f2bd', 'BUNDY RUM UP PET 375ML', 'stock-11f159643fdb217c871606a4fe01f2bd', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 375mL', 3099, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070d3c2c81ec0aa8d0f113bf', 'stock-11f105e5070d3c2c81ec0aa8d0f113bf', 'SOUR PUSS RTD MIXED 8PK 330ML', 'stock-11f105e5070d3c2c81ec0aa8d0f113bf', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 330mL', 4599, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9e0f2c6abc6062a0ca9a125', 'stock-11f1172eb9e0f2c6abc6062a0ca9a125', 'PENFOLDS MAX''S PINOT NOIR 750ML', 'stock-11f1172eb9e0f2c6abc6062a0ca9a125', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2599, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f177c6ab4b97102e1e74299a3', 'stock-11f10c3f177c6ab4b97102e1e74299a3', 'JACOBS CK SHIRAZ 750ML', 'stock-11f10c3f177c6ab4b97102e1e74299a3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddde73c0a7250217aa93cc65', 'stock-11f0d0fbddde73c0a7250217aa93cc65', 'HARD RATED ZERO SUGAR10PK 375ML 4.5%', 'stock-11f0d0fbddde73c0a7250217aa93cc65', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit · 375mL', 699, 26, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ea9bf7eb904a8ddf06d0e2a77c03', 'stock-11f0ea9bf7eb904a8ddf06d0e2a77c03', 'BEYLERBEY GOBAK 350 ml', 'stock-11f0ea9bf7eb904a8ddf06d0e2a77c03', 'Other', 'Imported owner stock list', NULL, 'Single unit · 350mL', 5999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11470f0c2728aafaa0aa8d0f113bf', 'stock-11f11470f0c2728aafaa0aa8d0f113bf', 'LICOR 43 700ML', 'stock-11f11470f0c2728aafaa0aa8d0f113bf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f175c172839a2289f102d5616b8d49', 'stock-11f175c172839a2289f102d5616b8d49', 'TRIPLE G GIN AUST DRY GIN700ML', 'stock-11f175c172839a2289f102d5616b8d49', 'Gin', 'Imported owner stock list', NULL, 'Single unit', 5999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1300365c2a386a4570afd7e9bbf03', 'stock-11f1300365c2a386a4570afd7e9bbf03', 'Kookaburra dry Gin', 'stock-11f1300365c2a386a4570afd7e9bbf03', 'Gin', 'Imported owner stock list', NULL, 'Single unit', 4499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f130032813e37e99ed0afd7e9bbf03', 'stock-11f130032813e37e99ed0afd7e9bbf03', 'young Monk white rum', 'stock-11f130032813e37e99ed0afd7e9bbf03', 'Rum', 'Imported owner stock list', NULL, 'Single unit', 4499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd745289d860217aa93cc65', 'stock-11f0d0fbddd745289d860217aa93cc65', '19 CRIMES SAUV BLOCK 750ML', 'stock-11f0d0fbddd745289d860217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a3da1c9df306a76708ff1b', 'stock-11f0d6e917a3da1c9df306a76708ff1b', 'ELEPHANT IN ROOM SHZ 750ML', 'stock-11f0d6e917a3da1c9df306a76708ff1b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f138448f75412c95990af4cd5524a3', 'stock-11f138448f75412c95990af4cd5524a3', 'CHINGU YOGHURT LIQUEUR BOTTLES 360ML', 'stock-11f138448f75412c95990af4cd5524a3', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 360mL', 999, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf91532300e8319020c4780605d', 'stock-11f0fcf91532300e8319020c4780605d', 'KRAKEN SPICED RUM&CLA C330ML', 'stock-11f0fcf91532300e8319020c4780605d', 'Rum', 'Imported owner stock list', NULL, 'Single unit', 899, 20, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff90a91a2ec82400674dcfaa5f3', 'stock-11f0cff90a91a2ec82400674dcfaa5f3', 'Jatt Life vodka', 'stock-11f0cff90a91a2ec82400674dcfaa5f3', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 5899, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddea8d691a70217aa93cc65', 'stock-11f0d0fbdddea8d691a70217aa93cc65', 'SIERRA TEQUILA TROP CHLLI700ML', 'stock-11f0d0fbdddea8d691a70217aa93cc65', 'Tequila', 'Imported owner stock list', NULL, 'Single unit', 4399, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f126946182bca2ac5906360860a637', 'stock-11f126946182bca2ac5906360860a637', 'single malt 3 yr old whisky', 'stock-11f126946182bca2ac5906360860a637', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 3499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ed1fbca851688c330a17a67d8269', 'stock-11f0ed1fbca851688c330a17a67d8269', 'VOK CURACAO BLUE 500ML', 'stock-11f0ed1fbca851688c330a17a67d8269', 'Other', 'Imported owner stock list', NULL, 'Single unit · 500mL', 3499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1595a7ece9de69d390ac186fc166d', 'stock-11f1595a7ece9de69d390ac186fc166d', 'PENFOLDS K/HILL SHZ CAB 750ML', 'stock-11f1595a7ece9de69d390ac186fc166d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddd43f6af830217aa93cc65', 'stock-11f0d0fbdddd43f6af830217aa93cc65', 'J/DANIEL AMER & NS COLA 250ML', 'stock-11f0d0fbdddd43f6af830217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 250mL', 899, 19, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e7a99d87ddd8aae002759fdc33f5', 'stock-11f0e7a99d87ddd8aae002759fdc33f5', 'GLENFIDDICH SOLERA 15YO 700ML', 'stock-11f0e7a99d87ddd8aae002759fdc33f5', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 16999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f5d2604c8054adef0682167c54a3', 'stock-11f0f5d2604c8054adef0682167c54a3', 'MEUKOW VS COGNAC 700ML', 'stock-11f0f5d2604c8054adef0682167c54a3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ef89d0bfe0c8ab2702e63fd03243', 'stock-11f0ef89d0bfe0c8ab2702e63fd03243', 'Royal Challenge 1L', 'stock-11f0ef89d0bfe0c8ab2702e63fd03243', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1L', 8499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f148f32c9524eab6190a0370a541b1', 'stock-11f148f32c9524eab6190a0370a541b1', 'BAVARIA PREM BEER BTL 660ML', 'stock-11f148f32c9524eab6190a0370a541b1', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 660mL', 799, 21, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17658a60f94f8b8e10a49b8994a81', 'stock-11f17658a60f94f8b8e10a49b8994a81', 'BROOKVALE UNION PINE/COCONUT Cans 330ML', 'stock-11f17658a60f94f8b8e10a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 699, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1853a3ab2469cb765029f3a5e66c1', 'stock-11f1853a3ab2469cb765029f3a5e66c1', 'CRUISER SF P/APPL 4.6% 275ML', 'stock-11f1853a3ab2469cb765029f3a5e66c1', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 275mL', 699, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ef868cff0e2ab2420a514d283cb9', 'stock-11f0ef868cff0e2ab2420a514d283cb9', 'Aristocrat Premium', 'stock-11f0ef868cff0e2ab2420a514d283cb9', 'Other', 'Imported owner stock list', NULL, 'Single unit', 5499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff1b8eb47c49bc202824e01c829', 'stock-11f0cff1b8eb47c49bc202824e01c829', 'BACARDI CARTA BLANCA 700ML', 'stock-11f0cff1b8eb47c49bc202824e01c829', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11deb385ffb98a1690a48b3e5cfa1', 'stock-11f11deb385ffb98a1690a48b3e5cfa1', 'CASA SPIRITS REPOS AGAVE 700ML', 'stock-11f11deb385ffb98a1690a48b3e5cfa1', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1062fe6b19ec895c602ef9b1a7dc9', 'stock-11f1062fe6b19ec895c602ef9b1a7dc9', 'Gantous & Abou Raad Arak 540ml', 'stock-11f1062fe6b19ec895c602ef9b1a7dc9', 'Other', 'Imported owner stock list', NULL, 'Single unit · 540mL', 5499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070d1c88ac9e0aa8d0f113bf', 'stock-11f105e5070d1c88ac9e0aa8d0f113bf', 'KIRIN HYOKETSU VAR 10PK C330ML', 'stock-11f105e5070d1c88ac9e0aa8d0f113bf', 'Premix', 'Imported owner stock list', NULL, 'Single unit', 5499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ba6dfd7bde4af2d0653b23d3665', 'stock-11f11ba6dfd7bde4af2d0653b23d3665', 'LARK SYMPHONY NO.1 WHISKY500ML', 'stock-11f11ba6dfd7bde4af2d0653b23d3665', 'Other', 'Imported owner stock list', NULL, 'Single unit', 16299, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb7c7842b70a3ec02356471c905', 'stock-11f0dcb7c7842b70a3ec02356471c905', 'OYSTER BAY SAUV BLANC 750ML', 'stock-11f0dcb7c7842b70a3ec02356471c905', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2299, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f138448f75487097800af4cd5524a3', 'stock-11f138448f75487097800af4cd5524a3', 'EAGLE RIDGE ALC COLA 200ML', 'stock-11f138448f75487097800af4cd5524a3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 200mL', 699, 23, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f155a92b2bd4bab27a026d5f5a2c37', 'stock-11f155a92b2bd4bab27a026d5f5a2c37', '1800 SILVER TEQUILA 700ML', 'stock-11f155a92b2bd4bab27a026d5f5a2c37', 'Tequila', 'Imported owner stock list', '/catalogue/stock/1800-blanco.jpg', 'Single unit · 700mL', 7999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ff1b073dc4da8b0102754543bc91', 'stock-11f0ff1b073dc4da8b0102754543bc91', 'AMRUT RAJA IGALA 700ml', 'stock-11f0ff1b073dc4da8b0102754543bc91', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd806a2b3da0217aa93cc65', 'stock-11f0d0fbddd806a2b3da0217aa93cc65', 'BELENA SANGIOVESE 750ML', 'stock-11f0d0fbddd806a2b3da0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f751c9c7fda88c2d02ef0d26874f', 'stock-11f0f751c9c7fda88c2d02ef0d26874f', 'CAN CLUB&DRY ZERO 10PK 375ML', 'stock-11f0f751c9c7fda88c2d02ef0d26874f', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit · 375mL', 5300, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cfeb30cf9e4081ae02824e01c829', 'stock-11f0cfeb30cf9e4081ae02824e01c829', 'FIREBALL CINNAMON WHISKY 700ML', 'stock-11f0cfeb30cf9e4081ae02824e01c829', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5200, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd93c7abd3a0217aa93cc65', 'stock-11f0d0fbddd93c7abd3a0217aa93cc65', 'BACARDI COCONUT 27% 700ML', 'stock-11f0d0fbddd93c7abd3a0217aa93cc65', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5199, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd21f08a4750217aa93cc65', 'stock-11f0d0fbddd21f08a4750217aa93cc65', 'GORDONS DRY GIN 37% 700ML', 'stock-11f0d0fbddd21f08a4750217aa93cc65', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5199, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1642cb00da6f483450a8473b78f27', 'stock-11f1642cb00da6f483450a8473b78f27', 'DE BORTOLI W/MAKER S/BLC 750ML', 'stock-11f1642cb00da6f483450a8473b78f27', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f177d407e90e502e1e74299a3', 'stock-11f10c3f177d407e90e502e1e74299a3', 'YELLOWTAIL MOSCATO 750ML', 'stock-11f10c3f177d407e90e502e1e74299a3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd51ef6aaa60217aa93cc65', 'stock-11f0d0fbddd51ef6aaa60217aa93cc65', 'HOUGHTON SHIRAZ 750ML', 'stock-11f0d0fbddd51ef6aaa60217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1399, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddda8a3094040217aa93cc65', 'stock-11f0d0fbddda8a3094040217aa93cc65', 'CRUISER ZESTY LEMON-LIME 4.6% 275ML', 'stock-11f0d0fbddda8a3094040217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 275mL', 699, 22, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd255d6beda0217aa93cc65', 'stock-11f0d0fbddd255d6beda0217aa93cc65', 'BROWN BROS DOLCETTO 750ML', 'stock-11f0d0fbddd255d6beda0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1699, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3f792a6af0217aa93cc65', 'stock-11f0d0fbddd3f792a6af0217aa93cc65', 'DIVAS VKAT 700ML', 'stock-11f0d0fbddd3f792a6af0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 1699, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02ee49aa2ff06a73aac0f0d', 'stock-11f0e06bf02ee49aa2ff06a73aac0f0d', 'FLINDERS BAY ROSE LS 750ML', 'stock-11f0e06bf02ee49aa2ff06a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1699, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ba4ea4fbc748178022fecc2707f', 'stock-11f11ba4ea4fbc748178022fecc2707f', 'Lark classic cask', 'stock-11f11ba4ea4fbc748178022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit', 7499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b86f8dc5bcadf70a18399e6dd5', 'stock-11f0d5b86f8dc5bcadf70a18399e6dd5', 'CASA SPIRITS SILV TEQUILA700ML', 'stock-11f0d5b86f8dc5bcadf70a18399e6dd5', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb7d8e421fe83a50a2c8c6b1a25', 'stock-11f0dcb7d8e421fe83a50a2c8c6b1a25', 'OYSTER BAY CUVEE BRUT SPARKLING 750ML', 'stock-11f0dcb7d8e421fe83a50a2c8c6b1a25', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb795e09810b6f806333a4725f3', 'stock-11f0dcb795e09810b6f806333a4725f3', 'OYSTER BAY PINOT NOIR 750ML', 'stock-11f0dcb795e09810b6f806333a4725f3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9dfd3a0a87d062a0ca9a125', 'stock-11f1172eb9dfd3a0a87d062a0ca9a125', 'PENFOLDS K/HILL CHARD 750ML', 'stock-11f1172eb9dfd3a0a87d062a0ca9a125', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f108b2c81df594832c0267d4c80bab', 'stock-11f108b2c81df594832c0267d4c80bab', 'Saint Hilaire wine', 'stock-11f108b2c81df594832c0267d4c80bab', 'Wine', 'Imported owner stock list', NULL, 'Single unit', 2499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e5413143b18486740a5033c22e31', 'stock-11f0e5413143b18486740a5033c22e31', 'WET PUSSY 700ML', 'stock-11f0e5413143b18486740a5033c22e31', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 2499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02eec60be0806a73aac0f0d', 'stock-11f0e06bf02eec60be0806a73aac0f0d', 'FLINDERS BAY CAB SAUV LS 750ML', 'stock-11f0e06bf02eec60be0806a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddde583689040217aa93cc65', 'stock-11f0d0fbddde583689040217aa93cc65', 'CHINGU TROPICAL 360ML', 'stock-11f0d0fbddde583689040217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 360mL', 999, 15, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd26cbaba740217aa93cc65', 'stock-11f0d0fbddd26cbaba740217aa93cc65', 'ST HALLETT FAITH SHIRAZ 750ML', 'stock-11f0d0fbddd26cbaba740217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2400, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02e99189f0406a73aac0f0d', 'stock-11f0e06bf02e99189f0406a73aac0f0d', 'OYSTER BAY CHARDONNAY 750ML', 'stock-11f0e06bf02e99189f0406a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2399, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb746669866b7600a2c8c6b1a25', 'stock-11f0dcb746669866b7600a2c8c6b1a25', 'OYSTER BAY CUVEE ROSE SPARKLING 750ML', 'stock-11f0dcb746669866b7600a2c8c6b1a25', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2399, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c83194b61f02433d717f57', 'stock-11f132bc12c83194b61f02433d717f57', 'SMIRNOFF ICE RSPBRY CR 375ML', 'stock-11f132bc12c83194b61f02433d717f57', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 899, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ca23e3b18bcb886022fecc2707f', 'stock-11f11ca23e3b18bcb886022fecc2707f', 'MALIBU WATERMELN LEMON 250ML', 'stock-11f11ca23e3b18bcb886022fecc2707f', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 250mL', 599, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3ff6cabf70217aa93cc65', 'stock-11f0d0fbddd3ff6cabf70217aa93cc65', 'MERCURY DRAUGHT BTL 375ML', 'stock-11f0d0fbddd3ff6cabf70217aa93cc65', 'Cider', 'Imported owner stock list', NULL, 'Single unit · 375mL', 599, 24, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97ca1c4a2c3020c4780605d', 'stock-11f0f61cf97ca1c4a2c3020c4780605d', 'W/BLASS RED LBL MOSC PNK 750ML', 'stock-11f0f61cf97ca1c4a2c3020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff089b6e7989ec70674dcfaa5f3', 'stock-11f0cff089b6e7989ec70674dcfaa5f3', 'SOUTHERN COMFORT 700ML', 'stock-11f0cff089b6e7989ec70674dcfaa5f3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4699, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f2b7d477e14e8b25020c4780605d', 'stock-11f0f2b7d477e14e8b25020c4780605d', 'chivas Regal Extra', 'stock-11f0f2b7d477e14e8b25020c4780605d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 6999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd7fec894c40217aa93cc65', 'stock-11f0d0fbddd7fec894c40217aa93cc65', 'BELENA PINOT GRIGIO 750ML', 'stock-11f0d0fbddd7fec894c40217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1595a7ecf45e8b7070ac186fc166d', 'stock-11f1595a7ecf45e8b7070ac186fc166d', 'Canadian Club Whisky 200ml', 'stock-11f1595a7ecf45e8b7070ac186fc166d', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 200mL', 1999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d671c77e7d6689eb06a76708ff1b', 'stock-11f0d671c77e7d6689eb06a76708ff1b', 'GLENFIDDICH MALT12Y MIN40%50ML', 'stock-11f0d671c77e7d6689eb06a76708ff1b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 50mL', 1399, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02fb7a8bdfb06a73aac0f0d', 'stock-11f0e06bf02fb7a8bdfb06a73aac0f0d', 'BEST OF BIN ENDS SHIRAZ 750ML', 'stock-11f0e06bf02fb7a8bdfb06a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ed213c332402a88c0a104cb0d02b', 'stock-11f0ed213c332402a88c0a104cb0d02b', 'DON JULIO REPOSADO TEQUILA 700ML', 'stock-11f0ed213c332402a88c0a104cb0d02b', 'Tequila', 'Imported owner stock list', NULL, 'Single unit · 700mL', 13499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d3f760fb836c994c0afadfb18179', 'stock-11f0d3f760fb836c994c0afadfb18179', 'BAILEYS IRISH CRM 700ML', 'stock-11f0d3f760fb836c994c0afadfb18179', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1642cb00cb1f493220a8473b78f27', 'stock-11f1642cb00cb1f493220a8473b78f27', 'JACOBS CK CHARDONNAY 750ML', 'stock-11f1642cb00cb1f493220a8473b78f27', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddca4dc93130217aa93cc65', 'stock-11f0d0fbdddca4dc93130217aa93cc65', 'DIVAS RETRO RUBY RASP 330ML', 'stock-11f0d0fbdddca4dc93130217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 499, 27, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddddf17ab3640217aa93cc65', 'stock-11f0d0fbddddf17ab3640217aa93cc65', 'BROOKVALE VDK LEM SQ 330ML', 'stock-11f0d0fbddddf17ab3640217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 330mL', 699, 19, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd98112ac940217aa93cc65', 'stock-11f0d0fbddd98112ac940217aa93cc65', 'WILD TURKEY & COLA 101 6.5% 10PK 375ML', 'stock-11f0d0fbddd98112ac940217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 6500, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1325fe51fff80aa560a8e00ba03d7', 'stock-11f1325fe51fff80aa560a8e00ba03d7', 'REMY MARTIN COG VSOP 700ML', 'stock-11f1325fe51fff80aa560a8e00ba03d7', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 12999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff98b2d98fc8cfb0a40587cc18f', 'stock-11f0cff98b2d98fc8cfb0a40587cc18f', 'Magic moments Green apple', 'stock-11f0cff98b2d98fc8cfb0a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf915321376a065020c4780605d', 'stock-11f0fcf915321376a065020c4780605d', 'ROKU GIN 43% 700ML', 'stock-11f0fcf915321376a065020c4780605d', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17658a60f52d6a5360a49b8994a81', 'stock-11f17658a60f52d6a5360a49b8994a81', 'DB W/MAKER SELECT MERLOT 750ML', 'stock-11f17658a60f52d6a5360a49b8994a81', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17658a60e8e8c810f0a49b8994a81', 'stock-11f17658a60e8e8c810f0a49b8994a81', 'DE BORTOLI W/MAKER C/SAV 750ML', 'stock-11f17658a60e8e8c810f0a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1222278000dde8eea0ab5b3601ec3', 'stock-11f1222278000dde8eea0ab5b3601ec3', 'CAN CLUB & DRY BTL 330ML', 'stock-11f1222278000dde8eea0ab5b3601ec3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 799, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f169b96e399a5ca96b06381be24d5d', 'stock-11f169b96e399a5ca96b06381be24d5d', 'HARD RATED LEM MGO ZERO 375ML', 'stock-11f169b96e399a5ca96b06381be24d5d', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit · 375mL', 799, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6715a531d8c89a10a6bd93cc895', 'stock-11f0d6715a531d8c89a10a6bd93cc895', 'J/DANIEL BLACK LABEL 200ML', 'stock-11f0d6715a531d8c89a10a6bd93cc895', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ecbfb52a0c98b165063eea1426f9', 'stock-11f0ecbfb52a0c98b165063eea1426f9', 'PAWN STAR 700ML', 'stock-11f0ecbfb52a0c98b165063eea1426f9', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 2499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17e88d4d84040a30b02e0affa22cd', 'stock-11f17e88d4d84040a30b02e0affa22cd', 'BALVENIE MALT 12YO 700ML', 'stock-11f17e88d4d84040a30b02e0affa22cd', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 11999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffb58a22720ac000a40587cc18f', 'stock-11f0cffb58a22720ac000a40587cc18f', '8 PM Fire', 'stock-11f0cffb58a22720ac000a40587cc18f', 'Other', 'Imported owner stock list', NULL, 'Single unit', 5999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12d2f5c5e0302a1ab0a51ae7bdf19', 'stock-11f12d2f5c5e0302a1ab0a51ae7bdf19', 'WOODSTOCK&COLA 10% 10PK 200ML', 'stock-11f12d2f5c5e0302a1ab0a51ae7bdf19', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 200mL', 5999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15ee73ec573d68e3d0a56f59fd215', 'stock-11f15ee73ec573d68e3d0a56f59fd215', 'VOK TRIPLE SEC 500ML', 'stock-11f15ee73ec573d68e3d0a56f59fd215', 'Other', 'Imported owner stock list', NULL, 'Single unit · 500mL', 2999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02f2f368ec306a73aac0f0d', 'stock-11f0e06bf02f2f368ec306a73aac0f0d', 'OYSTER BAY ROSE 750ML', 'stock-11f0e06bf02f2f368ec306a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2399, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9e062ca9e24062a0ca9a125', 'stock-11f1172eb9e062ca9e24062a0ca9a125', 'PENFOLDS K/HILL CAB SAV 750ML', 'stock-11f1172eb9e062ca9e24062a0ca9a125', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1e7fc50084e10685313f190f', 'stock-11f0e9de1e7fc50084e10685313f190f', 'FRANZINI PROSECCO 750ML', 'stock-11f0e9de1e7fc50084e10685313f190f', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9dfdf4ea811062a0ca9a125', 'stock-11f1172eb9dfdf4ea811062a0ca9a125', 'JACOBS CK C/HARV SAV BLC 750ML', 'stock-11f1172eb9dfdf4ea811062a0ca9a125', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02fae6686bd06a73aac0f0d', 'stock-11f0e06bf02fae6686bd06a73aac0f0d', 'BEST OF BIN ENDS S/BLANC 750ML', 'stock-11f0e06bf02fae6686bd06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1013662f84b2aa7720a2ca96c3541', 'stock-11f1013662f84b2aa7720a2ca96c3541', 'HARDYS RR CHARDONNAY 1L', 'stock-11f1013662f84b2aa7720a2ca96c3541', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 1L', 999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f181483cb53f6c98d102af50f1f15f', 'stock-11f181483cb53f6c98d102af50f1f15f', 'PENFOLDS K/HILL CHARD 375ML', 'stock-11f181483cb53f6c98d102af50f1f15f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 375mL', 999, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1279e6bc5707880af06360860a637', 'stock-11f1279e6bc5707880af06360860a637', 'BAD MONKEY STRONG BEER 500ML', 'stock-11f1279e6bc5707880af06360860a637', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 500mL', 599, 20, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddb82b4978a0217aa93cc65', 'stock-11f0d0fbdddb82b4978a0217aa93cc65', 'CRUISER JUICY WATERMELON 4.6% 275ML', 'stock-11f0d0fbdddb82b4978a0217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 275mL', 599, 20, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070cd91ca46c0aa8d0f113bf', 'stock-11f105e5070cd91ca46c0aa8d0f113bf', 'MALIBU AND COLA RTD 250ML', 'stock-11f105e5070cd91ca46c0aa8d0f113bf', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 250mL', 599, 20, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f177b203c81c102e1e74299a3', 'stock-11f10c3f177b203c81c102e1e74299a3', 'COORS BTL 4.2% 330ML', 'stock-11f10c3f177b203c81c102e1e74299a3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 399, 30, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11deb04482f4c8ec302362d5a34ed', 'stock-11f11deb04482f4c8ec302362d5a34ed', 'Rampur Asava gift pack', 'stock-11f11deb04482f4c8ec302362d5a34ed', 'Other', 'Imported owner stock list', NULL, 'Single unit', 11900, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1e7e6f0cbf530685313f190f', 'stock-11f0e9de1e7e6f0cbf530685313f190f', 'BROWN BROS MOSCATO ROSA 750ML', 'stock-11f0e9de1e7e6f0cbf530685313f190f', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1699, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddef804ba9c0217aa93cc65', 'stock-11f0d0fbdddef804ba9c0217aa93cc65', 'HARD RATED Z/S LEMLME10PK375ML 4.5%', 'stock-11f0d0fbdddef804ba9c0217aa93cc65', 'Premix', 'Imported owner stock list', NULL, 'Single unit', 699, 17, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffdaafdb410a39c06d464089785', 'stock-11f0cffdaafdb410a39c06d464089785', 'JAAN CANADIAN WHISKEY 750ML', 'stock-11f0cffdaafdb410a39c06d464089785', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 750mL', 5899, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffbe5a12edcb3ac06f1f9fab3ed', 'stock-11f0cffbe5a12edcb3ac06f1f9fab3ed', 'Madirraa Saunf', 'stock-11f0cffbe5a12edcb3ac06f1f9fab3ed', 'Other', 'Imported owner stock list', NULL, 'Single unit', 5899, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1e7cdd6898850685313f190f', 'stock-11f0e9de1e7cdd6898850685313f190f', 'DE BORTOLI S/HIL MOSCATO 750ML', 'stock-11f0e9de1e7cdd6898850685313f190f', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 899, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c80b749a7002433d717f57', 'stock-11f132bc12c80b749a7002433d717f57', 'YELLOWTAIL PROSECCO 750ML', 'stock-11f132bc12c80b749a7002433d717f57', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1899, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ca23e3a9e1e8af6022fecc2707f', 'stock-11f11ca23e3a9e1e8af6022fecc2707f', 'FIREBALL & APPLE 355ML 6.6%', 'stock-11f11ca23e3a9e1e8af6022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 355mL', 699, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f10c3f177bc2f8a4a502e1e74299a3', 'stock-11f10c3f177bc2f8a4a502e1e74299a3', 'JACOBS CK CAB MERLOT 750ML', 'stock-11f10c3f177bc2f8a4a502e1e74299a3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1000, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e5f58221fe089307024b41375fa5', 'stock-11f0e5f58221fe089307024b41375fa5', 'MARTELL BLUE SWIFT 700ML', 'stock-11f0e5f58221fe089307024b41375fa5', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 10999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd96dc6b3780217aa93cc65', 'stock-11f0d0fbddd96dc6b3780217aa93cc65', 'GALLIANO WHT SAMBUCA 30% 700ML', 'stock-11f0d0fbddd96dc6b3780217aa93cc65', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e53ead67f71e92470af85a8e0f27', 'stock-11f0e53ead67f71e92470af85a8e0f27', 'SMIRNOFF LEMON FREEZE 33%700ML', 'stock-11f0e53ead67f71e92470af85a8e0f27', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02ef3ccb1fa06a73aac0f0d', 'stock-11f0e06bf02ef3ccb1fa06a73aac0f0d', 'BEST BIN ENDS C/SAUV L/S 750ML', 'stock-11f0e06bf02ef3ccb1fa06a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02fc73ebcab06a73aac0f0d', 'stock-11f0e06bf02fc73ebcab06a73aac0f0d', 'BEST OF BIN ENDS SSB 750ML', 'stock-11f0e06bf02fc73ebcab06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02f1fd2906406a73aac0f0d', 'stock-11f0e06bf02f1fd2906406a73aac0f0d', 'INCLINATION SAV BLNC L/S 750ML', 'stock-11f0e06bf02f1fd2906406a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd55c86a5240217aa93cc65', 'stock-11f0d0fbddd55c86a5240217aa93cc65', 'CHANDON BRUT NV 750ML', 'stock-11f0d0fbddd55c86a5240217aa93cc65', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 3599, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f169b96e398bc0b95d06381be24d5d', 'stock-11f169b96e398bc0b95d06381be24d5d', 'MULLET HARD SHIRAZ 750ML', 'stock-11f169b96e398bc0b95d06381be24d5d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1799, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf046cc22a7bf0adfd189d115', 'stock-11f0e06bf046cc22a7bf0adfd189d115', 'BEGIN GIN MINS 50ML', 'stock-11f0e06bf046cc22a7bf0adfd189d115', 'Gin', 'Imported owner stock list', NULL, 'Single unit · 50mL', 899, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f170e0e21b57f2852c02ad914c702b', 'stock-11f170e0e21b57f2852c02ad914c702b', 'GUINNESS EXT STOUT NEW 375ML', 'stock-11f170e0e21b57f2852c02ad914c702b', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 375mL', 599, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13a067d0e42ccb29e06718276c393', 'stock-11f13a067d0e42ccb29e06718276c393', 'JACK DANIELS BOURBON 1136ML 1136ML', 'stock-11f13a067d0e42ccb29e06718276c393', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 1136mL', 10499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1013662f8016093580a2ca96c3541', 'stock-11f1013662f8016093580a2ca96c3541', 'MCW HANWD 10YO GR TAWNY 750ML', 'stock-11f1013662f8016093580a2ca96c3541', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 3499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd6ece088950217aa93cc65', 'stock-11f0d0fbddd6ece088950217aa93cc65', '19 CRIMES PINOT NOIR 750ML', 'stock-11f0d0fbddd6ece088950217aa93cc65', 'Wine', 'Imported owner stock list', '/catalogue/stock/19-crimes-pinot-noir.png', 'Single unit · 750mL', 1499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1222277fee5bcbc8f0ab5b3601ec3', 'stock-11f1222277fee5bcbc8f0ab5b3601ec3', 'JACOBS CK RES SHIRAZ 750ML', 'stock-11f1222277fee5bcbc8f0ab5b3601ec3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2654490330217aa93cc65', 'stock-11f0d0fbddd2654490330217aa93cc65', 'WINESMITHS PREM SEL SAUV/BL 2L', 'stock-11f0d0fbddd2654490330217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 2L', 1299, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12222780053caa73a0ab5b3601ec3', 'stock-11f12222780053caa73a0ab5b3601ec3', 'LITTLE FAT LAMB ZES ORANGE 10P Cans 375ML', 'stock-11f12222780053caa73a0ab5b3601ec3', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 375mL', 399, 26, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f14394cdad64f080f90aa2301186a5', 'stock-11f14394cdad64f080f90aa2301186a5', 'SMIRNOFF VODKA RED 375ML', 'stock-11f14394cdad64f080f90aa2301186a5', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 375mL', 3399, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f176ab12d408b086030a669132381d', 'stock-11f176ab12d408b086030a669132381d', 'CAMIKARA CASK AGED RUM 700ML', 'stock-11f176ab12d408b086030a669132381d', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 9999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12d2f5c5e177a88d50a51ae7bdf19', 'stock-11f12d2f5c5e177a88d50a51ae7bdf19', 'GOOD TIDES SELTZ MIX 10PK 330ML', 'stock-11f12d2f5c5e177a88d50a51ae7bdf19', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 4999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf9153209ee80fd020c4780605d', 'stock-11f0fcf9153209ee80fd020c4780605d', 'BROWN BROS PROSEC SPRTZ 750ML', 'stock-11f0fcf9153209ee80fd020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2750c8ce40217aa93cc65', 'stock-11f0d0fbddd2750c8ce40217aa93cc65', 'PETER LEHM PORT SHIRAZ 750ML', 'stock-11f0d0fbddd2750c8ce40217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13af620f4815ea4e206d264d7c5cf', 'stock-11f13af620f4815ea4e206d264d7c5cf', 'Charlotte''s Inlet A/H Sauvignon Blanc 750ml', 'stock-11f13af620f4815ea4e206d264d7c5cf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f1101c4f7a6c9b6002d9d3257d91', 'stock-11f0f1101c4f7a6c9b6002d9d3257d91', 'Woodford Reserve', 'stock-11f0f1101c4f7a6c9b6002d9d3257d91', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit', 9899, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d17b5dfcccd0b09206cce9ac00ad', 'stock-11f0d17b5dfcccd0b09206cce9ac00ad', 'MCGUIGAN BLK LBL MERLOT 750ML', 'stock-11f0d17b5dfcccd0b09206cce9ac00ad', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1200, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1433858a4f68e9c1406a85b6f6d41', 'stock-11f1433858a4f68e9c1406a85b6f6d41', 'DEVILS LAIR 5TH LEG SHZ 750ML', 'stock-11f1433858a4f68e9c1406a85b6f6d41', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1599, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15965e33c4462a61d0219550eeb73', 'stock-11f15965e33c4462a61d0219550eeb73', 'Clean skin Cab merlot', 'stock-11f15965e33c4462a61d0219550eeb73', 'Wine', 'Imported owner stock list', NULL, 'Single unit', 799, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1013662f9ff748eb30a2ca96c3541', 'stock-11f1013662f9ff748eb30a2ca96c3541', 'CASA HARD RASPBERRY 375ML', 'stock-11f1013662f9ff748eb30a2ca96c3541', 'Other', 'Imported owner stock list', NULL, 'Single unit · 375mL', 599, 16, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a2cb90949b06a76708ff1b', 'stock-11f0d6e917a2cb90949b06a76708ff1b', '3 TALES MARLB SAUV BLANC 750ML', 'stock-11f0d6e917a2cb90949b06a76708ff1b', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1899, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97c36c69bf3020c4780605d', 'stock-11f0f61cf97c36c69bf3020c4780605d', 'BROWN BROS MOSC SPK ROSA 750ML', 'stock-11f0f61cf97c36c69bf3020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1899, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a17ddaba3106a76708ff1b', 'stock-11f0d6e917a17ddaba3106a76708ff1b', 'LIND E/HARV SHIRAZ 750ML', 'stock-11f0d6e917a17ddaba3106a76708ff1b', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1899, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1013662f99deaa2f60a2ca96c3541', 'stock-11f1013662f99deaa2f60a2ca96c3541', 'ZONZO NV LIMONCELLO SPRTZ750ML', 'stock-11f1013662f99deaa2f60a2ca96c3541', 'Other', 'Imported owner stock list', NULL, 'Single unit', 1899, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97dcb6c83aa020c4780605d', 'stock-11f0f61cf97dcb6c83aa020c4780605d', 'SMITHS CRINKL CHICKEN 90GM', 'stock-11f0f61cf97dcb6c83aa020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit', 499, 19, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ca23e3a8e1abfc1022fecc2707f', 'stock-11f11ca23e3a8e1abfc1022fecc2707f', 'BANROCK STN MOSCATO PINK 1L', 'stock-11f11ca23e3a8e1abfc1022fecc2707f', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 1L', 1299, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97d5f108251020c4780605d', 'stock-11f0f61cf97d5f108251020c4780605d', '28 SHOTS SHOT BUCKET 30ML', 'stock-11f0f61cf97d5f108251020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 30mL', 4499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5b6c539672096ea0a18399e6dd5', 'stock-11f0d5b6c539672096ea0a18399e6dd5', 'MALIBU 700ML', 'stock-11f0d5b6c539672096ea0a18399e6dd5', 'Rum', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd313229e4a0217aa93cc65', 'stock-11f0d0fbddd313229e4a0217aa93cc65', 'DE BORTOLI PREM SSB CSK 4L', 'stock-11f0d0fbddd313229e4a0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1799, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17bcc499bff8092630a49b8994a81', 'stock-11f17bcc499bff8092630a49b8994a81', 'DIVAS GLADES BLUE CITRUS 700ML', 'stock-11f17bcc499bff8092630a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 1799, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02e10ceb49806a73aac0f0d', 'stock-11f0e06bf02e10ceb49806a73aac0f0d', 'DEVILS LAIR 5TH LEG WHT 750ML', 'stock-11f0e06bf02e10ceb49806a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2ba08a9180217aa93cc65', 'stock-11f0d0fbddd2ba08a9180217aa93cc65', 'G/BURGE GB43 MERLOT 750ML', 'stock-11f0d0fbddd2ba08a9180217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1595a7ece5d36a7d40ac186fc166d', 'stock-11f1595a7ece5d36a7d40ac186fc166d', 'JACOBS CK SPK MOSC WHITE 750ML', 'stock-11f1595a7ece5d36a7d40ac186fc166d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02f26eebb5a06a73aac0f0d', 'stock-11f0e06bf02f26eebb5a06a73aac0f0d', 'BEST BIN ENDS P/GRIG L/S 750ML', 'stock-11f0e06bf02f26eebb5a06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13c6abf102c10ba6102df18ceabcb', 'stock-11f13c6abf102c10ba6102df18ceabcb', 'Betty & Max Chardonny 750 ml', 'stock-11f13c6abf102c10ba6102df18ceabcb', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddde1cf4a1fa0217aa93cc65', 'stock-11f0d0fbddde1cf4a1fa0217aa93cc65', 'CHINGU PEACH 360ML', 'stock-11f0d0fbddde1cf4a1fa0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 360mL', 999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17658a60ecf14bfd10a49b8994a81', 'stock-11f17658a60ecf14bfd10a49b8994a81', 'DE BORTOLI W/MAKER SHZ 750ML', 'stock-11f17658a60ecf14bfd10a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f14398ec151b0091ad02117d90eee9', 'stock-11f14398ec151b0091ad02117d90eee9', 'Virginia black American whiskey', 'stock-11f14398ec151b0091ad02117d90eee9', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 8499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f123c5893b9088967e06360860a637', 'stock-11f123c5893b9088967e06360860a637', 'BROWN BROS CIENNA 750ML', 'stock-11f123c5893b9088967e06360860a637', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1699, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d5bcbac316fabc5f0a18399e6dd5', 'stock-11f0d5bcbac316fabc5f0a18399e6dd5', 'Rakija Balance 700ml', 'stock-11f0d5bcbac316fabc5f0a18399e6dd5', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 8399, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddc662aa2f90217aa93cc65', 'stock-11f0d0fbdddc662aa2f90217aa93cc65', 'HARVEST LANE TRD DRY RED LS 4L', 'stock-11f0d0fbdddc662aa2f90217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1199, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17b2f17aedc9cb2490622164a04bd', 'stock-11f17b2f17aedc9cb2490622164a04bd', 'Mango juice', 'stock-11f17b2f17aedc9cb2490622164a04bd', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit', 399, 21, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1f62f84896b802b26960087b', 'stock-11f0e9de1f62f84896b802b26960087b', 'RR DELI CHIP S/CRM&CHILI 90GM', 'stock-11f0e9de1f62f84896b802b26960087b', 'Other', 'Imported owner stock list', NULL, 'Single unit', 449, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c6e5d29a8d02433d717f57', 'stock-11f132bc12c6e5d29a8d02433d717f57', 'DE BORTOLI K/VLY PROSCCO750ML', 'stock-11f132bc12c6e5d29a8d02433d717f57', 'Other', 'Imported owner stock list', NULL, 'Single unit', 1999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c8190ca55602433d717f57', 'stock-11f132bc12c8190ca55602433d717f57', 'JACOBS CK RES PROSECCO 750ML', 'stock-11f132bc12c8190ca55602433d717f57', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11decfd0b2b42925702674462c5ad', 'stock-11f11decfd0b2b42925702674462c5ad', 'Martell cognac glasses', 'stock-11f11decfd0b2b42925702674462c5ad', 'Other', 'Imported owner stock list', NULL, 'Single unit', 1999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f123c5893c13468a7b06360860a637', 'stock-11f123c5893c13468a7b06360860a637', 'MONIN BLUE CURACAO 700ML', 'stock-11f123c5893c13468a7b06360860a637', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 1999, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17658a60ed716b4280a49b8994a81', 'stock-11f17658a60ed716b4280a49b8994a81', 'DE BORTOLI W/MAKER CHD 750ML', 'stock-11f17658a60ed716b4280a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02e1caebc3806a73aac0f0d', 'stock-11f0e06bf02e1caebc3806a73aac0f0d', 'HARDYS RR SHIRAZ 1L', 'stock-11f0e06bf02e1caebc3806a73aac0f0d', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 1L', 999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f123c5893b076ca01006360860a637', 'stock-11f123c5893b076ca01006360860a637', 'WILD TURKEY RARE & COLA 8% BTL 320ML', 'stock-11f123c5893b076ca01006360860a637', 'Premix', 'Imported owner stock list', NULL, 'Single unit · 320mL', 999, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb350f6d484b0bc02356471c905', 'stock-11f0dcb350f6d484b0bc02356471c905', 'J/DANIEL BLACK LABEL MINS', 'stock-11f0dcb350f6d484b0bc02356471c905', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit', 799, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3d5be981b0217aa93cc65', 'stock-11f0d0fbddd3d5be981b0217aa93cc65', 'WINESMITHS PREM SEL MERLOT 2L', 'stock-11f0d0fbddd3d5be981b0217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 2L', 1299, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a2db94893206a76708ff1b', 'stock-11f0d6e917a2db94893206a76708ff1b', 'YALUMBA PREM SEL P/GRIG CSK 2L', 'stock-11f0d6e917a2db94893206a76708ff1b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 2L', 1299, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1049fc5ce9850a4450aa7fb853b71', 'stock-11f1049fc5ce9850a4450aa7fb853b71', 'BROWN BROS MOSC ROSA SPK 200ML', 'stock-11f1049fc5ce9850a4450aa7fb853b71', 'Other', 'Imported owner stock list', NULL, 'Single unit · 200mL', 649, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f1e1f8c594be9bb50a1456fb413b', 'stock-11f0f1e1f8c594be9bb50a1456fb413b', 'FIREBALL CINN WHISKY MINI 50ML', 'stock-11f0f1e1f8c594be9bb50a1456fb413b', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 50mL', 599, 13, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd7d24abada0217aa93cc65', 'stock-11f0d0fbddd7d24abada0217aa93cc65', 'BROKENWOOD M/VALE SHIRAZ 750ML', 'stock-11f0d0fbddd7d24abada0217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1899, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f104a1a010f0e8bc1d0a42d7f68c41', 'stock-11f104a1a010f0e8bc1d0a42d7f68c41', 'CHIVAS EXTRA 700ML Red', 'stock-11f104a1a010f0e8bc1d0a42d7f68c41', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 7499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f104a107c013aaa2e60a42d7f68c41', 'stock-11f104a107c013aaa2e60a42d7f68c41', 'Chivas Tropical & Rich', 'stock-11f104a107c013aaa2e60a42d7f68c41', 'Whisky', 'Imported owner stock list', NULL, 'Single unit', 7499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e5401644829cbf4206c9e543d6dd', 'stock-11f0e5401644829cbf4206c9e543d6dd', 'JACOBS CK SPK MOSC ROSE 750ML', 'stock-11f0e5401644829cbf4206c9e543d6dd', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e21a713eead0a1db0ae93dcd8c23', 'stock-11f0e21a713eead0a1db0ae93dcd8c23', 'MASTER OF MIXES PINA COLADA 1L', 'stock-11f0e21a713eead0a1db0ae93dcd8c23', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1L', 1499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13db82e5b99948c180a9a61b55857', 'stock-11f13db82e5b99948c180a9a61b55857', 'WARBURN PREM CHARD CSK 4L', 'stock-11f13db82e5b99948c180a9a61b55857', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1799, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd594f8a2090217aa93cc65', 'stock-11f0d0fbddd594f8a2090217aa93cc65', 'HARVEST LANE CLASS WHITE LS 4L', 'stock-11f0d0fbddd594f8a2090217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1199, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0fcf9152d6d8a8a18020c4780605d', 'stock-11f0fcf9152d6d8a8a18020c4780605d', 'GOLD GATE PASS POP W/MEL 750ML', 'stock-11f0fcf9152d6d8a8a18020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 899, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd7e23ab7e90217aa93cc65', 'stock-11f0d0fbddd7e23ab7e90217aa93cc65', 'STRONGBOW LOW CARB BTL 330ML', 'stock-11f0d0fbddd7e23ab7e90217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 330mL', 599, 12, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12c1a782e4a8a939a028f3ad8b743', 'stock-11f12c1a782e4a8a939a028f3ad8b743', 'DEWARS SCOTCH WHISKEY 1L', 'stock-11f12c1a782e4a8a939a028f3ad8b743', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 1L', 6999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f5d2d6bd8e86a50f06d343ddfbc5', 'stock-11f0f5d2d6bd8e86a50f06d343ddfbc5', 'METAXA BRANDY 7 STAR 700ML', 'stock-11f0f5d2d6bd8e86a50f06d343ddfbc5', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f138448f750162a7c60af4cd5524a3', 'stock-11f138448f750162a7c60af4cd5524a3', 'CHINGU BLUEBERRY 360ML', 'stock-11f138448f750162a7c60af4cd5524a3', 'Other', 'Imported owner stock list', NULL, 'Single unit · 360mL', 999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070ca22690c30aa8d0f113bf', 'stock-11f105e5070ca22690c30aa8d0f113bf', 'JACOBS CK CAB SAUVIGNON 750ML', 'stock-11f105e5070ca22690c30aa8d0f113bf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 7, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f18005c1b2a31aad7306c163b3c061', 'stock-11f18005c1b2a31aad7306c163b3c061', 'THUNDERBOLT STRONG LAGER 500ML', 'stock-11f18005c1b2a31aad7306c163b3c061', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 500mL', 699, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ecbfb527cba4b9b6063eea1426f9', 'stock-11f0ecbfb527cba4b9b6063eea1426f9', 'RR DELI CHIP SEA SALT 90GM', 'stock-11f0ecbfb527cba4b9b6063eea1426f9', 'Other', 'Imported owner stock list', NULL, 'Single unit', 499, 14, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cffc7b9b3aa4b22a02824e01c829', 'stock-11f0cffc7b9b3aa4b22a02824e01c829', 'Jugni', 'stock-11f0cffc7b9b3aa4b22a02824e01c829', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0cff96296e9cabd1a06f1f9fab3ed', 'stock-11f0cff96296e9cabd1a06f1f9fab3ed', 'Magic moments orange flavour', 'stock-11f0cff96296e9cabd1a06f1f9fab3ed', 'Other', 'Imported owner stock list', NULL, 'Single unit', 6499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17e893a8dc220a64902ed3dd5f923', 'stock-11f17e893a8dc220a64902ed3dd5f923', 'SHEEP DOG P/BUTTER WHISKEY 30% 700ML', 'stock-11f17e893a8dc220a64902ed3dd5f923', 'Whisky', 'Imported owner stock list', NULL, 'Single unit · 700mL', 6499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070ceaba80db0aa8d0f113bf', 'stock-11f105e5070ceaba80db0aa8d0f113bf', 'MCGUIGAN ZERO SAUV BLANC 750ML', 'stock-11f105e5070ceaba80db0aa8d0f113bf', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070ce394a3eb0aa8d0f113bf', 'stock-11f105e5070ce394a3eb0aa8d0f113bf', 'MCGUIGAN ZERO SHIRAZ 750ML', 'stock-11f105e5070ce394a3eb0aa8d0f113bf', 'Non-alcoholic', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd3416ca1640217aa93cc65', 'stock-11f0d0fbddd3416ca1640217aa93cc65', 'DEVILS LAIR 5TH LEG RED 750ML', 'stock-11f0d0fbddd3416ca1640217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1599, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f438914f9cd6b37606473ffb339f', 'stock-11f0f438914f9cd6b37606473ffb339f', 'BROWN BROS MOSCATO 750ML', 'stock-11f0f438914f9cd6b37606473ffb339f', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f132bc12c822b2a2b102433d717f57', 'stock-11f132bc12c822b2a2b102433d717f57', 'BROWN BROS ORIGINS PROSEC750ML', 'stock-11f132bc12c822b2a2b102433d717f57', 'Other', 'Imported owner stock list', NULL, 'Single unit', 1999, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd4fa52acdc0217aa93cc65', 'stock-11f0d0fbddd4fa52acdc0217aa93cc65', 'G/BURGE GB56 SHIRAZ 750ML', 'stock-11f0d0fbddd4fa52acdc0217aa93cc65', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02fcf7c859c06a73aac0f0d', 'stock-11f0e06bf02fcf7c859c06a73aac0f0d', 'BEST OF BIN ENDS CAB MER 750ML', 'stock-11f0e06bf02fcf7c859c06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f17bcc499cb52e8ace0a49b8994a81', 'stock-11f17bcc499cb52e8ace0a49b8994a81', 'DE BORTOLI W/MAKER P/GR 750ML', 'stock-11f17bcc499cb52e8ace0a49b8994a81', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02f1186a55e06a73aac0f0d', 'stock-11f0e06bf02f1186a55e06a73aac0f0d', 'INCLINATION CAB MERL L/S 750ML', 'stock-11f0e06bf02f1186a55e06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02ed374940d06a73aac0f0d', 'stock-11f0e06bf02ed374940d06a73aac0f0d', 'UNDERLINE SSB 750ML', 'stock-11f0e06bf02ed374940d06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e5424ebb9a78bbfe0677f74668bb', 'stock-11f0e5424ebb9a78bbfe0677f74668bb', 'Jatt Life Flavoured vodka', 'stock-11f0e5424ebb9a78bbfe0677f74668bb', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 5899, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15964cfade53cbaf90219550eeb73', 'stock-11f15964cfade53cbaf90219550eeb73', 'J/DANIEL GENTLEMAN JACK 200ML', 'stock-11f15964cfade53cbaf90219550eeb73', 'Bourbon', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2899, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12d2f5c5e0fe6a0d80a51ae7bdf19', 'stock-11f12d2f5c5e0fe6a0d80a51ae7bdf19', 'COOLABAH DRY RED CASK 5L', 'stock-11f12d2f5c5e0fe6a0d80a51ae7bdf19', 'Other', 'Imported owner stock list', NULL, 'Single unit · 5L', 1899, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f13db82e5bfc5eab240a9a61b55857', 'stock-11f13db82e5bfc5eab240a9a61b55857', 'DE BORTOLI PRESSING SHZ CSK 4L', 'stock-11f13db82e5bfc5eab240a9a61b55857', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1899, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a2efd0a8fe06a76708ff1b', 'stock-11f0d6e917a2efd0a8fe06a76708ff1b', 'ELEPHANT IN ROOM P/NOIR 750ML', 'stock-11f0d6e917a2efd0a8fe06a76708ff1b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1399, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d67323d826d891e50a6bd93cc895', 'stock-11f0d67323d826d891e50a6bd93cc895', 'ABSOLUT VODKA MINS 50ml', 'stock-11f0d67323d826d891e50a6bd93cc895', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 50mL', 699, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e53f5ec66d069f880677f74668bb', 'stock-11f0e53f5ec66d069f880677f74668bb', 'SMIRNOFF ESPRESSO FIRE 700ML', 'stock-11f0e53f5ec66d069f880677f74668bb', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 700mL', 5499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f16a09f26faf64a6480237553b606d', 'stock-11f16a09f26faf64a6480237553b606d', 'DORITOS CHEESE SUPREME 90G 90G 90GM', 'stock-11f16a09f26faf64a6480237553b606d', 'Other', 'Imported owner stock list', NULL, 'Single unit', 499, 11, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd32272bd980217aa93cc65', 'stock-11f0d0fbddd32272bd980217aa93cc65', 'DE BORTOLI PREM P/GRIG CSK 4L', 'stock-11f0d0fbddd32272bd980217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1799, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd33a2883d40217aa93cc65', 'stock-11f0d0fbddd33a2883d40217aa93cc65', 'DE BORTOLI PREM T/RIES CSK 4L', 'stock-11f0d0fbddd33a2883d40217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1799, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ca23e3b24ec9f08022fecc2707f', 'stock-11f11ca23e3b24ec9f08022fecc2707f', 'PASSION POP STRAWBERRY 750ML', 'stock-11f11ca23e3b24ec9f08022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 899, 6, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1642cb00db59a9f430a8473b78f27', 'stock-11f1642cb00db59a9f430a8473b78f27', 'CHATEAU CHANT BRANDY MINS 50ML', 'stock-11f1642cb00db59a9f430a8473b78f27', 'Other', 'Imported owner stock list', NULL, 'Single unit · 50mL', 599, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f130adb4642528a329023c3822049b', 'stock-11f130adb4642528a329023c3822049b', 'Nut cracker', 'stock-11f130adb4642528a329023c3822049b', 'Other', 'Imported owner stock list', NULL, 'Single unit', 599, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11d40a607cc62a61b06360860a637', 'stock-11f11d40a607cc62a61b06360860a637', 'tropical punch', 'stock-11f11d40a607cc62a61b06360860a637', 'Other', 'Imported owner stock list', NULL, 'Single unit', 299, 18, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ca23e3a968a994e022fecc2707f', 'stock-11f11ca23e3a968a994e022fecc2707f', 'DEE VINE EST CASK S/FRTY RED4L', 'stock-11f11ca23e3a968a994e022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit', 1299, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd52f72a1c70217aa93cc65', 'stock-11f0d0fbddd52f72a1c70217aa93cc65', 'W/BLASS RED LBL CAB MER 750ML', 'stock-11f0d0fbddd52f72a1c70217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1049f6c85334e9c070296fa54f19b', 'stock-11f1049f6c85334e9c070296fa54f19b', 'APEROL SPRITZ PACK 700ML+750ML', 'stock-11f1049f6c85334e9c070296fa54f19b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 4999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ecbfb52a287cb831063eea1426f9', 'stock-11f0ecbfb52a287cb831063eea1426f9', 'SOUR PUSS WATERMELON LIQUEUR 700ml', 'stock-11f0ecbfb52a287cb831063eea1426f9', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 2499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e06bf02f18ca8b1d06a73aac0f0d', 'stock-11f0e06bf02f18ca8b1d06a73aac0f0d', 'INCLINATION CHARD L/S 750ML', 'stock-11f0e06bf02f18ca8b1d06a73aac0f0d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1f63029884ce02b26960087b', 'stock-11f0e9de1f63029884ce02b26960087b', 'NOBBYS PEANUTS SALTED 170GM', 'stock-11f0e9de1f63029884ce02b26960087b', 'Other', 'Imported owner stock list', NULL, 'Single unit', 499, 10, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0dcb777f4de10b11506333a4725f3', 'stock-11f0dcb777f4de10b11506333a4725f3', 'OYSTER BAY MERLOT 750ML', 'stock-11f0dcb777f4de10b11506333a4725f3', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 2399, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2c9d0a6ed0217aa93cc65', 'stock-11f0d0fbddd2c9d0a6ed0217aa93cc65', 'BROWN BROS CROUCH & RIES 750ML', 'stock-11f0d0fbddd2c9d0a6ed0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eb9e06ea08ac0062a0ca9a125', 'stock-11f1172eb9e06ea08ac0062a0ca9a125', 'JACOBS CK RES PINOT NOIR 750ML', 'stock-11f1172eb9e06ea08ac0062a0ca9a125', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f5d2afe059eca33002215da08a69', 'stock-11f0f5d2afe059eca33002215da08a69', 'LAUTEUR BRANDY', 'stock-11f0f5d2afe059eca33002215da08a69', 'Other', 'Imported owner stock list', NULL, 'Single unit', 4199, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a51cceba9f06a76708ff1b', 'stock-11f0d6e917a51cceba9f06a76708ff1b', 'Y SERIES PROSECCO NV 750ML', 'stock-11f0d6e917a51cceba9f06a76708ff1b', 'Sparkling', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1399, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f138448f745744bd890af4cd5524a3', 'stock-11f138448f745744bd890af4cd5524a3', 'KETTLE CHILLI 90GM 4121 90GM', 'stock-11f138448f745744bd890af4cd5524a3', 'Other', 'Imported owner stock list', NULL, 'Single unit', 449, 9, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f148f32c9679d0a0180a0370a541b1', 'stock-11f148f32c9679d0a0180a0370a541b1', 'BROWN BROS ORIGINS SHIRAZ 750ML', 'stock-11f148f32c9679d0a0180a0370a541b1', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f11ca23e3a83168e41022fecc2707f', 'stock-11f11ca23e3a83168e41022fecc2707f', 'KOOBA SOFT FRUITY RED 4L', 'stock-11f11ca23e3a83168e41022fecc2707f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1299, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a22b5ea0c506a76708ff1b', 'stock-11f0d6e917a22b5ea0c506a76708ff1b', 'Winesmiths CHARD CSK 2L', 'stock-11f0d6e917a22b5ea0c506a76708ff1b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 2L', 1299, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ecbfb52b4478a06e063eea1426f9', 'stock-11f0ecbfb52b4478a06e063eea1426f9', 'RR DELI CHIP LIME&PEPPER 90GM', 'stock-11f0ecbfb52b4478a06e063eea1426f9', 'Other', 'Imported owner stock list', NULL, 'Single unit', 449, 8, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f182823d1a0c22aa400625041d1b8b', 'stock-11f182823d1a0c22aa400625041d1b8b', 'YELLOWTAIL CAB SAUVIGNON 750ML', 'stock-11f182823d1a0c22aa400625041d1b8b', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1099, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15b150fff51e69d940273529db33f', 'stock-11f15b150fff51e69d940273529db33f', 'Cleanskin soft red wine', 'stock-11f15b150fff51e69d940273529db33f', 'Wine', 'Imported owner stock list', NULL, 'Single unit', 799, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e9de1e7b3a08aa7f0685313f190f', 'stock-11f0e9de1e7b3a08aa7f0685313f190f', 'DE BORTOLI S/HIL TAWNY 750ML', 'stock-11f0e9de1e7b3a08aa7f0685313f190f', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 799, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd55434b98a0217aa93cc65', 'stock-11f0d0fbddd55434b98a0217aa93cc65', 'DEVILS LAIR 5TH LEG CHAR 750ML', 'stock-11f0d0fbddd55434b98a0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1499, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d6e917a2151a875706a76708ff1b', 'stock-11f0d6e917a2151a875706a76708ff1b', 'UPSIDE DOWN SAUV BLANC 750ML', 'stock-11f0d6e917a2151a875706a76708ff1b', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1399, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e2ea7fc516d0a7d0022f5662ac15', 'stock-11f0e2ea7fc516d0a7d0022f5662ac15', 'BAILEYS IRISH CRM PET MINS', 'stock-11f0e2ea7fc516d0a7d0022f5662ac15', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit', 899, 3, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f12d2f5c5d3e7caa290a51ae7bdf19', 'stock-11f12d2f5c5d3e7caa290a51ae7bdf19', 'SPRING ROCK SMOOTH DRY RED 4L', 'stock-11f12d2f5c5d3e7caa290a51ae7bdf19', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1299, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e21a7a49ad0ea97e02b859a188e9', 'stock-11f0e21a7a49ad0ea97e02b859a188e9', 'ANGOSTURA BITTERS 200ML', 'stock-11f0e21a7a49ad0ea97e02b859a188e9', 'Other', 'Imported owner stock list', NULL, 'Single unit · 200mL', 2499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0ecbfb52a1d8c9a0b063eea1426f9', 'stock-11f0ecbfb52a1d8c9a0b063eea1426f9', 'SOUR PUSS GRAPE LIQUEUR 700ml', 'stock-11f0ecbfb52a1d8c9a0b063eea1426f9', 'Liqueur', 'Imported owner stock list', NULL, 'Single unit · 700mL', 2499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d14f0cc86ab29dab0a93514bd9ad', 'stock-11f0d14f0cc86ab29dab0a93514bd9ad', 'COCA COLA 1.25L', 'stock-11f0d14f0cc86ab29dab0a93514bd9ad', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1.25L', 499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbe53bdaa4b4c20217aa93cc65', 'stock-11f0d0fbe53bdaa4b4c20217aa93cc65', 'SACHI8 ZESTY ORANGE Cans 375ML', 'stock-11f0d0fbe53bdaa4b4c20217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 375mL', 499, 5, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbdddcfcc0bace0217aa93cc65', 'stock-11f0d0fbdddcfcc0bace0217aa93cc65', 'SMIRNOFF SELTZER LIME 250ML', 'stock-11f0d0fbdddcfcc0bace0217aa93cc65', 'Vodka', 'Imported owner stock list', NULL, 'Single unit · 250mL', 599, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd6d2c8ba080217aa93cc65', 'stock-11f0d0fbddd6d2c8ba080217aa93cc65', 'STONE & WOOD PACIFIC ALE 375ML', 'stock-11f0d0fbddd6d2c8ba080217aa93cc65', 'Beer', 'Imported owner stock list', NULL, 'Single unit · 375mL', 549, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e53f9a457034a3200a5033c22e31', 'stock-11f0e53f9a457034a3200a5033c22e31', 'GOSSIPS MOSCATO PINK 750ML', 'stock-11f0e53f9a457034a3200a5033c22e31', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1595a7ecf509288a20ac186fc166d', 'stock-11f1595a7ecf509288a20ac186fc166d', 'GRT NTH ORIGINAL BTL 700ML', 'stock-11f1595a7ecf509288a20ac186fc166d', 'Other', 'Imported owner stock list', NULL, 'Single unit · 700mL', 999, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1172eba6abbfaa534062a0ca9a125', 'stock-11f1172eba6abbfaa534062a0ca9a125', 'KETTLE RIDGE CUT SC & CHIVES 90GM', 'stock-11f1172eba6abbfaa534062a0ca9a125', 'Other', 'Imported owner stock list', NULL, 'Single unit', 499, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd4a318945f0217aa93cc65', 'stock-11f0d0fbddd4a318945f0217aa93cc65', 'DE BORTOLI PREM C/MERL CSK 4L', 'stock-11f0d0fbddd4a318945f0217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 4L', 1899, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f15274dea101609f9b02743a991aeb', 'stock-11f15274dea101609f9b02743a991aeb', '37 % vodka', 'stock-11f15274dea101609f9b02743a991aeb', 'Vodka', 'Imported owner stock list', NULL, 'Single unit', 1799, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f105e5070b90fc94c70aa8d0f113bf', 'stock-11f105e5070b90fc94c70aa8d0f113bf', 'B/BERG PASSIONFRUIT 375ML', 'stock-11f105e5070b90fc94c70aa8d0f113bf', 'Other', 'Imported owner stock list', NULL, 'Single unit · 375mL', 399, 4, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f1279e6bc4e9c89eae06360860a637', 'stock-11f1279e6bc4e9c89eae06360860a637', 'MASTER OF MIXES MARGARITA 1L', 'stock-11f1279e6bc4e9c89eae06360860a637', 'Other', 'Imported owner stock list', NULL, 'Single unit · 1L', 1499, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e53ffa804c58a94d02cfdfb10229', 'stock-11f0e53ffa804c58a94d02cfdfb10229', 'BANROCK STN MOSCATO PINK 750ML', 'stock-11f0e53ffa804c58a94d02cfdfb10229', 'Wine', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0d0fbddd2d182b0d90217aa93cc65', 'stock-11f0d0fbddd2d182b0d90217aa93cc65', 'W/BLASS RED LBL CHARD 750ML', 'stock-11f0d0fbddd2d182b0d90217aa93cc65', 'Other', 'Imported owner stock list', NULL, 'Single unit · 750mL', 1299, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0e54122b6c22890b206c9e543d6dd', 'stock-11f0e54122b6c22890b206c9e543d6dd', 'Chancellor & Co Moscato', 'stock-11f0e54122b6c22890b206c9e543d6dd', 'Wine', 'Imported owner stock list', NULL, 'Single unit', 999, 1, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

INSERT INTO store_products (
  source, source_product_id, sku, name, slug, alcohol_type, description,
  image_url, volume_label, price_cents, inventory_quantity,
  is_active, is_placeholder, is_new, is_on_sale, is_member_offer
) VALUES (
  'manual', '11f0f61cf97e530cbd9d020c4780605d', 'stock-11f0f61cf97e530cbd9d020c4780605d', 'RED ROCK DELI CHILLI 90GM 90GM', 'stock-11f0f61cf97e530cbd9d020c4780605d', 'Other', 'Imported owner stock list', NULL, 'Single unit', 399, 2, true, false, false, false, false
)
ON CONFLICT (source, source_product_id) WHERE source_product_id IS NOT NULL
DO UPDATE SET
  sku = EXCLUDED.sku,
  name = EXCLUDED.name,
  slug = EXCLUDED.slug,
  alcohol_type = EXCLUDED.alcohol_type,
  description = EXCLUDED.description,
  image_url = EXCLUDED.image_url,
  volume_label = EXCLUDED.volume_label,
  price_cents = EXCLUDED.price_cents,
  inventory_quantity = EXCLUDED.inventory_quantity,
  is_active = true,
  is_placeholder = false,
  updated_at = now();

COMMIT;
