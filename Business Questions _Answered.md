# Amber and Ash Coffee: Business Analysis Report

---

### Q1: Estimated Coffee Consumers by City (Sorted by Rank)
**Business Question:** How many people in each city are estimated to consume coffee, given that 25% of the population does?

#### SQL Query
```sql
SELECT
    city_name,
    ROUND((population * 0.25) / 1000000, 2) AS coffee_consumers_in_millions,
    city_rank
FROM city
ORDER BY 3 ASC;
```

#### Results

| city_name | coffee_consumers_in_millions | city_rank |
|-----------|------------------------------|-----------|
| Bangalore | 3.08 | 1 |
| Mumbai | 5.1 | 2 |
| Delhi | 7.75 | 3 |
| Hyderabad | 2.5 | 4 |
| Ahmedabad | 2.08 | 5 |
| Chennai | 2.78 | 6 |
| Kolkata | 3.73 | 7 |
| Jaipur | 1.0 | 8 |
| Pune | 1.88 | 9 |
| Surat | 1.8 | 10 |

---

### Q2: Total Revenue in Q4 2023
**Business Question:** What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

#### SQL Query
```sql
SELECT
    ci.city_name,
    SUM(total) AS total_revenue
FROM sales AS sa
JOIN customers AS c ON sa.customer_id = c.customer_id
JOIN city AS ci ON ci.city_id = c.city_id
WHERE YEAR(sale_date) = 2023 AND QUARTER(sale_date) = 4
GROUP BY 1
ORDER BY 2 DESC;
```

#### Results

| city_name | total_revenue |
|-----------|---------------|
| Pune | 434330 |
| Chennai | 302500 |
| Bangalore | 270780 |
| Jaipur | 248580 |
| Delhi | 238490 |
| Kanpur | 71890 |
| Mumbai | 71340 |

---

### Q3: Product Sales Volume
**Business Question:** How many units for each coffee product have been sold?

#### SQL Query
```sql
SELECT 
    p.product_name,
    COUNT(s.sale_id) AS total_units
FROM products AS p
LEFT JOIN sales AS s ON s.product_id = p.product_id
GROUP BY 1
ORDER BY 2 DESC;
```

#### Results

| product_name | total_units |
|--------------|-------------|
| Cold Brew Coffee Pack (6 Bottles) | 1326 |
| Ground Espresso Coffee (250g) | 1271 |
| Instant Coffee Powder (100g) | 1226 |
| Coffee Beans (500g) | 1218 |
| Tote Bag with Coffee Design | 776 |

---

### Q4: Average Sales per Customer per City
**Business Question:** What is the average sales amount per customer in each city?

#### SQL Query
```sql
SELECT 
    ci.city_name,
    SUM(s.total) AS Total_sales,
    COUNT(DISTINCT s.customer_id) AS total_customer,
    ROUND(SUM(s.total) / COUNT(DISTINCT s.customer_id), 2) AS Avg_Sales_per_customer
FROM sales AS s
JOIN customers AS c ON s.customer_id = c.customer_id
JOIN city AS ci ON ci.city_id = c.city_id
GROUP BY 1
ORDER BY 2 DESC;
```

#### Results

| city_name | Total_sales | total_customer | Avg_Sales_per_customer |
|-----------|-------------|----------------|------------------------|
| Pune | 1258290 | 52 | 24197.88 |
| Chennai | 944120 | 42 | 22479.05 |
| Bangalore | 860110 | 39 | 22054.1 |
| Jaipur | 803450 | 69 | 11644.2 |
| Delhi | 750420 | 68 | 11035.59 |

---

### Q5: Market Penetration (Population vs. Customers)
**Business Question:** Provide a list of cities along with their populations and estimated coffee consumers.

#### SQL Query
```sql
SELECT 
    city_name,
    ROUND((population * 0.25) / 1000000, 2) AS coffee_consumers_in_millions,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM city
JOIN customers ON city.city_id = customers.city_id
GROUP BY 1, 2
ORDER BY 2 DESC;
```

#### Results

| city_name | coffee_consumers_in_millions | unique_customers |
|-----------|------------------------------|------------------|
| Delhi | 7.75 | 68 |
| Mumbai | 5.1 | 27 |
| Kolkata | 3.73 | 28 |
| Bangalore | 3.08 | 39 |
| Chennai | 2.78 | 42 |

---

### Q6: Top 3 Selling Products by City
**Business Question:** What are the top 3 selling products in each city based on sales volume?

