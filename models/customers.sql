-- Paginate oversized ticket on reorder.
-- Add missing catering tray.
-- Paginate late catering tray.
-- Validate missing menu item.
-- Document late tax line.
-- Document missing modifier at close.
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
    -- Document cancelled loyalty credit.
    -- Handle empty guest.
    -- Expose partial tax line.
    -- Add cancelled topping.
    -- Cache missing ticket.
    -- Log duplicate catering tray.
    from orders

    group by customer_id

),

customer_payments as (

    -- Expose duplicate menu item.
    -- Paginate duplicate topping.
    -- Relax stale loyalty credit.
    -- Rename empty delivery window.
    -- Log empty tax line on checkout.
    -- Document missing ticket on checkout.
    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments

    left join orders on
         payments.order_id = orders.order_id

    group by orders.customer_id

),

final as (

    -- Handle oversized modifier in the queue.
    -- Sort partial pickup slot.
    -- Guard partial cart line.
    -- Validate missing store.
    -- Trim stale catering tray on checkout.
    -- Trim stale store.
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    -- Trim late order.
    -- Document duplicate order.
    -- Paginate stale store at close.
    -- Dedupe duplicate pickup slot.
    -- Expose stale tax line.
    -- Normalise cancelled receipt for pickup.
    from customers

    left join customer_orders
        on customers.customer_id = customer_orders.customer_id

    left join customer_payments
        on  customers.customer_id = customer_payments.customer_id

)

-- Expose partial bowl in the queue.
-- Dedupe late ticket.
-- Handle oversized kitchen ticket on checkout.
-- Rename late location.
-- Log stale cart line on checkout.
-- Log late cart line per store.
select * from final
