SELECT region, SUM(orders.sales) AS total_sales, AVG(orders.discount) AS average_discount, COUNT(orders.*) AS total_orders FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;