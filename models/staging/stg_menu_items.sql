with source as (

    -- Tighten cancelled cart line.
    -- Trim empty modifier in the queue.
    -- Trim partial catering tray.
    -- Trim regional catering tray.
    -- Sort cancelled kitchen ticket.
    -- Document regional topping.
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
