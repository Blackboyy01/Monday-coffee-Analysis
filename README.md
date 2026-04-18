# Monday-Coffee-Sales

# Monday Coffee — Sales & Market Expansion Analysis

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data_Analysis-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Window Functions](https://img.shields.io/badge/Window_Functions-CTEs-003B57?style=for-the-badge)
![Data Cleaning](https://img.shields.io/badge/Data_Cleaning-Validation-003B57?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

> A SQL-based business intelligence project analysing coffee sales data across Indian cities to drive market expansion decisions.

-----

## 📋 Table of Contents

- [Executive Summary](#1-executive-summary)
- [Key Insights](#2-key-insights)
  - [Revenue Performance](#21-revenue-performance)
  - [Customer Value & Spend](#22-customer-value--spend)
  - [Product Portfolio](#23-product-portfolio)
  - [Market Penetration](#24-market-penetration)
  - [Sales Growth Momentum](#25-sales-growth-momentum)
- [Strategic Recommendations](#3-strategic-recommendations)
- [Conclusion](#4-conclusion)
- [Problem Statement](#-problem-statement)
- [Project Objectives](#-project-objectives)
- [Project Overview](#-project-overview)
  - [Database Schema](#database-schema)
  - [Key Questions](#key-questions)
- [Key Findings & Recommendations](#-key-findings--recommendations)
- [Tools & Technologies](#️-tools--technologies)
- [Author](#-author)

-----

## MONDAY COFFEE

### Business Performance & Expansion Strategy

*Executive Summary | Board Presentation*

|**₹3.86M+** Total Revenue (All-Time)|**₹1.44M** Q4 2023 Revenue|**Cold Brew** Top-Selling Product|**10** Cities Tracked|
|------------------------------------|--------------------------|---------------------------------|---------------------|
|*Across all cities*                 |*Top 7 cities*            |*1,326 units sold*               |*Across India*       |

-----

## 1. Executive Summary

Monday Coffee has generated **₹3.86M+** in cumulative revenue, with Q4 2023 contributing **₹1.44M** (~37%), signaling strong recent momentum. Performance is split across a two-tier market structure: high-value cities and high-volume but lower-yield cities.

**Pune, Chennai, and Bangalore** form the high-value cluster, driven by superior customer economics. Pune leads with ₹1.26M revenue and the highest average spend per customer (₹24,197), while Chennai and Bangalore maintain similarly strong spending levels (₹22K per customer). In contrast, Delhi and Jaipur have the largest customer bases (68 and 69 customers respectively) but significantly lower spend (₹11K per customer), indicating weaker monetization despite scale.

Market penetration remains extremely low across major cities, highlighting substantial growth headroom. For instance, **Delhi (7.75M estimated consumers)** and **Mumbai (5.1M)** have disproportionately small active customer bases, pointing to underutilized demand. On the product side, **Cold Brew Coffee Pack (1,326 units sold)** is the leading SKU, reinforcing its role as the primary revenue driver.

Overall, Pune, Chennai, and Bangalore present the strongest expansion opportunities due to high revenue concentration, strong customer lifetime value, and favorable rent-to-revenue ratios. Meanwhile, large markets like Delhi and Mumbai require targeted customer acquisition strategies to unlock their full potential.

-----

## 2. Key Insights

### 2.1 Revenue Performance

Pune leads all cities in both total and Q4 2023 revenue, confirming its position as the highest-performing market. Chennai and Bangalore follow closely, forming a premium-revenue tier.

|**City** |**Q4 2023 Revenue (₹)**|**All-Time Revenue (₹)**|**Active Customers**|
|---------|-----------------------|------------------------|--------------------|
|Pune     |434,330                |1,258,290               |52                  |
|Chennai  |302,500                |944,120                 |42                  |
|Bangalore|270,780                |860,110                 |39                  |
|Jaipur   |248,580                |803,450                 |69                  |
|Delhi    |238,490                |750,420                 |68                  |

### 2.2 Customer Value & Spend

Average spend per customer is highest in Pune (₹24,198), Chennai (₹22,479), and Bangalore (₹22,054) — more than double the per-customer spend seen in Delhi (₹11,036) and Jaipur (₹11,644). This premium-spend behavior in the top three cities is a strong indicator of customer loyalty and product-market fit.

|**City** |**Avg. Spend / Customer (₹)**|**Avg. Rent / Customer (₹)**|**Efficiency Index**|
|---------|-----------------------------|----------------------------|--------------------|
|Pune     |24,197.88                    |294.23                      |High                |
|Chennai  |22,479.05                    |407.14                      |High                |
|Bangalore|22,054.10                    |761.54                      |Moderate            |
|Jaipur   |11,644.20                    |—                           |—                   |
|Delhi    |11,035.59                    |—                           |—                   |

### 2.3 Product Portfolio

Four core coffee products drive the overwhelming majority of sales volume. Cold Brew Coffee Pack (6 Bottles) leads with 1,326 units — a 4.3% margin over second-place Ground Espresso Coffee. Merchandise (Tote Bag) trails significantly, indicating limited appetite for non-consumable items at current pricing or placement.

|**Product**                      |**Units Sold**|**Rank**|
|---------------------------------|--------------|--------|
|Cold Brew Coffee Pack (6 Bottles)|1,326         |#1      |
|Ground Espresso Coffee (250g)    |1,271         |#2      |
|Instant Coffee Powder (100g)     |1,226         |#3      |
|Coffee Beans (500g)              |1,218         |#4      |
|Tote Bag with Coffee Design      |776           |#5      |

### 2.4 Market Penetration

Despite having the largest estimated coffee consumer base (7.75M), Delhi has only 68 active customers — a penetration rate that trails Chennai, which converts 42 customers from a base of just 2.78M. This signals a structural under-performance in Delhi relative to market size and represents a material opportunity.

|**City** |**Est. Coffee Consumers (M)**|**Active Customers**|**Penetration Signal**|
|---------|-----------------------------|--------------------|----------------------|
|Delhi    |7.75                         |68                  |Under-penetrated      |
|Mumbai   |5.10                         |27                  |Under-penetrated      |
|Kolkata  |3.73                         |28                  |Low                   |
|Bangalore|3.08                         |39                  |Moderate              |
|Chennai  |2.78                         |42                  |Strong                |

### 2.5 Sales Growth Momentum

Month-on-month sales growth data highlights strong positive momentum in select cities. Ahmedabad recorded 94% growth in November 2023, Jaipur 51% in October 2023, and Pune 69% in July 2023. These spikes may reflect seasonal demand, promotional activity, or new customer acquisition — all warranting further investigation to assess repeatability.

-----

## 3. Strategic Recommendations

Based on analysis of revenue performance, customer economics, market penetration, and operational cost efficiency, the following five actions are recommended for Board consideration:

**1. Prioritize Expansion into Pune, Chennai & Bangalore**
These three cities deliver the highest revenue, strongest customer spend, and favorable rent economics. Pune’s rent-per-customer of just ₹294 versus a ₹24,198 average spend creates a compelling unit economics case. Board should approve dedicated expansion budgets for new outlets or increased marketing investment in this tier.

**2. Activate Delhi’s Untapped Market Potential**
Delhi has India’s largest estimated coffee consumer base (7.75M) yet ranks 5th in revenue. A targeted acquisition campaign — through digital channels, corporate partnerships, or localized promotions — could yield significant revenue uplift with minimal incremental infrastructure investment.

**3. Double Down on Cold Brew & Core Coffee Products**
Cold Brew Coffee Pack and Ground Espresso account for over half of all units sold. Inventory planning, supplier negotiations, and promotional calendars should be anchored around these products. Consider bundling strategies to increase average order value and cross-sell Instant Coffee Powder and Beans alongside top sellers.

**4. Review & Reposition the Merchandise Line**
The Tote Bag (776 units) underperforms the core coffee portfolio by 41%. The Board should review the merchandising strategy — either repositioning tote bags as gift-set add-ons, renegotiating supplier costs to improve margins, or discontinuing if contribution remains below threshold.

**5. Formalize Growth Tracking & Monthly Revenue Reporting**
Growth spikes of 50–94% in cities like Ahmedabad and Jaipur suggest untapped momentum that is not yet being systematically captured or amplified. A monthly performance dashboard presented to the Board — covering revenue growth, customer acquisition, and per-city profitability — will enable faster, data-driven capital allocation decisions.

-----

## 4. Conclusion

Monday Coffee is well-positioned for growth. The data confirms a premium market exists, concentrated in Pune, Chennai, and Bangalore, where strong customer economics justify accelerated investment. Simultaneously, large, under-served markets in Delhi and Mumbai offer meaningful near-term upside. Executing against these five recommendations will strengthen Monday Coffee’s competitive position, improve capital efficiency, and build a foundation for disciplined, data-led national expansion.

*Report by Adebisi Farouk Boluwatife | Data Analyst*

-----

## 🧩 Problem Statement

Monday, a coffee retailer that began selling its products in 2023, is looking to expand its physical presence by opening new café locations across India. Despite growing online sales, the company lacks clarity on which cities offer the strongest market opportunity — based on actual consumer demand, revenue performance, and cost efficiency.

The core business challenge is: **which cities should Monday Coffee prioritise for physical expansion, and why?**

Without a structured analysis of sales performance, customer behaviour, and market sizing, the expansion strategy risks being driven by assumption rather than data.

-----

## 🎯 Project Objectives

1. **Quantify the coffee consumer market** in each city based on population estimates.
1. **Evaluate revenue performance** by city, including quarterly and monthly growth trends.
1. **Identify top-performing products** by sales volume, both overall and at a city level.
1. **Assess customer value** by measuring average sales per customer across cities.
1. **Benchmark operating costs** by comparing average rent per customer against revenue generated.
1. **Recommend the top 3 cities** for physical store expansion based on data-driven insights.

-----

## 📊 Project Overview

This project is a business intelligence task supporting a strategic expansion decision. Using a relational database of city demographics, product listings, customer records, and transaction data, SQL queries were written to answer **10** key business questions spanning market sizing, revenue analysis, product performance, and cost efficiency.

### Database Schema

The project uses four relational tables:

|Table      |Description                                                          |
|-----------|---------------------------------------------------------------------|
|`city`     |City demographics including population, estimated rent, and city rank|
|`products` |Product catalogue with pricing                                       |
|`customers`|Customer records linked to cities                                    |
|`sales`    |Transaction records with date, product, customer, revenue, and rating|

### Key Questions

|# |Question                                                            |Business Value            |
|--|--------------------------------------------------------------------|--------------------------|
|1 |Estimated coffee consumers per city (25% of population)             |Market sizing             |
|2 |Total revenue by city in Q4 2023                                    |Seasonal performance      |
|3 |Units sold per product                                              |Product demand analysis   |
|4 |Average sales per customer by city                                  |Customer value benchmark  |
|5 |Cities by population, estimated consumers, and unique customers     |Market penetration        |
|6 |Top 3 selling products per city                                     |Localised product strategy|
|7 |Unique customers per city                                           |Customer footprint        |
|8 |Average rent vs average sale per customer                           |Cost-efficiency analysis  |
|9 |Monthly sales growth rate by city                                   |Revenue trend analysis    |
|10|Top 3 cities by total sales, rent, customers, and consumer potential|Expansion recommendation  |

-----

## 🔍 Key Findings & Recommendations

Based on the analysis, the following three cities are recommended for physical store expansion:

### 1. Pune

- Lowest average rent per customer, making it the most cost-efficient market.
- Highest total revenue across all cities, demonstrating strong and proven demand.

### 2. Delhi

- Largest estimated coffee consumer base at approximately **7.7 million** potential consumers.
- Second-highest customer count, indicating strong market penetration potential.

### 3. Jaipur

- Highest number of unique customers among all cities analysed.
- Strong existing customer relationships provide a solid foundation for a physical presence.

-----

## 🛠️ Tools & Technologies

|Tool                   |Purpose                                                    |
|-----------------------|-----------------------------------------------------------|
|**MySQL**              |Database creation, data storage, and query execution       |
|**MySQL (DDL & DML)**  |Schema design, data relationships, and analytical queries  |
|**Window Functions**   |`DENSE_RANK()`, `LAG()` for ranking and trend analysis     |
|**CTEs**               |Complex multi-step query structuring                       |
|**Aggregate Functions**|`SUM()`, `COUNT()`, `ROUND()`, `AVG()` for business metrics|

-----

## 👤 Author

**[Adebisi Farouk]**  
Data Analyst / Business Analyst | SQL · Data Analysis · Business Intelligence
