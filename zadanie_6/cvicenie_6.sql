SELECT customer_id, customer_name, last_order_date, latest_order_date
FROM(SELECT DISTINCT * 
FROM(SELECT orders.customer_id, customer_name, MAX(order_date) OVER (PARTITION BY orders.customer_id) AS last_order_date,
MAX(order_date) OVER() AS latest_order_date  FROM customers
JOIN orders on customers.customer_id = orders.customer_id) AS temp_table) AS temp2_table WHERE latest_order_date - last_order_date > 90;