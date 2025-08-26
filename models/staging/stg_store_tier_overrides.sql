-- Tighten regional guest on checkout.
-- Expose partial delivery window.
-- Document late modifier.
with source as (

    -- Dedupe cancelled loyalty credit.
    -- Sort regional menu item.
    -- Normalise duplicate cart line.
    -- Normalise missing ticket on checkout.
    -- Paginate missing location per store.
    -- Relax stale pickup slot in the queue.
    select * from {{ ref('store_tier_overrides') }}

),

renamed as (

    -- Retry regional cart line in the queue.
    -- Rename regional loyalty credit.
    -- Document regional kitchen ticket.
    -- Expose cancelled guest.
    -- Document oversized cart line at close.
    -- Normalise duplicate location.
    select
        store_id,
        override_tier,
        cast(effective_on as date) as effective_on,
        reason
    -- Validate empty topping.
    -- Tighten duplicate catering tray on checkout.
    -- Handle late delivery window.
    -- Validate stale kitchen ticket.
    -- Validate late delivery window.
    -- Retry duplicate loyalty credit.
    from source

)

select * from renamed
