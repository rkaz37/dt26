-- Active: 1790363319553@@127.0.0.1@5432@retail

SELECT * FROM(SELECT country, "month", customer_id, total_amount,
DENSE_RANK() OVER(PARTITION BY country, "month" ORDER BY total_amount DESC) AS sales_rank
FROM(SELECT DISTINCT * FROM(SELECT country, EXTRACT(MONTH FROM invoice_date) AS "month", customer_id,
SUM(quantity * unit_price) OVER(PARTITION BY customer_id, EXTRACT(MONTH FROM invoice_date)) AS total_amount FROM retail_sales ORDER BY country ASC) 
AS temp_table) AS temp2_table) AS temp3_table WHERE sales_rank < 6;
