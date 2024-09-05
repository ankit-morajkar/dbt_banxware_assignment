Decision Log for dbt Project: Banxware Assignment

This document outlines the key decisions made during the process of ingesting, transforming, and analyzing sales data using dbt and Snowflake.

1. Data Ingestion Strategy
Save sales.csv and customers.csv in .\data folder of the project
Decision: Use dbt seed functionality to load sales.csv and customers.csv into Snowflake as raw data tables.
Outcome: CSV files are loaded into Snowflake under the table names SALES and CUSTOMERS.

2. Table Renaming
Decision: Use dbt models to create tables raw_sales_data and raw_customer_data from the raw seed data.
Rationale: dbt models provide a flexible way to transform and materialize data while keeping the raw files (sales.csv and customers.csv) unchanged. This allows the raw data to remain intact for future analysis or transformations.
Outcome: The tables raw_sales_data and raw_customer_data are created in SQL.

3. Transformation table
Decision: Use dbt models to organize transformations and keep raw data separate from transformed data.
Rationale: By using dbt models, we can clearly separate raw data from transformed data.
Outcome: Models were created for raw data ingestion (raw_sales_data and raw_customer_data) and for transformations (transformed_sales_data), enabling structured analysis.

4. Handling Date Fields
Decision: Use the TO_DATE() function to convert the order_date field from VARCHAR to a DATE format.
Rationale: The order_date field in the raw_sales_data table was stored as a string in MM/DD/YYYY format. To extract year, month, and day components, it was necessary to convert the field to a valid DATE format.
Outcome: The order_date field was converted using TO_DATE(order_date, 'MM/DD/YYYY'), and the EXTRACT() function was then used to pull out the year, month, and day.

5. Calculating Total Sales Amount
Decision: Create a new field total_sales_amount by multiplying the quantity and price fields in the raw_sales_data table.
Rationale: The sales team needed to analyze total sales per order. Therefore, calculating the total_sales_amount for each order was necessary for aggregation and reporting.
Outcome: The total_sales_amount was successfully calculated using quantity * price.

6. Materialization Strategy
Decision: Materialize the transformed data as tables instead of views.
Rationale: Since the data would be queried multiple times and undergo analysis, materializing the transformed models as tables helps improve query performance in Snowflake by persisting the data in the database.
Outcome: The transformed sales data (transformed_sales_data) was materialized as a table using the materialized='table' configuration.

7. Querying the Top 5 Products and Customers Using ROW_NUMBER()
Decision: Use the ROW_NUMBER() window function to identify the top 5 products or customers by total sales amount in 2023.
Rationale: The ROW_NUMBER() function provides an efficient way to rank products based on total sales, allowing for a dynamic top-N ranking without hardcoding any logic.
Outcome: The top 5 products by total sales were successfully queried using the ROW_NUMBER() function.

8. Final Deliverables
Decision: Queries for specific business needs (Top 5 Products, Top 5 Customers, etc.) were saved in individual .sql files for easy execution and documentation.
Rationale: Organizing SQL queries in a modular way helps streamline the process for future updates and auditing.
Outcome: Separate .sql files were created for each query and saved in the queries/ folder.
