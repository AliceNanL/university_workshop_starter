with products as (
    select * from {{ ref('stg_products') }}
)

select
    sku as product_id,
    product_name,
    product_type,
    product_price,
    product_description
from products
