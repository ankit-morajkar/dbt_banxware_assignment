-- models/raw_customer_data.sql
{{ config(materialized='table') }}  -- Ensures that this model is materialized as a table

SELECT *
FROM {{ ref('customers') }}  -- Refers to the `customers.csv` seed table
