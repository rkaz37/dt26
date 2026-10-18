-- Active: 1790363319553@@127.0.0.1@5432@retail
-- Active: 1790363319553@@127.0.0.1@5432@postgres
CREATE DATABASE retail;
CREATE TABLE retail_sales
(      
    invoice_no VARCHAR(20),
    stock_code VARCHAR(50),
    "description" TEXT,
    quantity INT,
    invoice_date TEXT,
    unit_price NUMERIC(10, 2),
    customer_id  INT,
    country VARCHAR(100)
);

SET DateStyle TO 'DMY';

SHOW DateStyle;

SELECT to_timestamp(
    invoice_date,
    'DD.MM.YYYY HH24:MI'
)
FROM retail_sales;

SELECT * FROM retail_sales;

DROP TABLE retail_sales;

SELECT
    MIN(invoice_date) AS earliest_date,
    MAX(invoice_date) AS latest_date
FROM retail_sales;

SELECT COUNT(*) AS missing_dates
FROM retail_sales
WHERE invoice_date IS NULL;

SELECT COUNT(*) AS total_rows
FROM retail_sales;

ALTER TABLE retail_sales
ALTER COLUMN invoice_date TYPE TIMESTAMP
USING TO_TIMESTAMP(invoice_date, 'DD.MM.YYYY HH24:MI');