SELECT DISTINCT product_category FROM flourmills_sales
WHERE EXISTS
(SELECT 1 FROM flourmills_sales HAVING COUNT(DISTINCT region) > 3) ORDER BY product_category ASC;