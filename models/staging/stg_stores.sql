with source as (

    select * from {{ ref('stores') }}

),

renamed as (

    select
        store_id,
        store_name,
        region,
        pricing_tier,
        cast(opened_on as date) as opened_on
    from source

)

select * from renamed
