/*
===============================================================================
SQL QUESTION: 3-MONTH MOVING AVERAGE
===============================================================================

Table: monthly_sales:

month
year
total_sales

Question:
---------
Calculate the 3-month moving average of sales.


===============================================================================
SOLUTION 1: WINDOW FUNCTION — RECOMMENDED
===============================================================================
*/

SELECT
    month,
    year,
    total_sales,
    ROUND(
        AVG(total_sales) OVER (
            ORDER BY year, month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average
FROM monthly_sales
ORDER BY year, month;


/*
===============================================================================
SOLUTION 2: CORRELATED SUBQUERY
===============================================================================
*/

SELECT
    m1.year,
    m1.month,
    m1.total_sales,
    (
        SELECT AVG(m2.total_sales)
        FROM monthly_sales m2
        WHERE
            (m2.year * 12 + m2.month)
            BETWEEN
            (m1.year * 12 + m1.month - 2)
            AND
            (m1.year * 12 + m1.month)
    ) AS moving_average
FROM monthly_sales m1
ORDER BY m1.year, m1.month;