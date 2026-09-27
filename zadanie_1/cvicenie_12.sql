SELECT region,  
COUNT(CASE WHEN orders.sales > 1000 THEN 1 END) AS high_value, 
COUNT(CASE WHEN orders.sales < 1000 THEN 1 END) AS low_value
FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;