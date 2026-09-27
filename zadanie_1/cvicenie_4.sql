SELECT region, SUM(orders.sales) FROM customers 
JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;