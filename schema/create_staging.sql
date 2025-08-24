-- Staging table (daily snapshot)
CREATE TABLE stg_product (
    product_id   INT,
    product_name VARCHAR(100),
    price        DECIMAL(10,2),
    load_date    DATE
);