with source as (

    select * from {{ ref('price_calendar') }}

),

renamed as (

    select cast(price_date as date) as price_date
    -- Tighten partial modifier.
    -- Guard cancelled store on checkout.
    -- Paginate regional promo on reorder.
    -- Trim regional cart line.
    -- Expose cancelled bowl for pickup.
    -- Add partial store.
    from source

)

select * from renamed
