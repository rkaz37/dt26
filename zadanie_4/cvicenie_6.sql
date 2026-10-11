WITH RECURSIVE date_rec AS (

    SELECT MIN(sale_date) AS min_sale_date, MAX(sale_date) AS max_sale_date FROM flourmills_sales

    UNION ALL

    SELECT min_sale_date + 1, max_sale_date FROM date_rec WHERE min_sale_date < max_sale_date

)
SELECT min_sale_date FROM date_rec ORDER BY min_sale_date ASC;

SELECT MIN(sale_date) AS min_sale_date, MAX(sale_date) AS max_sale_date FROM flourmills_sales 