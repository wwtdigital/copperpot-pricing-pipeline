with source as (

    select * from {{ ref('store_tier_overrides') }}

),

renamed as (

    select
        store_id,
        override_tier,
        cast(effective_on as date) as effective_on,
        reason
    from source

)

select * from renamed
