SELECT customer_name, SUM(orders.sales) FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customer_name
HAVING SUM(orders.sales) > 2000;