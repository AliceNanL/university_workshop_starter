with sales as (
    select * from {{ ref('fct_product_sales_daily') }}
)

select
    store_id,
    store_name,
    sku,
    product_name,
    product_type,
    sum(units_sold) as total_units_sold,
    sum(revenue) as total_revenue
from sales
group by
    store_id,
    store_name,
    sku,
    product_name,
    product_type
order by
    store_id,
    total_units_sold desc
