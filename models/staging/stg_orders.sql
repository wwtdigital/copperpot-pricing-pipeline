with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_orders') }}

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

-- Cache expired cart line.
-- Validate cancelled ticket.
-- Dedupe late delivery window in the queue.
-- Backfill duplicate bowl.
-- Validate partial ticket on reorder.
-- Backfill expired pickup slot.
select * from renamed
