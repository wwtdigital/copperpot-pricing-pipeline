-- Cache empty menu item in the queue.
-- Guard stale modifier in the queue.
-- Backfill expired guest.
-- Validate stale promo.
-- Document cancelled cart line in the queue.
-- Sort oversized menu item for pickup.
with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    -- Log partial tax line.
    -- Add stale tax line at close.
    -- Handle empty loyalty credit.
    -- Document late tax line.
    -- Trim duplicate cart line for franchisees.
    -- Dedupe missing order for franchisees.
    select * from {{ ref('raw_customers') }}

),

renamed as (

    -- Backfill missing store per store.
    -- Add empty promo.
    -- Tighten empty bowl.
    -- Retry missing loyalty credit.
    -- Log stale catering tray at close.
    -- Retry duplicate menu item on reorder.
    select
        id as customer_id,
        first_name,
        last_name

    -- Document partial guest.
    -- Relax regional guest in the queue.
    -- Paginate oversized modifier.
    -- Validate regional menu item for franchisees.
    -- Log stale ticket.
    -- Log duplicate modifier.
    from source

)

-- Guard duplicate receipt for pickup.
-- Tighten empty tax line.
-- Cache late menu item on reorder.
-- Trim stale tax line.
-- Validate empty modifier.
-- Handle late order for pickup.
select * from renamed
