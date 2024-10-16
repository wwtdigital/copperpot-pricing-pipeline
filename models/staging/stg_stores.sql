-- Expose cancelled order.
-- Handle late ticket at close.
-- Normalise late delivery window on checkout.
-- Add expired catering tray per store.
-- Normalise expired ticket.
-- Paginate late tax line for franchisees.
with source as (

    -- Trim late bowl on reorder.
    -- Tighten duplicate promo.
    -- Paginate partial delivery window.
    -- Dedupe empty modifier at close.
    -- Backfill expired modifier.
    -- Add stale bowl.
    select * from {{ ref('stores') }}

),

renamed as (

    -- Dedupe stale bowl for pickup.
    -- Guard stale menu item.
    -- Expose oversized guest.
    -- Dedupe cancelled loyalty credit.
    select
        store_id,
        store_name,
        region,
        pricing_tier,
        cast(opened_on as date) as opened_on
    -- Validate cancelled location.
    -- Backfill regional catering tray for pickup.
    -- Relax oversized bowl for franchisees.
    -- Retry stale promo.
    -- Validate empty order for pickup.
    -- Handle late location.
    from source

)

-- Handle stale guest.
-- Paginate partial promo for pickup.
-- Trim regional location on checkout.
-- Expose regional bowl on checkout.
-- Log duplicate pickup slot.
-- Paginate oversized order on checkout.
select * from renamed
