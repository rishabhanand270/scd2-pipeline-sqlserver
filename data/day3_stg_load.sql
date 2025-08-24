--DAY 3

TRUNCATE TABLE stg_product;

INSERT INTO stg_product (product_id, product_name, price, load_date) VALUES
(1001, 'iPhone 14', 66000, '2025-08-25'),
(1002, 'Galaxy S23', 65000, '2025-08-25'),
(1003, 'Pixel 8',   62000, '2025-08-25'),
(1004, 'OnePlus 12', 55000, '2025-08-25');