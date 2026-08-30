/*
===============================================================================
SQL PRACTICE: CUSTOMERS & ORDERS
===============================================================================

Customers:
----------
cust_id | cust_name | city

Orders:
-------
ord_id | cust_id | order_date | order_amount


QUESTIONS
---------

I.   Find the total number of orders per customer, excluding orders made in June.

II.  Find the customer(s) with the highest total order amount.

III. Find all orders made on July 4th, 2023 and July 6th, 2027.

IV.  Find the average order value for each city.

V.   Identify customers who have not placed any orders.

VI.  Find the month with the highest total order amount.

VII. Display the top 2 customers with the most orders in the last 30 days.

VIII. List all orders placed on '2023-07-04' and '2027-07-06' along with
     their corresponding customer names.
*/


/*
===============================================================================
I. TOTAL NUMBER OF ORDERS PER CUSTOMER, EXCLUDING JUNE
===============================================================================
*/

-- SOLUTION 1: GROUP BY + MONTH()

SELECT
    cust_id,
    COUNT(*) AS total_orders
FROM Orders
WHERE MONTH(order_date) <> 6
GROUP BY cust_id;


-- SOLUTION 2: JOIN with Customers
-- Use this when you also want the customer name.

SELECT
    c.cust_id,
    c.cust_name,
    COUNT(o.ord_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
WHERE MONTH(o.order_date) <> 6
GROUP BY c.cust_id, c.cust_name;


-- SOLUTION 3: Subquery
-- Find the customers after calculating their order counts.

SELECT
    cust_id,
    total_orders
FROM (
    SELECT
        cust_id,
        COUNT(*) AS total_orders
    FROM Orders
    WHERE MONTH(order_date) <> 6
    GROUP BY cust_id
) AS CustomerOrders;


/*
===============================================================================
II. CUSTOMER(S) WITH THE HIGHEST TOTAL ORDER AMOUNT
===============================================================================
*/

-- SOLUTION 1: GROUP BY + HAVING + Subquery

SELECT
    c.cust_id,
    c.cust_name
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name
HAVING SUM(o.order_amount) = (
    SELECT MAX(total_amount)
    FROM (
        SELECT SUM(order_amount) AS total_amount
        FROM Orders
        GROUP BY cust_id
    ) AS CustomerTotals
);

/*
===============================================================================
III. ORDERS ON JULY 4, 2023 AND JULY 6, 2027
===============================================================================
*/

-- SOLUTION 1: IN

SELECT * FROM Orders WHERE order_date IN ('2023-07-04', '2027-07-06');


-- SOLUTION 2: OR

SELECT * FROM Orders WHERE order_date = '2023-07-04' OR order_date = '2027-07-06';


-- SOLUTION 3: DATE() 

SELECT * FROM Orders WHERE DATE(order_date) IN ('2023-07-04', '2027-07-06');


/*
IMPORTANT:
----------
If order_date contains only DATE values, Solution 1 is preferable.

If order_date contains values such as:

2023-07-04 10:30:00
2023-07-04 15:45:00

then:

WHERE order_date = '2023-07-04'

may not match those rows.

In that case, use DATE(order_date).
*/


/*
===============================================================================
IV. AVERAGE ORDER VALUE FOR EACH CITY
===============================================================================
*/

-- SOLUTION 1: JOIN + AVG()

SELECT
    c.city,
    AVG(o.order_amount) AS average_order_value
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.city;


-- SOLUTION 2: LEFT JOIN
-- Includes cities that have customers but no orders.
-- Their average will be NULL.

SELECT
    c.city,
    AVG(o.order_amount) AS average_order_value
FROM Customers c
LEFT JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.city;


-- SOLUTION 3: GROUP BY city through a JOIN

SELECT
    c.city,
    SUM(o.order_amount) / COUNT(o.ord_id) AS average_order_value
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.city;


/*
===============================================================================
V. CUSTOMERS WHO HAVE NOT PLACED ANY ORDERS
===============================================================================
*/


-- SOLUTION 1: LEFT JOIN + IS NULL

SELECT
    c.cust_id,
    c.cust_name
FROM Customers c
LEFT JOIN Orders o
    ON c.cust_id = o.cust_id
WHERE o.ord_id IS NULL;


-- SOLUTION 2: NOT EXISTS

SELECT
    c.cust_id,
    c.cust_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.cust_id = c.cust_id
);


-- SOLUTION 3: NOT IN
-- Works when Orders.cust_id does not contain NULL values.

SELECT
    cust_id,
    cust_name
FROM Customers
WHERE cust_id NOT IN (
    SELECT cust_id
    FROM Orders
);


/*
===============================================================================
VI. MONTH WITH THE HIGHEST TOTAL ORDER AMOUNT
===============================================================================
*/

-- SOLUTION 1: GROUP BY + ORDER BY + LIMIT

SELECT
    MONTH(order_date) AS month,
    SUM(order_amount) AS total_amount
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY total_amount DESC
LIMIT 1;


-- SOLUTION 2: Subquery
-- Find the maximum monthly total.

SELECT
    MONTH(order_date) AS month,
    SUM(order_amount) AS total_amount
