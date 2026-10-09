# COVID-19 Global Data Exploration (SQL Server / T-SQL)

An exploratory data analysis (EDA) project analyzing global COVID-19 trends using Microsoft SQL Server (T-SQL).

This repository focuses on extracting meaningful public health insights from large-scale data, addressing data type inconsistencies, tracking vaccination rollouts, and preparing data structures for Business Intelligence tools.

---

## 🧭 Project Roadmap

- [x] **Phase 1: Exploratory Data Analysis & Aggregation (T-SQL)**
- [ ] **Phase 2: Interactive BI Dashboard (Power BI / Tableau)**
- [ ] **Phase 3: Correlation & Statistical Modeling (Python / Pandas / Seaborn)**

---

## 🛠️ SQL Skills & Concepts Applied

* **Joins:** Multi-conditional `INNER JOIN` (`location` and `date`) combining death statistics and vaccination records.
* **Data Filtering & Integrity:** `WHERE` clauses, pattern matching with `LIKE`, filtering out pre-aggregated continent rows with `IS NOT NULL`, and division-by-zero protection using `NULLIF`.
* **Data Type Handling:** Explicit conversions using `CAST` to handle string-stored numeric data.
* **Aggregations & Calculations:** Multi-level summaries using `GROUP BY`, `ORDER BY`, `MAX()`, and `SUM()`.
* **Window Functions:** Running cumulative sums (`OVER (PARTITION BY ... ORDER BY ...)`) to track daily vaccine rollout.
* **Advanced Query Structuring:** 
  * Common Table Expressions (`WITH ... AS`) to compute dynamic population ratios.
  * Temporary Tables (`#TempTable`) for intermediate analytical steps.
  * Views (`CREATE VIEW`) to expose curated data layers ready for BI ingestion.

---

## 📊 Key Insights Explored

1. **Likelihood of dying if infected:** Tracking the Case Fatality Rate over time per country.
2. **Infection rates:** Percentage of the population infected by country.
3. **Global impact:** Ranking countries and continents by highest total death counts.
4. **Vaccination rollout:** Tracking the progressive percentage of vaccinated population per country.

---

## 📂 Repository Structure

* `DataExplorationProjectCovid.sql`: Full documented SQL script with all queries and operations.
* `README.md`: Overview and documentation of the exploration phase.
