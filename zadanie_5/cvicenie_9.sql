-- Active: 1790363319553@@127.0.0.1@5432@retail

SELECT * FROM (SELECT invoice_no, stock_code, "description", quantity, unit_price, amount,
ROW_NUMBER() OVER(PARTITION BY invoice_no ORDER BY amount DESC) AS row_num
FROM(SELECT invoice_no, stock_code, "description", quantity, unit_price, 
SUM(quantity * unit_price) OVER(PARTITION BY invoice_no, stock_code) AS amount FROM retail_sales) AS temp_table) AS temp2_table WHERE row_num < 4;
