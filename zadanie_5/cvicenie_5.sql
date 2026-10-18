SELECT * FROM(SELECT stock_code, invoice_no,
LAG(unit_price) OVER (PARTITION BY stock_code ORDER BY invoice_date ASC) AS previous_price, unit_price AS current_price,
unit_price - LAG(unit_price, 1) OVER (PARTITION BY stock_code) AS price_difference
FROM retail_sales ORDER BY invoice_date ASC) AS temp_table WHERE price_difference IS NOT NULL AND price_difference != 0;