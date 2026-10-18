SELECT category, product_name, SUM(sales) AS product_sales, SUM(SUM(sales)) OVER (PARTITION BY category) AS category_total,
ROUND(SUM(sales) * 100.0 / SUM(SUM(sales)) OVER (PARTITION BY category), 2) AS pct_of_category
FROM orders JOIN products ON orders.product_id = products.product_id GROUP BY category, product_name;