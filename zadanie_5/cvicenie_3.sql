SELECT stock_code, country, invoice_date, quantity,
ROUND(AVG(quantity) OVER (PARTITION BY stock_code ORDER BY invoice_date RANGE BETWEEN INTERVAL '7 days' PRECEDING AND CURRENT ROW), 2) AS avg_quantity_7_days
FROM retail_sales ORDER BY stock_code ASC, country ASC, invoice_date ASC;

SELECT stock_code, AVG(quantity) FROM retail_sales GROUP BY stock_code;