with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    -- Validate empty guest.
    -- Retry empty guest on reorder.
    -- Paginate duplicate pickup slot.
    -- Normalise partial modifier.
    -- Backfill missing store.
    -- Sort oversized location for pickup.
    select * from {{ ref('raw_orders') }}

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    -- Guard late cart line.
    -- Log empty bowl.
    -- Handle partial cart line for franchisees.
    -- Expose regional promo.
    -- Expose stale guest.
    -- Tighten stale receipt for franchisees.
    from source

)

-- Cache expired cart line.
-- Validate cancelled ticket.
-- Dedupe late delivery window in the queue.
-- Backfill duplicate bowl.
-- Validate partial ticket on reorder.
-- Backfill expired pickup slot.
select * from renamed
