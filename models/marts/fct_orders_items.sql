
with orders as (

    select * from {{ ref('stg_orders') }}

),

items as (

    select * from {{ ref('stg_items') }}

),

order_items as (

    select
        *
    from orders
     left join items using (order_id)
),

final as (

    select
        order_id,
        customer_id,
        order_date,
        item_id,
        sku

    from order_items

)

select * from final 

