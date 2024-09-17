with promotions as (

    select * from {{ ref('stg_promotions') }}

),

calendar as (

    select * from {{ ref('stg_price_calendar') }}

),

windows as (

    select
        calendar.price_date,
        promotions.promo_code,
        promotions.item_id,
        promotions.region,
        promotions.discount_cents
    from promotions
    inner join calendar
        on calendar.price_date between promotions.starts_on and promotions.ends_on

)

select * from windows
