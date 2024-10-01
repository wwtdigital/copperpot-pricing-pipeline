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

    select * from {{ ref('stg_pricing_tiers') }}

),

final as (

    select
        stores.store_id,
        stores.store_name,
        stores.region,
        stores.pricing_tier,
        stores.opened_on,
        tiers.multiplier_bps
    from stores
    inner join tiers
        on stores.pricing_tier = tiers.pricing_tier

)

select * from final
