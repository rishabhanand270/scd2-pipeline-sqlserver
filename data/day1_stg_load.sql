--DAY 1

TRUNCATE TABLE stg_product;

INSERT INTO stg_product (product_id, product_name, price, load_date) VALUES
(1001, 'iPhone 14', 70000, '2025-08-23'),
(1002, 'Galaxy S23', 65000, '2025-08-23'),
(1003, 'Pixel 8',   60000, '2025-08-23');