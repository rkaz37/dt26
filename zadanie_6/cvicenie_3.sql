SELECT customer_name, total_sales,
NTILE(4) OVER(ORDER BY total_sales DESC) AS quartile
FROM(SELECT DISTINCT * 
FROM(SELECT customer_name, SUM(sales) OVER(PARTITION BY customer_name) AS total_sales FROM customers JOIN orders on customers.customer_id = orders.customer_id)
AS temp_table) AS temp2_table;