select 
     order_id,
     customer_id,
     order_date,
     sku,
     product_name,
     product_type,
     product_price,
     product_description

from {{ ref('fct_orders_items') }} as orders_items
left join {{ ref('stg_products') }} as products using (sku)