select
    customer_id
from {{ ref('dim_customer_lifetime_value') }}
where order_count = 0 and lifetime_value is null
   or lifetime_value < 0
   or average_order_value < 0
