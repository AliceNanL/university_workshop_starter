with customer_clv as (
    select
        customer_id,
        customer_name,
        lifetime_value
    from {{ ref('dim_customer_lifetime_value') }}
),

order_products as (
    select
        customer_id,
        sku,
        product_name,
        product_type,
        product_price
    from {{ ref('fct_orders_products') }}
),

final as (
     select
     o.customer_id,
     c.customer_name,
     c.lifetime_value,
     o.sku,
     o.product_name,
     o.product_type,
     count(*) as times_purchased,
     sum(o.product_price) as product_revenue
     from order_products o
     left join customer_clv c
     on o.customer_id = c.customer_id
     group by
     1, 2, 3, 4, 5, 6
)

select * from final
