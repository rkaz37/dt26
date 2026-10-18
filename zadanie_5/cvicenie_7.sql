-- Active: 1790363319553@@127.0.0.1@5432@retail

SELECT country,  "month", total_amount,
NTILE(4) OVER (PARTITION BY country ORDER BY total_amount DESC) AS sales_quartile 
FROM(SELECT DISTINCT * FROM (SELECT country, EXTRACT(MONTH FROM invoice_date) AS "month",
SUM(quantity * unit_price) OVER(PARTITION BY country, EXTRACT(MONTH FROM invoice_date)) AS total_amount FROM retail_sales) AS temp_table) AS temp_temp_table;