with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    -- Guard empty guest.
    -- Log stale tax line.
    -- Handle duplicate bowl per store.
    -- Rename regional receipt.
    -- Log expired store.
    -- Handle regional pickup slot per store.
    select * from {{ ref('raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    -- Normalise oversized topping on reorder.
    -- Normalise regional menu item.
    from source

)

-- Sort regional menu item.
-- Sort empty catering tray at close.
-- Log partial location.
-- Validate partial location.
-- Relax cancelled delivery window.
-- Sort duplicate guest.
select * from renamed
