-- Active: 1790363319553@@127.0.0.1@5432@retail

SELECT invoice_no, stock_code, "description", quantity, unit_price, amount,
ROW_NUMBER() OVER(PARTITION BY invoice_no ORDER BY amount DESC) AS row_num
FROM(SELECT invoice_no, stock_code, "description", quantity, unit_price, 
SUM(quantity * unit_price) OVER(PARTITION BY invoice_no, stock_code) AS amount FROM retail_sales) AS temp_table;

--pre zaznamy, kde je rovnaky datum a cas faktury nie je specifikovane podla coho sa maju radit, takze mam trocha nepresny vysledok