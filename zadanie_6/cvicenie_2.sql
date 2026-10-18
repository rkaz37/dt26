-- Active: 1790363319553@@127.0.0.1@5432@superstore
SELECT region, customer_name, total_profit,
RANK() OVER(PARTITION BY region ORDER BY total_profit DESC) AS profit_rank,
DENSE_RANK() OVER(PARTITION BY region ORDER BY total_profit DESC) AS profit_dense_rank
FROM(SELECT DISTINCT * 
FROM(SELECT region, customer_name, SUM(profit) OVER(PARTITION BY customer_name) AS total_profit FROM customers JOIN orders on customers.customer_id = orders.customer_id)
AS temp_table) AS temp2_table;
