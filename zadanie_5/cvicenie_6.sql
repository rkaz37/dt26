SELECT customer_id, total_amount,
NTILE(4) OVER (ORDER BY total_amount DESC) AS sales_quartile
FROM(SELECT DISTINCT customer_id,
SUM(quantity * unit_price) OVER(PARTITION BY customer_id) AS total_amount
FROM retail_sales AS temp_table) WHERE customer_id IS NOT NULL ORDER BY sales_quartile ASC, total_amount DESC;

SELECT DISTINCT customer_id FROM retail_sales ORDER BY customer_id DESC;