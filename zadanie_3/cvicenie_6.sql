CREATE INDEX idx_orders_region_category ON orders(customer_id, order_date);

SELECT * FROM orders JOIN customers ON orders.customer_id = customers.customer_id WHERE customers.region = 'West' AND order_date > '2024-01-01';