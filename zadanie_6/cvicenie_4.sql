-- Active: 1790363319553@@127.0.0.1@5432@superstore
SELECT "month", monthly_sales,
LAG(monthly_sales, 1) OVER (ORDER BY month) AS prev_month_sales,
LEAD(monthly_sales, 1) OVER (ORDER BY month) AS next_month_sales 
FROM(SELECT DISTINCT * 
FROM(SELECT EXTRACT(MONTH FROM order_date) AS "month", SUM(sales) OVER(PARTITION BY EXTRACT(MONTH FROM order_date)) AS monthly_sales FROM orders)
AS temp_table ORDER BY "month" ASC) AS temp2_table;