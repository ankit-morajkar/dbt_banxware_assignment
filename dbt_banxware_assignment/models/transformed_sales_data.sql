-- models/transformed_sales_data.sql

{{ config(materialized='table') }}  -- Materialize as a table

WITH transformed_data AS (
    SELECT
        order_id,
        customer_id,
        product_id,
        quantity,
        price,
        quantity * price AS total_sales_amount,  -- Calculate total sales amount
        TO_DATE(order_date, 'MM/DD/YYYY') AS order_date_converted,  -- Convert order_date to DATE with MM/DD/YYYY format
        EXTRACT(YEAR FROM TO_DATE(order_date, 'MM/DD/YYYY')) AS year,   -- Extract year
        EXTRACT(MONTH FROM TO_DATE(order_date, 'MM/DD/YYYY')) AS month, -- Extract month
        EXTRACT(DAY FROM TO_DATE(order_date, 'MM/DD/YYYY')) AS day      -- Extract day
    FROM {{ ref('raw_sales_data') }}  -- Reference the raw sales data
)

SELECT * FROM transformed_data