#### SQL Query
```sql
SELECT * FROM (
    SELECT 
        ci.city_name,
        p.product_name,
        COUNT(s.sale_id) AS sales_volume,
        DENSE_RANK() OVER(PARTITION BY ci.city_name ORDER BY COUNT(s.sale_id) DESC) AS Rankings
    FROM sales AS s
    JOIN products AS p ON s.product_id = p.product_id
    JOIN customers AS c ON s.customer_id = c.customer_id
    JOIN city AS ci ON ci.city_id = c.city_id
    GROUP BY 1, 2
) AS t1
WHERE Rankings <= 3;
```

#### Results

| city_name | product_name | sales_volume | Rankings |
|-----------|--------------|--------------|----------|
| Ahmedabad | Cold Brew Coffee Pack (6 Bottles) | 40 | 1 |
| Ahmedabad | Coffee Beans (500g) | 35 | 2 |
| Ahmedabad | Instant Coffee Powder (100g) | 26 | 3 |
| Bangalore | Cold Brew Coffee Pack (6 Bottles) | 197 | 1 |

---

### Q7: Unique Customers by City
**Business Question:** How many unique customers are there in each city who have purchased coffee products?

#### Results

| city_name | Unique_customer |
|-----------|-----------------|
| Jaipur | 69 |
| Delhi | 68 |
| Pune | 52 |
| Chennai | 42 |
| Bangalore | 39 |

---

### Q8: Average Sale vs. Average Rent per Customer
**Business Question:** Find each city and their average sale per customer and avg rent per customer.

#### SQL Query
```sql
SELECT 
    ci.city_name,
    ROUND(SUM(s.total) / COUNT(DISTINCT s.customer_id), 2) AS avg_sale_per_cus,
    ROUND(AVG(ci.estimated_rent) / COUNT(DISTINCT s.customer_id), 2) AS avg_rent_per_cus
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN city ci ON c.city_id = ci.city_id
GROUP BY 1
ORDER BY 2 DESC;
```

#### Results

| city_name | avg_sale_per_cus | avg_rent_per_cus |
|-----------|------------------|------------------|
| Pune | 24197.88 | 294.23 |
| Chennai | 22479.05 | 407.14 |
| Bangalore | 22054.1 | 761.54 |

---

### Q9: Monthly Sales Growth Rate
**Business Question:** Percentage growth (or decline) in sales over different monthly periods.

#### SQL Query
```sql
WITH Growth_ratio AS (
    SELECT 
        ci.city_name,
        MONTH(sale_date) AS Month,
        YEAR(sale_date) AS Year,
        SUM(s.total) AS Current_month_sales,
        LAG(SUM(s.total)) OVER(PARTITION BY ci.city_name ORDER BY YEAR(sale_date), MONTH(sale_date)) AS last_month_sales
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN city ci ON c.city_id = ci.city_id
    GROUP BY 1, 2, 3
)
SELECT *, ROUND((Current_month_sales - last_month_sales) / last_month_sales * 100, 2) AS Growth_ratio
FROM Growth_ratio
WHERE last_month_sales IS NOT NULL;
```

#### Results

| city_name | Month | Year | Current_sales | Growth_ratio (%) |
|-----------|-------|------|---------------|------------------|
| Ahmedabad | 11 | 2023 | 21250 | 94.06 |
| Jaipur | 10 | 2023 | 22230 | 50.92 |
| Pune | 7 | 2023 | 54460 | 69.29 |

---

### Q10: Top 3 Recommended Cities for Expansion
**Business Question:** Identify top 3 cities based on highest sales, rent, and market potential.

#### SQL Query
```sql
WITH customer_table AS (
    SELECT ci.city_name, COUNT(DISTINCT s.customer_id) AS tx_customers, SUM(s.total) AS total_revenue
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN city ci ON c.city_id = ci.city_id
    GROUP BY 1
),
city_rent AS (
    SELECT city_name, estimated_rent, ROUND((population * 0.25) / 1000000, 3) AS Estimated_Consumers_M
    FROM city
)
SELECT cr.city_name, cr.estimated_rent AS total_rent, ct.total_revenue, cr.Estimated_Consumers_M, ct.tx_customers
FROM city_rent cr
JOIN customer_table ct ON cr.city_name = ct.city_name
ORDER BY 3 DESC
LIMIT 3;
```

#### Results

| city_name | total_rent | total_revenue | Estimated_Consumers (M) | tx_customers |
|-----------|------------|---------------|-------------------------|--------------|
| Pune | 15300 | 1258290 | 1.875 | 52 |
| Chennai | 17100 | 944120 | 2.775 | 42 |
| Bangalore | 29700 | 860110 | 3.075 | 39 |
