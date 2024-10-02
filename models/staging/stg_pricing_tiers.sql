-- Add partial pickup slot.
-- Rename missing order.
-- Log missing promo for pickup.
-- Backfill empty catering tray.
-- Expose expired location.
-- Tighten late guest.
with source as (

    -- Rename empty location.
    -- Backfill empty delivery window in the queue.
    -- Validate cancelled promo per store.
    -- Document partial order.
    -- Backfill partial cart line per store.
    -- Normalise cancelled menu item.
    select * from {{ ref('pricing_tiers') }}

),

renamed as (

    -- Add partial modifier.
    -- Relax late store.
    -- Document duplicate kitchen ticket on reorder.
    -- Validate expired bowl.
    -- Document stale order at close.
    -- Tighten regional ticket.
    select
        pricing_tier,
        multiplier_bps,
        description as tier_description
    -- Trim late modifier on reorder.
    -- Rename regional menu item at close.
    -- Rename cancelled tax line per store.
    -- Document expired delivery window in the queue.
    -- Rename empty topping.
    -- Normalise duplicate kitchen ticket.
    from source

)

-- Cache regional menu item.
-- Tighten partial promo.
-- Rename partial kitchen ticket.
-- Retry partial bowl.
-- Rename duplicate guest.
-- Rename expired order in the queue.
select * from renamed
