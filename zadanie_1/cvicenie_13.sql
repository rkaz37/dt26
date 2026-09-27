SELECT customer_name, SUM(orders.sales) AS total_sales, AVG(orders.discount) AS average_discount, COUNT(orders.*) AS total_orders, 
CASE 
    WHEN SUM(orders.sales) > 2500 THEN 'VIP' 
    ELSE 'REGULAR'
END AS customer_rank
FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customer_name
ORDER BY COALESCE(SUM(orders.sales), 0) DESC; --pouzitie coalesce, lebo zakaznici s 0 objednavkami by boli prvi v poradi