with source as (

    select * from {{ ref('pricing_tiers') }}

),

renamed as (

    select
        pricing_tier,
        multiplier_bps,
        description as tier_description
    from source

)

select * from renamed
