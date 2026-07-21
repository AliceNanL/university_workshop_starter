
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


## Updates

1. **Primary questrion**:
   - 
   - 


2. **Key Insights**
   - 

3. **Suggested Next Steps**
   - 
