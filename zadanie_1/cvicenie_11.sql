SELECT region, SUM(orders.sales), AVG(orders.discount), COUNT(orders.*) FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;