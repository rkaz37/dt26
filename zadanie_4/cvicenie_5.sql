WITH cte AS (
    SELECT customer_id, product_name, sale_date, total_amount, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY sale_date DESC) AS "rank" FROM flourmills_sales
)

SELECT customer_id, product_name, sale_date, total_amount FROM cte WHERE "rank" = 1 ORDER BY customer_id ASC;