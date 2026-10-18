-- Active: 1790363319553@@127.0.0.1@5432@superstore
SELECT customer_name, order_id, order_date FROM(SELECT customer_name, order_id, order_date,
ROW_NUMBER() OVER(PARTITION BY customer_name ORDER BY order_date DESC) AS row_num FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id) AS temp_table WHERE row_num < 3;
