-- What are the names of the top 5 customers by total sales amount in the year 2023?

WITH RANKED_CUSTOMERS AS (
    SELECT
        CUSTOMER_ID,
        SUM(TOTAL_SALES_AMOUNT) AS TOTAL_SALES,
        ROW_NUMBER() OVER (ORDER BY SUM(TOTAL_SALES_AMOUNT) DESC) AS ROW_NUM  -- ASSIGN ROW NUMBERS BASED ON TOTAL SALES
    FROM HOME_ASSIGNMENT.PUBLIC.TRANSFORMED_SALES_DATA
    WHERE YEAR = 2023  -- FILTER FOR THE YEAR 2023
    GROUP BY CUSTOMER_ID
)

SELECT CUSTOMER_ID, NAME, TOTAL_SALES
FROM RANKED_CUSTOMERS
LEFT JOIN HOME_ASSIGNMENT.PUBLIC.RAW_CUSTOMER_DATA
ON CUSTOMER_ID = ID
WHERE ROW_NUM <= 5;  -- SELECT ONLY THE TOP 5 PRODUCTS BASED ON THEIR RANK

-- OUTPUT
-- CUSTOMER_ID	NAME	        TOTAL_SALES
-- 2077	        0Ck7rIvcqI	    1318.43
-- 2001	        KlqmuPHoZ5	    1246.16
-- 2028	        j7lXV1P2Mo	    1141.54
-- 2023	        LiLQy22BYT	    1038.73
-- 2015	        miTbp86xy6	    957.79