with source as (

    select * from {{ ref('price_calendar') }}

),

renamed as (

    select cast(price_date as date) as price_date
    from source

)

select * from renamed
