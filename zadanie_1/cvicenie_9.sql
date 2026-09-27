SELECT category, AVG(orders.discount, 2) FROM products 
LEFT JOIN orders ON products.product_id = orders.product_id 
GROUP BY category
ORDER BY category ASC;

-- category ma len 1 polozku, tak davam dotaz aj so sub_category

SELECT sub_category, AVG(orders.discount) FROM products 
LEFT JOIN orders ON products.product_id = orders.product_id 
GROUP BY sub_category
ORDER BY sub_category ASC;