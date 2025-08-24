CREATE OR ALTER PROCEDURE sp_load_dim_product
AS
BEGIN
    SET NOCOUNT ON;

    -- Identify changes
    IF OBJECT_ID('tempdb..#changes') IS NOT NULL DROP TABLE #changes;

    SELECT
        s.product_id,
        s.product_name,
        s.price,
        s.load_date
    INTO #changes
    FROM stg_product s
    LEFT JOIN dbo.dim_product d
        ON s.product_id = d.product_id
       AND d.is_current = 'Y'
    WHERE d.product_id IS NULL
       OR (d.product_name <> s.product_name OR d.price <> s.price);

    -- Close off existing rows
    UPDATE d
    SET 
        d.end_date   = DATEADD(DAY, -1, c.load_date),
        d.is_current = 'N'
    FROM dbo.dim_product d
    JOIN #changes c ON d.product_id = c.product_id
    WHERE d.is_current = 'Y';

    -- Insert new rows
    INSERT INTO dbo.dim_product
        (product_id, product_name, price, start_date, end_date, is_current)
    SELECT 
        c.product_id,
        c.product_name,
        c.price,
        c.load_date,
        '9999-12-31',
        'Y'
    FROM #changes c;
END

