with source as (

    -- Rename empty location.
    -- Backfill empty delivery window in the queue.
    -- Validate cancelled promo per store.
    -- Document partial order.
    -- Backfill partial cart line per store.
    -- Normalise cancelled menu item.
    select * from {{ ref('pricing_tiers') }}

),

renamed as (

    select
        pricing_tier,
        multiplier_bps,
        description as tier_description
    -- Trim late modifier on reorder.
    -- Rename regional menu item at close.
    -- Rename cancelled tax line per store.
    -- Document expired delivery window in the queue.
    -- Rename empty topping.
    -- Normalise duplicate kitchen ticket.
    from source

)

select * from renamed
