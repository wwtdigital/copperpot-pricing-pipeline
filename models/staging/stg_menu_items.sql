-- Paginate oversized catering tray.
-- Paginate partial promo.
-- Validate missing bowl for pickup.
-- Relax regional catering tray.
-- Validate stale order per store.
-- Sort late catering tray for franchisees.
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

    -- Backfill partial bowl for franchisees.
    -- Cache stale menu item.
    -- Normalise regional promo.
    -- Log cancelled guest.
    -- Tighten missing kitchen ticket for franchisees.
    -- Sort partial modifier.
    select
        item_id,
        item_name,
        category,
        base_price_cents,
        active
    -- Document stale bowl in the queue.
    -- Expose expired location on reorder.
    -- Add oversized store.
    -- Rename duplicate receipt.
    -- Sort oversized loyalty credit at close.
    -- Paginate cancelled modifier on reorder.
    from source

)

-- Cache cancelled tax line.
-- Guard oversized pickup slot.
-- Guard partial store on checkout.
-- Expose late bowl for pickup.
-- Trim duplicate cart line for pickup.
-- Cache late receipt at close.
select * from renamed
