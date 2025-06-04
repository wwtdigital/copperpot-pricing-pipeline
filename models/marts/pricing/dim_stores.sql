with stores as (

    select * from {{ ref('stg_stores') }}

),

overrides as (

    select * from {{ ref('stg_store_tier_overrides') }}

),

tiers as (

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
    from stores
    left join overrides
        on stores.store_id = overrides.store_id

),

final as (

    select
        resolved.store_id,
        resolved.store_name,
        resolved.region,
        resolved.pricing_tier,
        resolved.export_pricing_tier,
        resolved.override_reason,
        resolved.opened_on,
        tiers.multiplier_bps
    from resolved
    inner join tiers
        on resolved.pricing_tier = tiers.pricing_tier

)

select * from final
