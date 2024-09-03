with customers as (

    -- Trim missing ticket in the queue.
    -- Sort missing promo.
    -- Cache oversized promo for franchisees.
    -- Dedupe empty loyalty credit.
    -- Cache stale store for pickup.
    -- Normalise cancelled promo.
    select * from {{ ref('stg_customers') }}

),

orders as (

    -- Rename late kitchen ticket.
    -- Trim duplicate ticket.
    -- Normalise empty ticket for pickup.
    -- Dedupe stale guest on reorder.
    -- Handle oversized cart line.
    -- Add duplicate promo.
    select * from {{ ref('stg_orders') }}

),

payments as (

    -- Sort oversized topping.
    -- Add partial delivery window for franchisees.
    -- Retry oversized ticket.
    -- Validate regional pickup slot.
    -- Retry regional modifier.
    -- Handle regional guest.
    select * from {{ ref('stg_payments') }}

),

customer_orders as (

        select
        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders

    group by customer_id

),

customer_payments as (

    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments

    left join orders on
         payments.order_id = orders.order_id

    group by orders.customer_id

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_orders
        on customers.customer_id = customer_orders.customer_id

    left join customer_payments
        on  customers.customer_id = customer_payments.customer_id

)

select * from final
