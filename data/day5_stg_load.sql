--DAY 5

TRUNCATE TABLE stg_product;

INSERT INTO stg_product (product_id, product_name, price, load_date) VALUES
(1001, 'iPhone 14 Plus', 66000, '2025-08-27'),
(1002, 'Galaxy S23', 63000, '2025-08-27'),
(1003, 'Pixel 8',   62000, '2025-08-27'),
(1004, 'OnePlus 12 Pro', 57000, '2025-08-27'),
(1005, 'Realme GT', 40000, '2025-08-27');