FROM Orders
GROUP BY MONTH(order_date)
HAVING SUM(order_amount) = (
    SELECT MAX(total_amount)
    FROM (
        SELECT
            SUM(order_amount) AS total_amount
        FROM Orders
        GROUP BY MONTH(order_date)
    ) AS MonthlyTotals
);


-- SOLUTION 3: Include YEAR
-- IMPORTANT when Orders contains multiple years.
-- Otherwise January 2023 and January 2027 would be combined.

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(order_amount) AS total_amount
FROM Orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_amount DESC
LIMIT 1;


/*
===============================================================================
VII. TOP 2 CUSTOMERS WITH MOST ORDERS IN LAST 30 DAYS
===============================================================================
*/


-- SOLUTION 1: JOIN + GROUP BY + ORDER BY

SELECT
    c.cust_id,
    c.cust_name,
    COUNT(o.ord_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY c.cust_id, c.cust_name
ORDER BY total_orders DESC
LIMIT 2;


-- SOLUTION 2: Subquery + LIMIT
-- Separates order counting from customer information.

SELECT
    c.cust_id,
    c.cust_name,
    t.total_orders
FROM Customers c
JOIN (
    SELECT
        cust_id,
        COUNT(*) AS total_orders
    FROM Orders
    WHERE order_date >= CURDATE() - INTERVAL 30 DAY
    GROUP BY cust_id
) AS t
    ON c.cust_id = t.cust_id
ORDER BY t.total_orders DESC
LIMIT 2;


-- SOLUTION 3: DENSE_RANK()
-- Use this if the interviewer wants ALL customers tied for the top 2 ranks.

SELECT
    cust_id,
    cust_name,
    total_orders
FROM (
    SELECT
        c.cust_id,
        c.cust_name,
        COUNT(o.ord_id) AS total_orders,
        DENSE_RANK() OVER (
            ORDER BY COUNT(o.ord_id) DESC
        ) AS rnk
    FROM Customers c
    JOIN Orders o
        ON c.cust_id = o.cust_id
    WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY
    GROUP BY c.cust_id, c.cust_name
) AS RankedCustomers
WHERE rnk <= 2;


/*
===============================================================================
VIII. ORDERS ON SPECIFIC DATES WITH CUSTOMER NAMES
===============================================================================
*/


-- SOLUTION 1: JOIN + IN

SELECT
    o.ord_id,
    o.order_date,
    o.order_amount,
    c.cust_id,
    c.cust_name
FROM Orders o
JOIN Customers c
    ON o.cust_id = c.cust_id
WHERE o.order_date IN ('2023-07-04', '2027-07-06');


-- SOLUTION 2: JOIN + OR

SELECT
    o.ord_id,
    o.order_date,
    o.order_amount,
    c.cust_id,
    c.cust_name
FROM Orders o
JOIN Customers c
    ON o.cust_id = c.cust_id
WHERE o.order_date = '2023-07-04'
   OR o.order_date = '2027-07-06';


-- SOLUTION 3: DATE() for DATETIME columns

SELECT
    o.ord_id,
    o.order_date,
    o.order_amount,
    c.cust_id,
    c.cust_name
FROM Orders o
JOIN Customers c
    ON o.cust_id = c.cust_id
WHERE DATE(o.order_date) IN ('2023-07-04', '2027-07-06');


===============================================================================
INTERVIEW-USEFUL EXTRA QUESTIONS
===============================================================================

/* EXTRA 1: Find customers whose total order amount is greater than the average customer order amount. */

SELECT
    c.cust_id,
    c.cust_name,
    SUM(o.order_amount) AS total_amount
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name
HAVING SUM(o.order_amount) > (
    SELECT AVG(total_amount)
    FROM (
        SELECT
            SUM(order_amount) AS total_amount
        FROM Orders
        GROUP BY cust_id
    ) AS CustomerTotals
);


/* EXTRA 2: Find the second highest total order amount among customers. Use DENSE_RANK() because this is a useful interview question.*/

SELECT
    cust_id,
    cust_name,
    total_amount
FROM (
    SELECT
        c.cust_id,
        c.cust_name,
        SUM(o.order_amount) AS total_amount,
        DENSE_RANK() OVER (
            ORDER BY SUM(o.order_amount) DESC
        ) AS rnk
    FROM Customers c
    JOIN Orders o
        ON c.cust_id = o.cust_id
    GROUP BY c.cust_id, c.cust_name
) AS RankedCustomers
WHERE rnk = 2;


/* EXTRA 3: Find the customer who placed the maximum number of orders. If multiple customers are tied, return all of them. */

SELECT
    c.cust_id,
    c.cust_name,
    COUNT(o.ord_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(o.ord_id) = (
    SELECT MAX(total_orders)
    FROM (
        SELECT
            COUNT(*) AS total_orders
        FROM Orders
        GROUP BY cust_id
    ) AS CustomerOrderCounts
);


/* EXTRA 4: Find the city having the highest total order amount. */

SELECT
    c.city,
    SUM(o.order_amount) AS total_amount
FROM Customers c
JOIN Orders o
    ON c.cust_id = o.cust_id
GROUP BY c.city
ORDER BY total_amount DESC
LIMIT 1;