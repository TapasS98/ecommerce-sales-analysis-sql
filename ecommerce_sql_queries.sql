-- E-commerce Sales Analysis SQL Project
-- Database: ecommerce_db

-- ====================================
-- 1. DATABASE SETUP
-- ====================================

-- Create Database
CREATE DATABASE ecommerce_db;

-- Use the database
USE ecommerce_db;

-- Create Table
CREATE TABLE ecommerce_sales
(
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

-- ====================================
-- 2. DATA EXPLORATION & CLEANING
-- ====================================

-- Check total number of records
SELECT COUNT(*) AS total_records 
FROM ecommerce_sales;

-- Check for unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers 
FROM ecommerce_sales;

-- Check for unique products
SELECT COUNT(DISTINCT product_id) AS unique_products 
FROM ecommerce_sales;

-- View all distinct categories
SELECT DISTINCT category 
FROM ecommerce_sales;

-- View all distinct regions
SELECT DISTINCT region 
FROM ecommerce_sales;

-- Check for NULL values
SELECT 
    COUNT(*) AS rows_with_nulls
FROM ecommerce_sales
WHERE 
    order_id IS NULL OR order_date IS NULL OR ship_date IS NULL OR 
    customer_id IS NULL OR customer_name IS NULL OR segment IS NULL OR 
    country IS NULL OR city IS NULL OR state IS NULL OR region IS NULL OR 
    product_id IS NULL OR category IS NULL OR sub_category IS NULL OR 
    product_name IS NULL OR sales IS NULL OR quantity IS NULL OR 
    discount IS NULL OR profit IS NULL;

-- Delete records with NULL values (if any)
DELETE FROM ecommerce_sales
WHERE 
    order_id IS NULL OR order_date IS NULL OR ship_date IS NULL OR 
    customer_id IS NULL OR customer_name IS NULL OR segment IS NULL OR 
    country IS NULL OR city IS NULL OR state IS NULL OR region IS NULL OR 
    product_id IS NULL OR category IS NULL OR sub_category IS NULL OR 
    product_name IS NULL OR sales IS NULL OR quantity IS NULL OR 
    discount IS NULL OR profit IS NULL;

-- ====================================
-- 3. DATA ANALYSIS & BUSINESS QUESTIONS
-- ====================================

-- Q1: Retrieve all orders placed in December 2023
SELECT *
FROM ecommerce_sales
WHERE YEAR(order_date) = 2023 AND MONTH(order_date) = 12;

-- Q2: Find all orders from the 'Technology' category where sales exceeded $1000
SELECT *
FROM ecommerce_sales
WHERE category = 'Technology' AND sales > 1000
ORDER BY sales DESC;

-- Q3: Calculate total sales and profit for each category
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC;

-- Q4: Find the average discount given for each product category
SELECT 
    category,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage
FROM ecommerce_sales
GROUP BY category
ORDER BY avg_discount_percentage DESC;

-- Q5: Identify the top 10 most profitable products
SELECT 
    product_name,
    category,
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS times_ordered
FROM ecommerce_sales
GROUP BY product_name, category, sub_category
ORDER BY total_profit DESC
LIMIT 10;

-- Q6: Find total sales by region and segment
SELECT 
    region,
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_sales
GROUP BY region, segment
ORDER BY region, total_sales DESC;

-- Q7: Calculate the average delivery time (ship_date - order_date) for each region
SELECT 
    region,
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 2) AS avg_delivery_days
FROM ecommerce_sales
GROUP BY region
ORDER BY avg_delivery_days;

-- Q8: Find customers who have placed more than 10 orders
SELECT 
    customer_id,
    customer_name,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_spent
FROM ecommerce_sales
GROUP BY customer_id, customer_name
HAVING COUNT(*) > 10
ORDER BY total_orders DESC;

