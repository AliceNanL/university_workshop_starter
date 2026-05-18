select 
     order_id,
     order_total
from {{ ref('stg_orders') }}
where order_total < 0