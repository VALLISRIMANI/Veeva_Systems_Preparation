/*
===============================================================================
SQL QUESTION: CUSTOMERS, PURCHASES AND PRODUCTS
===============================================================================

Consider the following tables:

Customer:
---------
cust_id
cust_name
region


Purchases:
----------
purchase_id
cust_id
product_name


Product:
--------
product_name
price


===============================================================================
I. FILTER CUSTOMERS WHO:
===============================================================================

1. Have purchased either product 'A' or product 'B'
2. AND are located in the West or North region.


===============================================================================
SOLUTION 1: USING JOINS
===============================================================================
*/

SELECT DISTINCT
    c.cust_name
FROM Customer c
JOIN Purchases p
    ON c.cust_id = p.cust_id
JOIN Product pr
    ON p.product_name = pr.product_name
WHERE pr.product_name IN ('A', 'B')
  AND c.region IN ('West', 'North');


/*
===============================================================================
SOLUTION 2: USING SUBQUERY
===============================================================================
*/

SELECT DISTINCT
    cust_name
FROM Customer
WHERE region IN ('West', 'North')
  AND cust_id IN (
      SELECT cust_id
      FROM Purchases
      WHERE product_name IN ('A', 'B')
  );


/*
===============================================================================
I. ALTERNATIVE: EXISTS
===============================================================================
*/

SELECT
    c.cust_name
FROM Customer c
WHERE c.region IN ('West', 'North')
  AND EXISTS (
      SELECT 1
      FROM Purchases p
      WHERE p.cust_id = c.cust_id
        AND p.product_name IN ('A', 'B')
  );


/*
===============================================================================
II. FILTER CUSTOMERS WHO HAVE PURCHASED PRODUCTS BETWEEN 1 LAKH AND 2 LAKH
===============================================================================

Price range:

100000 <= price <= 200000


===============================================================================
SOLUTION 1: USING JOINS
===============================================================================
*/

SELECT DISTINCT
    c.cust_name
FROM Customer c
JOIN Purchases p
    ON c.cust_id = p.cust_id
JOIN Product pr
    ON p.product_name = pr.product_name
WHERE pr.price BETWEEN 100000 AND 200000;


/*
===============================================================================
SOLUTION 2: USING SUBQUERIES
===============================================================================
*/

SELECT DISTINCT
    cust_name
FROM Customer
WHERE cust_id IN (
    SELECT cust_id
    FROM Purchases
    WHERE product_name IN (
        SELECT product_name
        FROM Product
        WHERE price BETWEEN 100000 AND 200000
    )
);


/*
===============================================================================
SOLUTION 3: USING EXISTS
===============================================================================
*/

SELECT
    c.cust_name
FROM Customer c
WHERE EXISTS (
    SELECT 1
    FROM Purchases p
    JOIN Product pr
        ON p.product_name = pr.product_name
    WHERE p.cust_id = c.cust_id
      AND pr.price BETWEEN 100000 AND 200000
-- );