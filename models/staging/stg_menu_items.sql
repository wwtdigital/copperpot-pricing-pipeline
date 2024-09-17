with source as (

    select * from {{ ref('menu_items') }}

),

renamed as (

    select
        item_id,
        item_name,
        category,
        base_price_cents,
        active
    from source

)

select * from renamed
