-- COFFEE SALES DATA ANALYSIS

-- CREATING DATABASE
CREATE DATABASE Monday_Coffee;
-- CREATING TABLES
-- -- Import Rules
-- 1st import to city
-- 2nd import to products
-- 3rd import to customers
-- 4th import to sales

-- CITY TABLE
CREATE TABLE city
(
	city_id	INT PRIMARY KEY,
	city_name VARCHAR(15),	
	population	BIGINT,
	estimated_rent	FLOAT,
	city_rank INT
);

-- PRODUCT TABLE
CREATE TABLE products
(
	product_id	INT PRIMARY KEY,
	product_name VARCHAR(35),	
	Price float
);

-- CUSTOMERS TABLE
CREATE TABLE customers
(
	customer_id INT PRIMARY KEY,	
	customer_name VARCHAR(25),	
	city_id INT,
	CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- SALES TABLE
CREATE TABLE sales
(
	sale_id	INT PRIMARY KEY,
	sale_date	date,
	product_id	INT,
	customer_id	INT,
	total FLOAT,
	rating INT,
	CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products(product_id),
	CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);
USE Monday_Coffee;
SHOW TABLES;

SELECT* FROM city;
SELECT* FROM products;
SELECT* FROM customers;
SELECT* FROM sales;

-- COUNT NUMBER OF DATA OF EACH TABLE
SELECT COUNT(*) FROM city;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM sales;

-- REPORTS AND DATA ANALYSIS
-- Q.1 How many people in each city are estimated to consume coffee, given that 25% of the population does?
SELECT
city_name,
ROUND(
(population*0.25)/1000000,2) AS coffee_consumers_in_millions,
city_rank
FROM city
ORDER BY 2 DESC;

-- Q.2 What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

SELECT
ci.city_name,
SUM(total) AS total_revenue
FROM sales AS sa
JOIN customers AS c
ON sa.customer_id=c.customer_id
JOIN city AS ci
ON ci.city_id=c.city_id
WHERE 
YEAR(sale_date) = 2023
AND
QUARTER(sale_date) = 4
GROUP BY 1
ORDER BY 2 DESC ;

-- Q.3 How many units for each coffee products have been sold?
SELECT
product_name,
COUNT(sale_id) AS total_units
FROM products AS p
LEFT JOIN sales AS s
ON p.product_id=s.product_id
GROUP BY 1
ORDER BY 2 DESC;

-- Q.4 What is the average sales amount per customer in each city
SELECT
ci.city_name,
SUM(sa.total)AS Total_sales,
COUNT(DISTINCT sa.customer_id) AS total_customer,
ROUND(
SUM(sa.total)/COUNT(DISTINCT sa.customer_id),2) AS Avg_Sales_per_customer
FROM sales AS sa
JOIN customers AS c
ON sa.customer_id=c.customer_id
JOIN city AS ci
ON ci.city_id=c.city_id
GROUP BY 1
ORDER BY 4 DESC;

-- Q.5 Provide a List of cities along with their populations and estimated coffee consumers

WITH city_table AS
(SELECT
city_name,
population,
ROUND(
(population*0.25)/1000000,2) AS coffee_consumers_in_millions
FROM city
),
customer_table AS
(SELECT
ci.city_name,
COUNT(DISTINCT c.customer_id) AS unique_customers
FROM sales AS s
JOIN customers AS c
ON s.customer_id=c.customer_id
JOIN city AS ci
ON c.city_id=ci.city_id
GROUP BY 1
ORDER BY 2 DESC)
SELECT
customer_table.city_name,
city_table.coffee_consumers_in_millions,
customer_table.unique_customers
FROM city_table
JOIN customer_table
ON city_table.city_name=customer_table.city_name;

-- Q6 What are the top 3 selling products in each city based on sales volume?
SELECT*
FROM
(
SELECT
p.product_name,
ci.city_name,
COUNT(s.sale_id) AS sales_volume,
DENSE_RANK() OVER(PARTITION BY ci.city_name ORDER BY COUNT(s.sale_id) DESC ) AS Rankings
FROM products p
JOIN sales AS s
ON p.product_id=s.product_id
JOIN customers c
ON s.customer_id=c.customer_id
JOIN city ci
ON c.city_id=ci.city_id
GROUP BY 1,2
) AS R1
WHERE Rankings <= 3;

-- Q7 How many unique customers are there in each city who have purcashed coffee products?
SELECT
DISTINCT ci.city_name,
COUNT(DISTINCT s.customer_id) AS Unique_customer
FROM products p
JOIN sales s
ON p.product_id=s.product_id
JOIN customers c
ON s.customer_id=c.customer_id
JOIN city ci 
ON ci.city_id=c.city_id
GROUP BY 1;

-- Q.8 Find each city and their average sale per customer and avg rent per customer
WITH
customer_table 
 AS
(
SELECT
DISTINCT ci.city_name,
COUNT(DISTINCT s.customer_id) AS tx_customers,
ROUND(SUM(s.total)/ COUNT(DISTINCT s.customer_id),2) AS Avg_Sale_per_customer
FROM sales s
JOIN customers c 
ON s.customer_id=c.customer_id
JOIN city ci 
ON c.city_id=ci.city_id
GROUP BY 1
ORDER BY 2 DESC
),
city_rent AS
(
SELECT
city_name,
estimated_rent
FROM city
)
SELECT
cr.city_name,
cr.estimated_rent,
ct.tx_customers,
ROUND(cr.estimated_rent/ct.tx_customers,2) AS  Avg_rent_per_customer,
ct.Avg_Sale_per_customer
FROM  city_rent as cr
JOIN customer_table as ct
ON cr.city_name = ct.city_name
ORDER BY 4 DESC;

-- Q9 Sales growth rate: Calculate the percentage growth(or decline) in sales over different times period (monthly) by each city
WITH monthly_sales AS (
    SELECT
        ci.city_name,
        MONTH(s.sale_date) AS Month,
        YEAR(s.sale_date) AS Year,
        SUM(s.total) AS total_sales
    FROM sales s 
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN city ci ON c.city_id = ci.city_id
    GROUP BY 1,2,3
),

Growth_ratio AS (
    SELECT 
        city_name,
        Month,
        Year,
        total_sales AS Current_month_sales,
        LAG(total_sales,1) OVER(
            PARTITION BY city_name 
            ORDER BY Year, Month
        ) AS last_month_sales
    FROM monthly_sales
)

SELECT
    city_name,
    Month,
    Year,
    Current_month_sales,
    last_month_sales,
    ROUND(
        (Current_month_sales - last_month_sales) / last_month_sales * 100,
        2
    ) AS Growth_ratio
FROM Growth_ratio
WHERE 
last_month_sales IS NOT NULL;


-- Q10 Identify top 3 city based on highest sales,return city name,total sale,total rent,total customers,estimated coffee consumers

WITH customer_table AS (
    SELECT
        ci.city_name,
        COUNT(DISTINCT s.customer_id) AS tx_customers,
        SUM(s.total) AS total_revenue,
        ROUND(SUM(s.total) / COUNT(DISTINCT s.customer_id), 2) AS Avg_Sale_per_customer
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN city ci ON c.city_id = ci.city_id
    GROUP BY 1
),

city_rent AS (
    SELECT
        city_name,
        estimated_rent,
        ROUND((population * 0.25) / 1000000, 3) AS Estimated_Coffee_consumers_in_millions
    FROM city
)

SELECT
    cr.city_name,
    cr.estimated_rent AS total_rent,
    ct.total_revenue,
    cr.Estimated_Coffee_consumers_in_millions,
    ct.tx_customers
FROM city_rent cr
JOIN customer_table ct
ON cr.city_name = ct.city_name
ORDER BY 3 DESC;

-- RECOMENDATIONS
-- CITY 1: PUNE
-- 1. AVG rent per customer is very less,
-- 2. Highest total revenue

-- CITY 2: DELHI
-- 1. It has the highest estimated coffee consumer which is aproximately 7.7M
-- 2. It has the second highest customers after Jaipur

-- CITY 3: JAIPUR
-- 1. Highest customers: 69







