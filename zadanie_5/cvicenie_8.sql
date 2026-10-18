-- Active: 1790363319553@@127.0.0.1@5432@retail

SELECT customer_id, invoice_no, invoice_date, stock_code, "description", quantity, unit_price FROM
(SELECT customer_id, invoice_no, invoice_date, stock_code, "description", quantity, unit_price,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY invoice_date ASC) AS first_invoice FROM retail_sales) AS temp_table WHERE first_invoice = 1;

--pre zaznamy, kde je rovnaky datum a cas faktury nie je specifikovane podla coho sa maju radit, takze mam trocha nepresny vysledok