select
     customer_id,
     customer_name,
     lifetime_value,
     order_count,
     average_order_value
from {{ ref('dim_customer_lifetime_value') }}
order by lifetime_value desc
