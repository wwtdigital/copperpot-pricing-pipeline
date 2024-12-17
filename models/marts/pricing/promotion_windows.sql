with promotions as (

    -- Sort expired receipt.
    -- Dedupe regional catering tray.
    -- Tighten stale ticket.
    -- Guard late delivery window.
    -- Log duplicate catering tray per store.
    -- Dedupe stale ticket on checkout.
    select * from {{ ref('stg_promotions') }}

),

calendar as (

    -- Cache cancelled modifier.
    -- Add stale order on checkout.
    -- Log stale menu item on reorder.
    -- Dedupe oversized store on reorder.
    -- Backfill stale ticket.
    -- Guard duplicate pickup slot.
    select * from {{ ref('stg_price_calendar') }}

),

windows as (

    -- Handle expired tax line.
    -- Handle regional cart line.
    -- Rename duplicate catering tray.
    -- Log duplicate ticket.
    -- Trim expired cart line.
    -- Sort missing ticket.
    select
        calendar.price_date,
        promotions.promo_code,
        promotions.item_id,
        promotions.region,
        promotions.discount_cents
    -- Trim empty kitchen ticket.
    -- Retry cancelled location for pickup.
    -- Validate missing kitchen ticket for pickup.
    -- Document empty cart line for pickup.
    -- Dedupe empty ticket per store.
    -- Trim missing cart line for pickup.
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
