select
    customer_id
from {{ ref('dim_customer_lifetime_value') }}
where customer_id is null
