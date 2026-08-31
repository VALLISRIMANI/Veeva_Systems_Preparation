/*
===============================================================================
SQL QUESTION: CUSTOMERS BY CITY WHO BOUGHT PRODUCT P001
===============================================================================

Tables:

customers:
cust_id
name
city

sales:
sales_id
cust_id
prod_id

Question:
---------
Find the number of customers from each city who bought product P001.


===============================================================================
SOLUTION 1: JOIN + GROUP BY
===============================================================================
*/

SELECT
    c.city,
    COUNT(DISTINCT c.cust_id) AS customers_count
FROM customers c
JOIN sales s
    ON c.cust_id = s.cust_id
WHERE s.prod_id = 'P001'
GROUP BY c.city
ORDER BY c.city;


/*
===============================================================================
SOLUTION 2: SUBQUERY
===============================================================================
*/

SELECT
    city,
    COUNT(*) AS customers_count
FROM customers
WHERE cust_id IN (
    SELECT cust_id
    FROM sales
    WHERE prod_id = 'P001'
)
GROUP BY city
ORDER BY city;


/*
===============================================================================
SOLUTION 3: EXISTS
===============================================================================
*/

SELECT
    c.city,
    COUNT(*) AS customers_count
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM sales s
    WHERE s.cust_id = c.cust_id
      AND s.prod_id = 'P001'
)
GROUP BY c.city
ORDER BY c.city;