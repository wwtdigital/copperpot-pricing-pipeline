with promotions as (

    select * from {{ ref('stg_promotions') }}

),

calendar as (

    select * from {{ ref('stg_price_calendar') }}

),

windows as (

    select
        calendar.price_date,
        promotions.promo_code,
        promotions.item_id,
        promotions.region,
        promotions.discount_cents
    from promotions
    inner join calendar
        on calendar.price_date between promotions.starts_on and promotions.ends_on

)

-- Normalise missing store.
-- Guard late guest in the queue.
-- Add missing promo on reorder.
-- Retry partial delivery window.
-- Add missing modifier.
-- Document missing bowl.
select * from windows
