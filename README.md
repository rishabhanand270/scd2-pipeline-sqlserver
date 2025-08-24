# 📊 scd2-pipeline-sqlserver
SQL Server **Slowly Changing Dimension Type 2 (SCD2)** implementation with staging tables, historical tracking, and stored procedure automation.

---

## 🔹 Project Overview

This project demonstrates how to implement **Slowly Changing Dimension Type 2 (SCD2)** in **SQL Server** using a daily snapshot from a staging table and loading it into a dimension table with historical tracking.

- **Staging Table (`stg_product`)** → Holds daily snapshot of product data  
- **Dimension Table (`dim_product`)** → Tracks product changes over time using SCD Type 2  
- **Stored Procedure (`sp_load_dim_product`)** → Loads data from staging → dimension table  
- **Sample Data** → Day 1 to Day 5 snapshots provided to demonstrate changes  
- **Results** → Final output CSV of expected dimension table  

---

## 🔹 SCD2 Logic Implemented

1. **Check for new/changed records**  
   - New product IDs are inserted as fresh records  
   - Changes in product name or price trigger a new version  

2. **Expire old record**  
   - The previous version is updated with `end_date = (new record date - 1)`  
   - `is_current` flag set to `N`  

3. **Insert new version**  
   - A new row is inserted with `start_date`, open-ended `end_date` (`9999-12-31`), and `is_current = 'Y'`  

---

## 📂 Repository Structure

```
scd2-pipeline-sqlserver/
├── README.md
├── schema/
│   ├── create_staging.sql
│   └── create_dimension.sql
├── data/
│   ├── day1_stg_load.sql
│   ├── day2_stg_load.sql
│   ├── day3_stg_load.sql
│   ├── day4_stg_load.sql
│   └── day5_stg_load.sql
├── procedure/
│   └── sp_load_dim_product.sql
└── results/
    └── dim_product_expected.csv
```

---

## 🔹 Table Structures

### Staging Table (`stg_product`)
```sql
product_id INT,
product_name VARCHAR(100),
price DECIMAL(10,2),
load_date DATE
```

### Dimension Table (`dim_product`)
```sql
product_key INT IDENTITY PRIMARY KEY,
product_id INT,
product_name VARCHAR(100),
price DECIMAL(10,2),
start_date DATE,
end_date DATE,
is_current CHAR(1)
```

---

## ⚙️ Stored Procedure

The core of this project is **`sp_load_dim_product`**, which:

- Identifies **new or changed** products from the staging table  
- Updates existing records by setting `end_date` & `is_current = 'N'`  
- Inserts new versions with `start_date` & open `end_date (9999-12-31)`  

This demonstrates real-world **ETL logic** in a data warehouse setting.  

---

## 📊 Example Run

1. Load **Day 1 snapshot** into staging:
```sql
-- Load snapshot
:r data/day1_stg_load.sql
-- Execute SCD2 logic
EXEC sp_load_dim_product;
```

2. Repeat for **Day 2 – Day 5 snapshots** to simulate daily loads.  

3. Query **active products**:
```sql
SELECT * 
FROM dim_product 
WHERE is_current = 'Y';
```

4. Query **full history of a product**:
```sql
SELECT * 
FROM dim_product 
WHERE product_id = 1001 
ORDER BY start_date;
```

---

## 💡 Key Learning Outcomes

- Hands-on implementation of **Slowly Changing Dimension Type 2**  
- Exposure to **data warehousing concepts**  
- Writing **stored procedures** for ETL workflows  
- Organizing SQL code in a **production-ready GitHub repo**  

---

## 🔧 Tech Stack

- **MS SQL Server**  
- **T-SQL Stored Procedures**  
- **Data Warehousing Concepts (SCD2)**  

---

## 👤 Author

**Rishabh Anand**  
💼 Data Engineer | SQL | GCP | BigQuery | ETL Pipelines  
🔗 [LinkedIn](https://www.linkedin.com/in/rishabh-anand-270)  

---
