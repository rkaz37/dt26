SELECT DISTINCT product_name FROM flourmills_sales f1
WHERE EXISTS
(SELECT 1 FROM flourmills_sales f2 WHERE f1.product_name = f2.product_name HAVING COUNT(DISTINCT EXTRACT(MONTH FROM f2.sales_date)) > 1);