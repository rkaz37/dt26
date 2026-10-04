--7
SELECT region, SUM(orders.sales) AS total_sales FROM customers 
JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;
--8
SELECT customer_name, COUNT(orders.*) AS order_count FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customer_name;
--9
SELECT category, AVG(orders.discount) AS average_discount FROM products 
LEFT JOIN orders ON products.product_id = orders.product_id 
GROUP BY category
ORDER BY category ASC;
-- stlpec category ma len 1 hodnotu, tak davam dotaz aj so sub_category
SELECT sub_category, AVG(orders.discount) AS average_discount FROM products 
LEFT JOIN orders ON products.product_id = orders.product_id 
GROUP BY sub_category
ORDER BY sub_category ASC;
--10
SELECT customer_name, SUM(orders.sales) AS total_sales FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customer_name
HAVING SUM(orders.sales) > 2000;
--11
SELECT region, SUM(orders.sales) AS total_sales, AVG(orders.discount) AS average_discount, COUNT(orders.*) AS total_orders FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;
--12
SELECT region,  
COUNT(CASE WHEN orders.sales > 1000 THEN 1 END) AS high_value, 
COUNT(CASE WHEN orders.sales < 1000 THEN 1 END) AS low_value
FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id GROUP BY region;
--13
SELECT customer_name, SUM(orders.sales) AS total_sales, AVG(orders.discount) AS average_discount, COUNT(orders.*) AS total_orders, 
CASE 
    WHEN SUM(orders.sales) > 2500 THEN 'VIP' 
    ELSE 'REGULAR'
END AS customer_rank
FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customer_name
ORDER BY COALESCE(SUM(orders.sales), 0) DESC; --pouzitie coalesce, lebo zakaznici s 0 objednavkami by boli prvi v poradi
