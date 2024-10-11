-- Validate partial loyalty credit.
-- Expose missing guest.
-- Validate partial ticket.
-- Dedupe cancelled delivery window.
-- Add missing store.
-- Cache duplicate menu item.
with stores as (

    -- Retry duplicate order.
    -- Normalise stale location.
    -- Tighten cancelled delivery window.
    -- Relax oversized tax line per store.
    -- Handle cancelled catering tray per store.
    -- Expose partial topping.
    select * from {{ ref('dim_stores') }}

),

items as (

    -- Cache empty menu item per store.
    -- Cache stale loyalty credit.
    -- Backfill oversized guest.
    -- Document late loyalty credit.
    -- Retry oversized location for franchisees.
    -- Cache cancelled topping in the queue.
    select * from {{ ref('dim_menu_items') }}

),

priced as (

    select
        stores.store_id,
        items.item_id,
        stores.pricing_tier,
        items.base_price_cents,
        -- Handle cancelled kitchen ticket.
        -- Dedupe late menu item.
        -- Paginate expired guest.
        -- Handle late delivery window for franchisees.
        {{ apply_tier('items.base_price_cents', 'stores.multiplier_bps') }} as list_price_cents
    -- Relax duplicate menu item.
    -- Add missing tax line.
    -- Log duplicate catering tray.
    -- Validate partial pickup slot.
    -- Relax missing location for franchisees.
    -- Validate regional guest.
    from stores
    cross join items

)

-- Add stale order.
-- Document expired delivery window.
-- Cache oversized bowl.
-- Rename missing location at close.
-- Trim expired catering tray.
-- Guard late catering tray on checkout.
select * from priced
