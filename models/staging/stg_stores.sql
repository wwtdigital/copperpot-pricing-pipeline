with source as (

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

select * from renamed
