# PortfolioProjects
COVID-19 global data exploration and analysis using SQL Server (T-SQL): infection and mortality rates, tracking rollouts via Window Functions, CTEs, and Views.
# COVID-19 Data Exploration (SQL Server / T-SQL)

An exploratory data analysis (EDA) project analyzing global COVID-19 trends using Microsoft SQL Server (T-SQL).

This repository is the first phase of a full data analysis cycle. The objective is to query a large public dataset, address data type inconsistencies, derive key public health indicators, and build reusable views.

---

## 🧭 Project Roadmap

- [x] **Phase 1:** Data Exploration & Aggregation with SQL Server (this repository)
- [ ] **Phase 2:** Advanced Data Cleaning (SQL)
- [ ] **Phase 3:** Correlation Analysis & Statistical Modeling (Python / Pandas / Seaborn)

---

## 🛠️ SQL Skills & Concepts Applied

- **Joins:** Multi-conditional `INNER JOIN` (`location` and `date`).
- **Data Filtering & Integrity:** `WHERE` clauses, pattern matching with `LIKE`, filtering out aggregates with `IS NOT NULL`, and handling potential division-by-zero errors via `NULLIF`.
- **Aggregations & Grouping:** `GROUP BY`, `SUM`, `MAX`.
- **Data Type Casting:** `CAST` and `CONVERT` (converting text strings to integers to prevent alphabetical sorting bugs).
- **Window Functions:** Calculating rolling totals with `SUM(...) OVER (PARTITION BY ... ORDER BY ...)`.
- **Modularity & Reusability:** 
  - Common Table Expressions (CTEs) via `WITH` to work on calculated fields.
  - Temporary Tables (`#Table`) for intermediate computations.
  - Persistent Views (`CREATE VIEW`) for saving clean analytical queries.

---

## 📌 Key Metrics & Questions Answered

1. **Daily & Total Case Fatality Rate:** Percentage of confirmed cases leading to death (`total_deaths / total_cases * 100`).
2. **Infection Rate Relative to Population:** Proportion of the population infected per country (`total_cases / population * 100`).
3. **Absolute vs. Relative Mortality:** Identifying countries with the highest absolute death counts versus those with the highest death toll relative to population.
4. **Continental vs. National Granularity:** Handling pre-aggregated regional figures (`continent IS NULL`) versus granular country-level entries.
5. **Vaccination Tracking:** Computing rolling vaccinated totals over time and evaluating country-level vaccination progress against total population.

---

## 📁 Data Source

Public COVID-19 data provided by **Our World in Data** (tables: `CovidDeaths` and `CovidVaccinations`).
