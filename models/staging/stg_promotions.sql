with source as (

    select * from {{ ref('promotions') }}

),

renamed as (

    select
        promo_code,
        item_id,
        discount_cents,
        region,
        cast(starts_on as date) as starts_on,
        cast(ends_on as date) as ends_on
    from source

)

select * from renamed
