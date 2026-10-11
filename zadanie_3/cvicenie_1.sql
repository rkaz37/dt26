-- Active: 1790363319553@@127.0.0.1@5432@superstore
CREATE OR REPLACE VIEW high_value_customers AS
SELECT customers.customer_id, customer_name, SUM(orders.sales) FROM customers 
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
HAVING SUM(orders.sales) > 2000;

SELECT * FROM high_value_customers;