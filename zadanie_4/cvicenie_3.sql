WITH total_product_sales AS (
    SELECT product_category, product_name, SUM(total_amount) AS total_sales FROM flourmills_sales GROUP BY product_category, product_name
), category_rank AS (
    SELECT *, RANK() OVER (PARTITION BY product_category ORDER BY total_sales DESC) AS "rank" FROM total_product_sales
)

SELECT * FROM category_rank WHERE rank <= 3;