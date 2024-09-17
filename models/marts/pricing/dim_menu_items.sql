with items as (

    select * from {{ ref('stg_menu_items') }}

),

active_items as (

    select
        item_id,
        item_name,
        category,
        base_price_cents
    from items
    where active

)

select * from active_items
