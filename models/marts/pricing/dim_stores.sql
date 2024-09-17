with stores as (

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
