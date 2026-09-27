SELECT customer_name, COUNT(orders.*) FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customer_name;