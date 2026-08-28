/*
===============================================================================
SQL QUESTION: 3rd Highest Price × Quantity
===============================================================================

Given a Product table with the following columns:

| Column       | Description         |
|--------------|---------------------|
| ProductId    | Product ID          |
| ProductName  | Name of the product |
| Price        | Price of the product|
| Quantity     | Quantity of product |
| Category     | Product category    |

Question:
---------
Write a SQL query to find the name of the product that has the 3rd highest
value of Price × Quantity among all products.

The value that must be ranked is: Price * Quantity

Example:
--------
| Product | Price | Quantity | Price × Quantity |
|---------|------:|---------:|-----------------:|
| A       |   100 |        5 |              500 |
| B       |   200 |        4 |              800 |
| C       |   150 |        6 |              900 |
| D       |    50 |       20 |             1000 |

Descending order:
1000 (D)
 900 (C)
 800 (B)  <-- 3rd highest
 500 (A)

Answer: B
*/


/*
===============================================================================
SOLUTION 1: NORMAL QUERY — ORDER BY + LIMIT/OFFSET
===============================================================================

Works in MySQL/PostgreSQL and similar databases.

Returns the 3rd row after sorting Price * Quantity in descending order.

If duplicate calculated values should count as separate rows, this is a
simple and direct solution.
*/

SELECT ProductName, Price * Quantity AS TotalValue
FROM Product
ORDER BY Price * Quantity DESC
LIMIT 1 OFFSET 2;


/*
Alternative syntax using LIMIT 2, 1 (MySQL):

SELECT ProductName, Price * Quantity AS TotalValue
FROM Product
ORDER BY Price * Quantity DESC
LIMIT 2, 1;
*/


/*
===============================================================================
SOLUTION 2: SUBQUERY + LIMIT/OFFSET
===============================================================================

A clean subquery approach for the 3rd row.

This is especially useful when you want to separate calculation/sorting from
the outer SELECT.
*/

SELECT ProductName, TotalValue
FROM (
    SELECT ProductName, Price * Quantity AS TotalValue
    FROM Product
    ORDER BY Price * Quantity DESC
    LIMIT 1 OFFSET 2
) AS RankedProducts;


/*
===============================================================================
SOLUTION 3: ROW_NUMBER()
===============================================================================

ROW_NUMBER() assigns a unique sequential number to every row.

Use this when "3rd highest" means the 3rd row after sorting, even when
duplicate calculated values exist.
*/

SELECT ProductName, TotalValue
FROM (
    SELECT
        ProductName,
        Price * Quantity AS TotalValue,
        ROW_NUMBER() OVER (
            ORDER BY Price * Quantity DESC
        ) AS rn
    FROM Product
) AS RankedProducts
WHERE rn = 3;


/*
===============================================================================
SOLUTION 4: DENSE_RANK()
===============================================================================

DENSE_RANK() gives the same rank to tied values without leaving gaps.

Example:

Value    Dense Rank
1000          1
900           2
900           2
800           3

This is usually the BEST window-function solution when "3rd highest" means
the 3rd DISTINCT highest value.
*/

SELECT ProductName, TotalValue
FROM (
    SELECT
        ProductName,
        Price * Quantity AS TotalValue,
        DENSE_RANK() OVER (
            ORDER BY Price * Quantity DESC
        ) AS dr
    FROM Product
) AS RankedProducts
WHERE dr = 3;