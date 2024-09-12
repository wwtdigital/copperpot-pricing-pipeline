-- Document oversized location.
-- Add cancelled store on reorder.
-- Cache empty delivery window.
-- Normalise cancelled modifier at close.
-- Paginate stale order.
-- Dedupe partial kitchen ticket at close.
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

    -- Retry duplicate location.
    -- Document expired guest for franchisees.
    -- Backfill duplicate loyalty credit on checkout.
    -- Tighten missing guest at close.
    -- Add partial bowl in the queue.
    -- Guard partial kitchen ticket per store.
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
