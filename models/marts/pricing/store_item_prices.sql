with stores as (

    select * from {{ ref('dim_stores') }}

),

items as (

    select * from {{ ref('dim_menu_items') }}

),

priced as (

    select
        stores.store_id,
        items.item_id,
        stores.pricing_tier,
        items.base_price_cents,
        {{ apply_tier('items.base_price_cents', 'stores.multiplier_bps') }} as list_price_cents
    from stores
    cross join items

)

select * from priced
