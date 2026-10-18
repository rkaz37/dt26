-- Active: 1790363319553@@127.0.0.1@5432@retail

SELECT * FROM(SELECT invoice_no, stock_code, "description", quantity, unit_price,
DENSE_RANK() OVER(PARTITION BY invoice_no ORDER BY unit_price DESC) AS price_rank FROM retail_sales
ORDER BY invoice_no ASC, price_rank ASC, stock_code ASC) AS temp_table WHERE price_rank < 6;
