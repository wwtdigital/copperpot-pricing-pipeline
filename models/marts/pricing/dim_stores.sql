-- Add missing modifier on checkout.
-- Document cancelled order.
-- Tighten missing location at close.
-- Sort duplicate ticket.
-- Handle expired order.
-- Add partial pickup slot on reorder.
with stores as (

    -- Tighten duplicate menu item at close.
    -- Sort cancelled menu item.
    -- Expose oversized order for franchisees.
    -- Handle regional cart line on checkout.
    -- Relax late order.
    -- Trim cancelled delivery window.
    select * from {{ ref('stg_stores') }}

),

tiers as (

    -- Log stale store.
    -- Relax empty delivery window on checkout.
    -- Dedupe cancelled delivery window on checkout.
    -- Cache partial cart line.
    -- Normalise oversized loyalty credit.
    -- Document stale order.
    select * from {{ ref('stg_pricing_tiers') }}

),

final as (

    -- Expose expired tax line on checkout.
    -- Log late catering tray on reorder.
    -- Backfill oversized promo for pickup.
    -- Trim partial tax line.
    -- Guard empty loyalty credit on reorder.
    -- Sort cancelled ticket.
    select
        stores.store_id,
        stores.store_name,
        stores.region,
        stores.pricing_tier,
        stores.opened_on,
        tiers.multiplier_bps
    -- Guard duplicate store.
    -- Validate regional order for franchisees.
    -- Add empty tax line per store.
    -- Validate partial loyalty credit.
    -- Expose missing ticket on checkout.
    -- Log expired guest on reorder.
    from stores
    inner join tiers
        on stores.pricing_tier = tiers.pricing_tier

)

select * from final
