with orders as (
    select order_id, store_id, order_date
    from {{ ref('stg_orders') }}
),

items as (
    select item_id, order_id, sku
    from {{ ref('stg_items') }}
),

products as (
    select sku, product_name, product_type, product_price
    from {{ ref('stg_products') }}
),

stores as (
    select store_id, store_name
    from {{ ref('stg_stores') }}
),

sales as (
    select
        o.order_date,
        o.store_id,
        s.store_name,
        i.sku,
        p.product_name,
        p.product_type,
        p.product_price as revenue_per_unit,
        1 as units_sold,
        p.product_price as revenue
    from orders o
    inner join items i using (order_id)
    left join products p using (sku)
    left join stores s using (store_id)
)

select
    order_date,
    store_id,
    store_name,
    sku,
    product_name,
    product_type,
    sum(units_sold) as units_sold,
    sum(revenue) as revenue
from sales
group by
    order_date,
    store_id,
    store_name,
    sku,
    product_name,
    product_type
order by
    order_date,
    store_id,
    units_sold desc
