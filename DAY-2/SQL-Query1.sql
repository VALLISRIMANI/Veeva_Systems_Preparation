/*
===============================================================================
SQL QUESTION: Orders — Daily and Monthly Aggregation
===============================================================================

Consider the following Orders table:

Orders:
-------
id | order_date | order_amount


I. Write a SQL query to find the total amount of orders per day.

Expected output:

order_date | total_amount


II. Write a SQL query to find the total number of orders per month.

Expected output:

month | total_orders
*/

/*
===============================================================================
I. TOTAL AMOUNT OF ORDERS PER DAY
===============================================================================
*/

-- SOLUTION 1: GROUP BY date
-- Your solution is correct.

SELECT
    order_date,
    SUM(order_amount) AS total_amount
FROM Orders
GROUP BY order_date
ORDER BY order_date;


-- SOLUTION 2: GROUP BY using column position
-- Shorter, but less readable.

SELECT
    order_date,
    SUM(order_amount) AS total_amount
FROM Orders
GROUP BY 1
ORDER BY 1;


/*
===============================================================================
II. TOTAL NUMBER OF ORDERS PER MONTH
===============================================================================
*/


-- SOLUTION 1: YEAR + MONTH

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    YEAR(order_date),
    MONTH(order_date);


-- SOLUTION 2: DATE_FORMAT() — MySQL
-- Produces a single year-month value such as 2026-08.

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;