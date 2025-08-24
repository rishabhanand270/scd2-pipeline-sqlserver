--DAY 2 

TRUNCATE TABLE stg_product;

INSERT INTO stg_product (product_id, product_name, price, load_date) VALUES
(1001, 'iPhone 14', 68000, '2025-08-24'), -- Price dropped
(1002, 'Galaxy S23', 65000, '2025-08-24'), -- No change
(1003, 'Pixel 8',   60000, '2025-08-24'),  -- No change
(1004, 'OnePlus 12', 55000, '2025-08-24'); -- New product