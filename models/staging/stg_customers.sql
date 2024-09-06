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
