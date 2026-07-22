## Project Summary

1. **Primary question**:
   - Which customers have the highest lifetime revenue to date, and which products are associated with those high-value customers?

2. **Metric definition**:
   - Lifetime value = total order revenue per customer across all recorded orders.
   - Order count = number of orders placed by each customer.
   - Average order value = lifetime value divided by order count.
   - The customer CLV mart is built in [models/marts/dim_customer_lifetime_value.sql](models/marts/dim_customer_lifetime_value.sql).
   - The order-product fact model is built in [models/marts/fct_orders_products.sql](models/marts/fct_orders_products.sql).
   - The customer-product CLV summary mart is built in [models/marts/fct_customer_product_lifetime_summary.sql](models/marts/fct_customer_product_lifetime_summary.sql).

3. **Example query**:
   ```sql
   select
       customer_id,
       customer_name,
       lifetime_value,
       order_count,
       average_order_value
   from {{ ref('dim_customer_lifetime_value') }}
   order by lifetime_value desc
   limit 10;
   ```

4. **Key Insight**
   - The top 10 customers by lifetime value represent the highest-value segment of the customer base. This suggests that a relatively small group of customers contributes a disproportionate share of total revenue, making them strong candidates for retention, loyalty, and personalized marketing programs.
   - By joining customer CLV with product-level order data, we can also identify which products are most commonly associated with these high-value customers.

5. **Suggested Next Steps**
   - Segment customers into high-value, repeat, and at-risk groups using lifetime value and order frequency.
   - Analyze which products are most frequently purchased by the top 10 CLV customers.
   - Leverage the supply information to dig deeper into the profitability of customers and products.
