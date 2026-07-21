
## Capstone requirements checklist (use this to self-review)
- [ ] Defined primary + supporting analytics questions
- [ ] Built at least one `dim_*` and/or `fct_*` model
- [ ] Added schema tests for keys (unique, not_null)
- [ ] Added at least one “business logic” test (accepted values, or custom test)
- [ ] Added descriptions to key models and columns
- [ ] Documented metric definitions and entity grain (especially facts)
- [ ] Ran `dbt build` successfully with a clean output
- [ ] README includes: At least one insight stated and supported by data evidence (numbers, comparison, trend, segment, etc.) and at least one realistic next step that follows from the insight(s)

---

## Suggested workflow (ADLC)
1. **Plan**
   - Write questions, entities, grain, and expected outputs
   - You can place these in a top-level `plan.md` file in your project
2. **Develop**
   - Add marts (and, optionally, intermediate) models with clear naming and layering
3. **Test**
   - Add tests early, document decisions
4. **Deploy**
   - Ensure everything builds end-to-end locally and push changes to `main`
5. **Operate**
   - Schedule your project to run via a job (optionally, schedule it) on dbt Platform
6. **Observe**
   - Check lineage and data quality signals via test results
7. **Discover**
   - Add any useful descriptions and documentation to the project, models, and columns.
8. **Analyze**
   - Query your marts (or build an output artifact) and write 1–2 insights plus next steps

---

## How to submit
In the learning path, you will be asked to submit:
- A link to your GitHub repo

The GitHub project README should be updated with:
  - the question(s) you answered
  - how to reproduce your run (what commands are needed)
  - 1–2 insights, backed by model outputs, and next steps

Bonus: You may choose to also submit links to a dashboard (can be screenshots), SQL queries in BigQuery, or a Python notebook that tells the story.


## Project Summary

1. **Primary question**:
   - Which customers have the highest lifetime revenue to date, and how often do they buy compared with the average customer?

2. **Metric definition**:
   - Lifetime value = total order revenue per customer across all recorded orders.
   - Order count = number of orders placed by each customer.
   - Average order value = lifetime value divided by order count.
   - The mart is built in [models/marts/fct_customer_lifetime_value.sql](models/marts/fct_customer_lifetime_value.sql).

3. **Example query**:
   ```sql
   select
       customer_id,
       customer_name,
       lifetime_value,
       order_count,
       average_order_value
   from {{ ref('fct_customer_lifetime_value') }}
   order by lifetime_value desc
   limit 10;
   ```

4. **Key Insights**
   - The new mart summarizes each customer by lifetime value, order count, first and last order date, and average order value.
   - This creates a simple customer lifetime value view that can be used to identify high-value customers and compare them against the broader customer base.

5. **Suggested Next Steps**
   - Add a segment such as high-value, repeat, or at-risk customers based on lifetime value and order frequency.
   - Explore whether customers with more orders also have higher average basket size or spend per order.
