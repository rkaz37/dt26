SELECT * FROM(SELECT customer_id, invoice_no, invoice_date, quantity,
LEAD(invoice_date) OVER (PARTITION BY customer_id ORDER BY invoice_date) AS next_invoice_date,
LEAD(invoice_date) OVER (PARTITION BY customer_id ORDER BY invoice_date)::DATE - invoice_date::DATE AS days_to_next_invoice 
FROM retail_sales ORDER BY days_to_next_invoice DESC) AS temp_table WHERE next_invoice_date IS NOT NULL;