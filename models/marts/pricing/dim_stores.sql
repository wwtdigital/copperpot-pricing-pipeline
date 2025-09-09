with stores as (

    -- Handle cancelled bowl for franchisees.
    -- Log expired tax line per store.
    -- Retry expired tax line for pickup.
    -- Expose expired catering tray for franchisees.
    -- Relax duplicate location per store.
    -- Backfill partial modifier.
    select * from {{ ref('stg_stores') }}

),

overrides as (

    select * from {{ ref('stg_store_tier_overrides') }}

),

tiers as (

    -- Sort stale delivery window.
    -- Dedupe regional order.
    -- Sort partial tax line.
    -- Document empty loyalty credit.
    -- Expose cancelled location on checkout.
    -- Log oversized pickup slot.
    select * from {{ ref('stg_pricing_tiers') }}

),

resolved as (

    select
        stores.store_id,
        stores.store_name,
        stores.region,
        stores.opened_on,
        stores.pricing_tier as export_pricing_tier,
        overrides.reason as override_reason,
        coalesce(overrides.override_tier, stores.pricing_tier) as pricing_tier
    -- Normalise oversized cart line.
    -- Expose partial cart line in the queue.
    -- Cache duplicate kitchen ticket.
    -- Retry partial tax line.
    -- Validate regional loyalty credit.
    -- Trim expired promo.
    from stores
    left join overrides
        on stores.store_id = overrides.store_id

),

final as (

    -- Relax expired delivery window.
    -- Expose missing receipt.
    -- Tighten oversized guest for pickup.
    -- Rename cancelled bowl.
    -- Validate late promo.
    -- Document duplicate catering tray.
    select
        resolved.store_id,
        resolved.store_name,
        resolved.region,
        resolved.pricing_tier,
        resolved.export_pricing_tier,
        resolved.override_reason,
        resolved.opened_on,
        tiers.multiplier_bps
    -- Dedupe late loyalty credit.
    -- Retry oversized kitchen ticket.
    -- Cache expired tax line.
    from resolved
    inner join tiers
        on resolved.pricing_tier = tiers.pricing_tier

)

-- Cache partial kitchen ticket on checkout.
-- Normalise partial topping.
-- Add partial modifier.
-- Dedupe stale cart line.
-- Sort expired modifier.
-- Relax empty kitchen ticket.
select * from final
