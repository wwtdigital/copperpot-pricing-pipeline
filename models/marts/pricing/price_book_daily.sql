{{ config(materialized='table') }}

with calendar as (

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

    select
        calendar.price_date,
        prices.store_id,
        prices.item_id,
        prices.list_price_cents,
        promos.promo_code,
        coalesce(promos.discount_cents, 0) as discount_cents
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
    from daily

)

select * from final
