with customers as (

    select
        customer_id,
        customer_name
    from {{ ref('stg_customers') }}

),

orders as (

    select
        customer_id,
        order_id,
        order_date,
        order_total
    from {{ ref('stg_orders') }}

),

customer_order_summary as (

    select
        customers.customer_id,
        customers.customer_name,
        count(orders.order_id) as order_count,
        coalesce(sum(orders.order_total), 0) as lifetime_value,
        min(orders.order_date) as first_order_date,
        max(orders.order_date) as last_order_date,
        coalesce(avg(orders.order_total), 0) as average_order_value
    from customers
    left join orders
        on customers.customer_id = orders.customer_id
    group by 1, 2

)

select *
from customer_order_summary
