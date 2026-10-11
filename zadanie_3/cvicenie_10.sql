CREATE PROCEDURE apply_regional_discount(region_name VARCHAR(20), discount_rate NUMERIC(10,2))
LANGUAGE plpgsql
AS $procedure$
DECLARE new_sales NUMERIC(10,2);
BEGIN
    SELECT sales * (1 - discount_rate) INTO new_sales FROM orders WHERE region = region_name;

    RAISE NOTICE 'you have applied % discount on % region, new sales are %', discount_rate, region_name, new_sales;
END;
$procedure$;

DROP PROCEDURE apply_regional_discount;
CALL apply_regional_discount('West', 0.10);

--nechapem zadaniu, taktiez zadanie splieta nezmysly