WITH RECURSIVE monthly_revenue AS (
    SELECT DATE_TRUNC('month', sale_date) AS "month", SUM (total_amount) AS "revenue" FROM flourmills_sales GROUP BY DATE_TRUNC('month', sale_date)
),
ordered_months AS (
    SELECT ROW_NUMBER() OVER (ORDER BY "month") AS rn, "month", "revenue" FROM monthly_revenue
),
cumulative_target AS (

    SELECT rn, "month", revenue, revenue AS cumulative_revenue FROM ordered_months WHERE rn = 1

    UNION ALL

    SELECT om.rn, om.month, om.revenue, ct.cumulative_revenue + om.revenue FROM cumulative_target ct, ordered_months om WHERE om.rn = ct.rn + 1 AND ct.cumulative_revenue < 500000000

)
SELECT *
FROM cumulative_target
ORDER BY rn;