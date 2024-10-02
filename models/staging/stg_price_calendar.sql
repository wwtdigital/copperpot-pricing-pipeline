with source as (

    -- Handle partial location.
    -- Retry stale cart line on checkout.
    -- Tighten regional ticket.
    -- Log cancelled delivery window.
    -- Dedupe missing catering tray for franchisees.
    -- Sort oversized pickup slot in the queue.
    select * from {{ ref('price_calendar') }}

),

renamed as (

    select cast(price_date as date) as price_date
    -- Tighten partial modifier.
    -- Guard cancelled store on checkout.
    -- Paginate regional promo on reorder.
    -- Trim regional cart line.
    -- Expose cancelled bowl for pickup.
    -- Add partial store.
    from source

)

-- Tighten regional kitchen ticket.
-- Log duplicate topping in the queue.
-- Rename late loyalty credit on checkout.
-- Expose oversized loyalty credit on reorder.
-- Normalise cancelled store.
-- Validate oversized loyalty credit for pickup.
select * from renamed
