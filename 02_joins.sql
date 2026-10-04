--2
SELECT order_id, customers.customer_name, sales FROM orders JOIN customers ON orders.customer_id = customers.customer_id WHERE sales > 500;
--3
SELECT order_id, customers.customer_name, products.category, sales FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id 
JOIN products ON orders.product_id = products.product_id; 
--4
SELECT region, SUM(orders.sales) FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY region;
--5
SELECT product_name, SUM(orders.sales) AS total_sales FROM products
LEFT JOIN orders ON products.product_id = orders.product_id
GROUP BY product_name;
--6
SELECT customers.customer_name, order_id, sales FROM orders 
FULL OUTER JOIN customers ON orders.customer_id = customers.customer_id;
