--CREATE TABLE
CREATE TABLE sales_data (
    state TEXT,
    city TEXT,
    order_date DATE,
    quarter TEXT,
    week INT,
    seller_name TEXT,
    location TEXT,
    category TEXT,
    product_name TEXT,
    gender TEXT,
    price_inr INT,
    rating DECIMAL(2,1),
    rating_count INT
);

--PRINT DATA 
SELECT * FROM sales_data;

--Top 5 Products by Revenue
SELECT product_name,
       SUM(price_inr) AS revenue
FROM sales_data
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 5;

--Monthly Sales Trend
SELECT 
    DATE_TRUNC('month', "order_date"::date) AS month,
    SUM(price_inr) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month;

--Best Performing Sellers
SELECT seller_name,
       SUM(price_inr) AS total_revenue
FROM sales_data
GROUP BY seller_name
ORDER BY total_revenue DESC
LIMIT 10;

--Top Cities by Sales
SELECT city,
       SUM(price_inr) AS total_sales
FROM sales_data
GROUP BY city
ORDER BY total_sales DESC;

--Highest Rated Categories
SELECT category,
       ROUND(AVG(rating),2) AS avg_rating
FROM sales_data
GROUP BY category
ORDER BY avg_rating DESC;

--Weekly Sales Trend
SELECT week,
       SUM(price_inr) AS weekly_sales
FROM sales_data
GROUP BY week
ORDER BY week;

--Products with Most Reviews
SELECT product_name,
       SUM(rating_count) AS total_reviews
FROM sales_data
GROUP BY product_name
ORDER BY total_reviews DESC
LIMIT 10;


--Multivariate Analysis Queries


--Price vs Rating Relationship
SELECT price_inr, rating
FROM sales_data;

--Category vs Avg Price vs Avg Rating
SELECT 
    category,
    AVG(price_inr) AS avg_price,
    AVG(rating) AS avg_rating
FROM sales_data
GROUP BY category;

--State + Category Sales Analysis
SELECT state, category,
       SUM(price_inr) AS total_sales
FROM sales_data
GROUP BY state, category
ORDER BY state, total_sales DESC;



