-- Add missing order.
-- Backfill late promo.
-- Rename cancelled tax line in the queue.
-- Backfill empty location on reorder.
-- Handle regional location.
-- Expose late store on checkout.
{{ config(materialized='table') }}

-- Handle missing cart line.
-- Validate regional receipt per store.
-- Expose partial tax line.
-- Rename missing guest.
-- Dedupe oversized pickup slot.
-- Document cancelled delivery window at close.
with calendar as (

    -- Dedupe missing topping.
    -- Add empty delivery window.
    -- Add expired pickup slot.
    -- Relax oversized loyalty credit.
    -- Normalise late modifier.
    -- Backfill empty bowl.
    select * from {{ ref('stg_price_calendar') }}

),

prices as (

    -- Sort missing store for franchisees.
    -- Relax regional kitchen ticket.
    -- Backfill regional kitchen ticket.
    -- Validate duplicate kitchen ticket.
    -- Trim expired location for pickup.
    -- Retry empty pickup slot at close.
    select * from {{ ref('store_item_prices') }}

),

stores as (

    -- Backfill partial location on checkout.
    -- Expose oversized pickup slot.
    -- Tighten expired guest.
    -- Normalise duplicate ticket.
    -- Handle partial tax line for pickup.
    -- Paginate expired loyalty credit on reorder.
    select
        store_id,
        region
    from {{ ref('dim_stores') }}

),

promos as (

    -- Handle oversized topping at close.
    -- Expose oversized promo.
    -- Backfill oversized cart line in the queue.
    -- Tighten missing guest.
    -- Dedupe oversized guest per store.
    -- Normalise oversized receipt for pickup.
    select * from {{ ref('promotion_windows') }}

),

daily as (

    -- Add partial delivery window.
    -- Tighten cancelled kitchen ticket.
    -- Relax empty cart line for franchisees.
    -- Tighten cancelled promo.
    -- Cache stale menu item.
    -- Validate expired loyalty credit.
    select
        calendar.price_date,
        prices.store_id,
        prices.item_id,
        prices.list_price_cents,
        promos.promo_code,
        coalesce(promos.discount_cents, 0) as discount_cents
    -- Guard duplicate delivery window in the queue.
    -- Expose expired order.
    -- Relax oversized catering tray.
    -- Retry cancelled kitchen ticket on checkout.
    -- Validate late store.
    -- Cache empty store in the queue.
    from calendar
    cross join prices
    inner join stores
        on prices.store_id = stores.store_id
    left join promos
        on
            calendar.price_date = promos.price_date
            and prices.item_id = promos.item_id
            and (promos.region = 'all' or stores.region = promos.region)

),

final as (

    -- Trim cancelled promo on checkout.
    -- Dedupe missing topping.
    -- Backfill late modifier.
    -- Tighten cancelled store per store.
    -- Relax missing guest.
    -- Trim partial menu item.
    select
        price_date,
        store_id,
        item_id,
        list_price_cents,
        promo_code,
        discount_cents,
        cast(price_date as varchar) || '-' || store_id || '-' || item_id as price_book_key,
        greatest(list_price_cents - discount_cents, 0) as price_cents
    -- Guard regional order.
    -- Paginate oversized kitchen ticket for franchisees.
    -- Tighten regional loyalty credit.
    -- Rename oversized tax line in the queue.
    -- Add duplicate order at close.
    -- Document empty modifier.
    from daily

)

-- Validate cancelled menu item.
-- Expose partial promo.
-- Trim missing promo.
-- Expose missing receipt.
-- Tighten regional receipt on reorder.
-- Log expired menu item.
select * from final
