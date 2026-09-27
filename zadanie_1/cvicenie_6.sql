SELECT customers.customer_name, order_id, sales FROM orders 
FULL OUTER JOIN customers ON orders.customer_id = customers.customer_id;