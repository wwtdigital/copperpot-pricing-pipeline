with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
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

select * from renamed
