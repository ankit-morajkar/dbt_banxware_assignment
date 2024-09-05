-- models/raw_sales_data.sql
{{ config(materialized='table') }}

SELECT *
FROM {{ ref('sales') }}  -- This references the `sales.csv` seed table


