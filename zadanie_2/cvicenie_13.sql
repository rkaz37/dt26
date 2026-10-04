SELECT region FROM flourmills_sales f1 WHERE NOT EXISTS
(SELECT 1 FROM flourmills_sales f2 WHERE f2.region = f1.region AND EXTRACT(YEAR FROM sale_date) = 2024);