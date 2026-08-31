/*
===============================================================================
SQL QUESTION: AVERAGE MONTHLY SALES REVENUE
===============================================================================

Consider the following table:

sales:

sales_id
product_id
sale_date
sale_price

Question:
---------
Write a SQL query to find average monthly sales revenue for each product.


===============================================================================
SOLUTION 1: GROUP BY MONTH — RECOMMENDED
===============================================================================

-- This calculates the average sale price for each product in each month.
*/

SELECT
    product_id,
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(sale_price) AS average_monthly_sales
FROM sales
GROUP BY
    product_id,
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    product_id,
    year,
    month;


/*
IMPORTANT:
----------

This solution is correct if the intended meaning is:

"Find the average sale value for each product per month."

For example:

Product 101 in January:
    100
    200
    300

AVG = 200


===============================================================================
SOLUTION 2: MONTHLY REVENUE FIRST, THEN AVERAGE
===============================================================================

If the interviewer literally means:

"Calculate the average MONTHLY REVENUE for each product"

then we need two steps:

Step 1:
    Calculate total revenue for each product in each month.

Step 2:
    Calculate the average of those monthly revenues for each product.

*/

SELECT
    product_id,
    AVG(monthly_revenue) AS average_monthly_revenue
FROM (
    SELECT
        product_id,
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        SUM(sale_price) AS monthly_revenue
    FROM sales
    GROUP BY
        product_id,
        YEAR(sale_date),
        MONTH(sale_date)
) AS MonthlySales
GROUP BY product_id;


/*
===============================================================================
SOLUTION 3: USING DATE_FORMAT() — MySQL
===============================================================================

-- A simpler way to represent year + month.
*/

SELECT
    product_id,
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    AVG(sale_price) AS average_monthly_sales
FROM sales
GROUP BY
    product_id,
    DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY
    product_id,
    sale_month;