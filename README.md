# Amber&Ash-coffee-Sales
# Amber&Ash Coffee — Sales & Market Expansion Analysis
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data_Analysis-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Window Functions](https://img.shields.io/badge/Window_Functions-CTEs-003B57?style=for-the-badge)
![Data Cleaning](https://img.shields.io/badge/Data_Cleaning-Validation-003B57?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

> A SQL-based business intelligence project analysing coffee sales data across Indian cities to drive market expansion decisions.

---

##  Problem Statement

Amber & Ash, a coffee retailer that began selling its products in 2023, is looking to expand its physical presence by opening new café locations across India. Despite growing online sales, the company lacks clarity on which cities offer the strongest market opportunity — based on actual consumer demand, revenue performance, and cost efficiency.

The core business challenge is: **which cities should Amber & Ash Coffee prioritise for physical expansion, and why?**

Without a structured analysis of sales performance, customer behaviour, and market sizing, the expansion strategy risks being driven by assumption rather than data.

---

##  Project Objectives

1. **Quantify the coffee consumer market** in each city based on population estimates.
2. **Evaluate revenue performance** by city, including quarterly and monthly growth trends.
3. **Identify top-performing products** by sales volume, both overall and at a city level.
4. **Assess customer value** by measuring average sales per customer across cities.
5. **Benchmark operating costs** by comparing average rent per customer against revenue generated.
6. **Recommend the top 3 cities** for physical store expansion based on data-driven insights.

---

##  Project Overview

This project is a business that  is tasked with supporting a strategic expansion decision. Using a relational database of city demographics, product listings, customer records, and transaction data, SQL queries were written to answer **10** Likely business questions spanning market sizing, revenue analysis, product performance, and cost efficiency.



### Database Schema

The project uses four relational tables:

| Table | Description |
|---|---|
| `city` | City demographics including population, estimated rent, and city rank |
| `products` | Product catalogue with pricing |
| `customers` | Customer records linked to cities |
| `sales` | Transaction records with date, product, customer, revenue, and rating |

### Key Questions

| # | Question | Business Value |
|---|---|---|
| 1 | Estimated coffee consumers per city (25% of population) | Market sizing |
| 2 | Total revenue by city in Q4 2023 | Seasonal performance |
| 3 | Units sold per product | Product demand analysis |
| 4 | Average sales per customer by city | Customer value benchmark |
| 5 | Cities by population, estimated consumers, and unique customers | Market penetration |
| 6 | Top 3 selling products per city | Localised product strategy |
| 7 | Unique customers per city | Customer footprint |
| 8 | Average rent vs average sale per customer | Cost-efficiency analysis |
| 9 | Monthly sales growth rate by city | Revenue trend analysis |
| 10 | Top 3 cities by total sales, rent, customers, and consumer potential | Expansion recommendation |

---

##  Key Findings & Recommendations

Based on the analysis, the following three cities are recommended for physical store expansion:

### 1. Pune
- Lowest average rent per customer, making it the most cost-efficient market.
- Highest total revenue across all cities, demonstrating strong and proven demand.

### 2. Delhi
- Largest estimated coffee consumer base at approximately **7.7 million** potential consumers.
- Second-highest customer count, indicating strong market penetration potential.

### 3 Jaipur
- Highest number of unique customers among all cities analysed.
- Strong existing customer relationships provide a solid foundation for a physical presence.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Database creation, data storage, and query execution |
| **MySQL (DDL & DML)** | Schema design, data relationships, and analytical queries |
| **Window Functions** | `DENSE_RANK()`, `LAG()` for ranking and trend analysis |
| **CTEs** | Complex multi-step query structuring |
| **Aggregate Functions** | `SUM()`, `COUNT()`, `ROUND()`, `AVG()` for business metrics |

---

---



---

## 👤 Author

**[Adebisi Farouk]**  
Data Analyst /Business Analyst | SQL · Data Analysis · Business Intelligence  
