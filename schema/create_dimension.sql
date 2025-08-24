-- Dimension table (SCD Type 2)
CREATE TABLE dim_product (
    surrogate_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id    INT,
    product_name  VARCHAR(100),
    price         DECIMAL(10,2),
    start_date    DATE,
    end_date      DATE,
    is_current    CHAR(1) -- 'Y' or 'N'
);