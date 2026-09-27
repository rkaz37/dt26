SELECT product_name, SUM(orders.sales) FROM products 
LEFT JOIN orders ON products.product_id = orders.product_id 
GROUP BY product_name;