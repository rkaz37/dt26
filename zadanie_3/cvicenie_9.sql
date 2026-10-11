CREATE PROCEDURE get_customer_sales(p_customer_id VARCHAR(20))
LANGUAGE plpgsql
AS $procedure$
DECLARE v_total NUMERIC(10,2);
DECLARE v_total2 INTEGER;
BEGIN
    SELECT SUM(sales) INTO v_total FROM orders WHERE customer_id = p_customer_id;

    RAISE NOTICE '% sum is %', p_customer_id, v_total;

    SELECT COUNT(*) INTO v_total2 FROM orders WHERE customer_id = p_customer_id;

    RAISE NOTICE '%', v_total2;
END;
$procedure$;
CALL get_customer_sales('C001');