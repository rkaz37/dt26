WITH cte1 AS (
    SELECT customer_type, SUM(total_amount) AS revenue FROM flourmills_sales GROUP BY customer_type
), cte2 AS (
    SELECT customer_type, revenue, SUM(revenue) OVER () AS total_revenue, ROUND(revenue * 100.0 / SUM(revenue) OVER (), 2) AS revenue_percentage FROM cte1
)

SELECT * FROM cte2 ORDER BY revenue DESC;