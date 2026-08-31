/*
===============================================================================
SQL QUESTION: FILTER CUSTOMERS BY TIMEZONE
===============================================================================

Consider the following table:

customers:

cust_id
first_name
last_name
email
phone_number
timezone

Question:
---------
Write a SQL query that returns all records from the customers table where the timezone field matches the pattern '%est%'.


===============================================================================
SOLUTION 1: LIKE — BEST / RECOMMENDED
===============================================================================
*/

SELECT * FROM customers WHERE timezone LIKE '%est%';


/*
===============================================================================
SOLUTION 2: LOWER() + LIKE
===============================================================================

-- Useful if you want the search to be case-insensitive explicitly.

*/

SELECT * FROM customers WHERE LOWER(timezone) LIKE '%est%';


/*
===============================================================================
SOLUTION 3: REGEXP — ALTERNATIVE
===============================================================================

-- MySQL-specific.

*/

SELECT * FROM customers WHERE timezone REGEXP 'est';