-- Q9: Identify loss-making products (negative profit)
SELECT 
    product_name,
    category,
    COUNT(*) AS times_sold,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY product_name, category
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- Q10: Calculate monthly sales trend for 2023
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales), 2) AS monthly_sales,
    ROUND(SUM(profit), 2) AS monthly_profit,
    COUNT(*) AS total_orders
FROM ecommerce_sales
WHERE YEAR(order_date) = 2023
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Q11: Find the top 5 cities by sales volume
SELECT 
    city,
    state,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY city, state, region
ORDER BY total_sales DESC
LIMIT 5;

-- Q12: Calculate the profit margin (profit/sales) for each sub-category
SELECT 
    sub_category,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM ecommerce_sales
WHERE sales > 0
GROUP BY sub_category, category
ORDER BY profit_margin_percentage DESC;

-- Q13: Find seasonal trends - sales by quarter
SELECT 
    YEAR(order_date) AS year,
    QUARTER(order_date) AS quarter,
    ROUND(SUM(sales), 2) AS quarterly_sales,
    ROUND(SUM(profit), 2) AS quarterly_profit,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY YEAR(order_date), QUARTER(order_date)
ORDER BY year, quarter;

-- Q14: Identify customers with highest lifetime value
SELECT 
    customer_id,
    customer_name,
    segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS lifetime_value,
    ROUND(AVG(sales), 2) AS avg_order_value
FROM ecommerce_sales
GROUP BY customer_id, customer_name, segment
ORDER BY lifetime_value DESC
LIMIT 20;

-- Q15: Analyze discount impact on profit
SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.1 THEN '1-10%'
        WHEN discount <= 0.2 THEN '11-20%'
        WHEN discount <= 0.3 THEN '21-30%'
        ELSE 'Above 30%'
    END AS discount_range,
    COUNT(*) AS total_orders,
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(AVG(profit), 2) AS avg_profit
FROM ecommerce_sales
GROUP BY discount_range
ORDER BY avg_profit DESC;

-- ====================================
-- 4. ADVANCED ANALYSIS
-- ====================================

-- Q16: Year-over-Year growth analysis
WITH yearly_sales AS (
    SELECT 
        YEAR(order_date) AS year,
        ROUND(SUM(sales), 2) AS total_sales
    FROM ecommerce_sales
    GROUP BY YEAR(order_date)
)
SELECT 
    year,
    total_sales,
    LAG(total_sales) OVER (ORDER BY year) AS previous_year_sales,
    ROUND(((total_sales - LAG(total_sales) OVER (ORDER BY year)) / 
           LAG(total_sales) OVER (ORDER BY year)) * 100, 2) AS yoy_growth_percentage
FROM yearly_sales
ORDER BY year;

-- Q17: Top performing products by region
WITH ranked_products AS (
    SELECT 
        region,
        product_name,
        ROUND(SUM(sales), 2) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(sales) DESC) AS rank
    FROM ecommerce_sales
    GROUP BY region, product_name
)
SELECT 
    region,
    product_name,
    total_sales
FROM ranked_products
WHERE rank <= 3
ORDER BY region, rank;

-- Q18: Customer segmentation by purchase behavior
SELECT 
    segment,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(AVG(sales), 2) AS avg_order_value,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(AVG(profit), 2) AS avg_profit_per_order
FROM ecommerce_sales
GROUP BY segment
ORDER BY total_revenue DESC;

-- Q19: Find repeat customers (ordered in multiple months)
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT DATE_FORMAT(order_date, '%Y-%m')) AS active_months,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_spent
FROM ecommerce_sales
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT DATE_FORMAT(order_date, '%Y-%m')) > 1
ORDER BY active_months DESC, total_spent DESC;

-- Q20: Product performance comparison - best vs worst
(SELECT 
    'Top 5 Best' AS performance,
    product_name,
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY product_name, category
ORDER BY total_profit DESC
LIMIT 5)

UNION ALL

(SELECT 
    'Bottom 5 Worst' AS performance,
    product_name,
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY product_name, category
ORDER BY total_profit ASC
LIMIT 5);