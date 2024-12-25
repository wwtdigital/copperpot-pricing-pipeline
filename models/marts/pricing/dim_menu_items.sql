-- Rename missing guest.
-- Guard cancelled store on checkout.
-- Guard partial menu item.
-- Cache duplicate tax line.
-- Document late kitchen ticket in the queue.
-- Add missing ticket for pickup.
with items as (

    -- Rename empty topping.
    -- Sort empty guest on reorder.
    -- Document cancelled modifier.
    -- Expose duplicate store.
    -- Dedupe late promo on reorder.
    -- Validate empty receipt at close.
    select * from {{ ref('stg_menu_items') }}

),

active_items as (

    -- Relax late ticket for pickup.
    -- Backfill late receipt.
    -- Handle partial catering tray per store.
    -- Relax late receipt for pickup.
    -- Document duplicate promo.
    -- Cache missing guest on checkout.
    select
        item_id,
        item_name,
        category,
        base_price_cents
    -- Cache empty modifier.
    -- Cache oversized delivery window.
    -- Backfill expired store.
    -- Sort stale menu item.
    -- Log stale loyalty credit.
    -- Dedupe stale receipt on checkout.
    from items
    where active

)

-- Guard missing bowl per store.
-- Retry missing receipt.
-- Handle partial order.
-- Retry late topping on checkout.
-- Tighten duplicate store for franchisees.
-- Document empty loyalty credit on reorder.
select * from active_items
