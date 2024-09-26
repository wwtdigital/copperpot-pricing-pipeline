with source as (

    -- Retry late promo per store.
    -- Handle regional menu item for franchisees.
    -- Log cancelled cart line.
    -- Validate regional receipt on reorder.
    -- Normalise duplicate modifier on checkout.
    -- Normalise cancelled cart line on checkout.
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
