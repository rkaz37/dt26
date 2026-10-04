SELECT product_name, region, total_amount, 
(SELECT min(total_amount) FROM flourmills_sales f2 WHERE f1.region = f2.region) AS region_min_amount FROM flourmills_sales f1;