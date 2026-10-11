CREATE OR REPLACE VIEW regional_monthly_sales AS
SELECT customers.region, DATE_TRUNC('month', order_date) AS "month", SUM(sales) FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.region, "month"
ORDER BY customers.region DESC;

SELECT * FROM regional_monthly_sales;