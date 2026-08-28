/*
===============================================================================
SQL QUESTION: SalesMan and Customer
===============================================================================

Consider the following tables:

SalesMan:
---------
Id | Name | City

Customer:
---------
Id | Name | City


I. Find the number of salesmen living in the same city as Davis.

II. Find salesmen who are NOT living in the same city as Camero, Green, or Johns.


===============================================================================
I. NUMBER OF SALESMEN LIVING IN THE SAME CITY AS DAVIS
===============================================================================


-- SOLUTION 1: Subquery (Recommended)
-- Find Davis's city first, then count salesmen from that city.

SELECT COUNT(*) AS SalesMan_Count
FROM SalesMan
WHERE City = (
    SELECT City
    FROM SalesMan
    WHERE Name = 'Davis'
);


-- SOLUTION 2: JOIN
-- Join SalesMan with Davis's record based on City.

SELECT COUNT(*) AS SalesMan_Count
FROM SalesMan s
JOIN SalesMan d
    ON s.City = d.City
WHERE d.Name = 'Davis';


-- SOLUTION 3: CTE
-- First find Davis's city, then count salesmen in that city.

WITH DavisCity AS (
    SELECT City
    FROM SalesMan
    WHERE Name = 'Davis'
)
SELECT COUNT(*) AS SalesMan_Count
FROM SalesMan s
JOIN DavisCity d
    ON s.City = d.City;


-- SOLUTION 4: Window/Conditional Style
-- Useful when you want to return the city along with the count.

SELECT City, COUNT(*) AS SalesMan_Count
FROM SalesMan
WHERE City = (
    SELECT City
    FROM SalesMan
    WHERE Name = 'Davis'
)
GROUP BY City;


/*
===============================================================================
II. SALESMEN NOT LIVING IN THE SAME CITY AS CAMERO, GREEN, OR JOHNS
===============================================================================
*/


-- SOLUTION 1: NOT EXISTS (Recommended)
-- Safest and most interview-friendly solution.

SELECT s.Name
FROM SalesMan s
WHERE NOT EXISTS (
    SELECT 1
    FROM SalesMan x
    WHERE x.Name IN ('Camero', 'Green', 'Johns')
      AND x.City = s.City
);


-- SOLUTION 2: NOT IN + Subquery
-- Simple and readable.

SELECT Name
FROM SalesMan
WHERE City NOT IN (
    SELECT City
    FROM SalesMan
    WHERE Name IN ('Camero', 'Green', 'Johns')
);


-- SOLUTION 3: LEFT JOIN
-- Find matching cities using a JOIN, then keep only unmatched rows.

SELECT DISTINCT s.Name
FROM SalesMan s
LEFT JOIN SalesMan x
    ON s.City = x.City
   AND x.Name IN ('Camero', 'Green', 'Johns')
WHERE x.Id IS NULL;


-- SOLUTION 4: CTE + NOT EXISTS
-- Improves readability by separating the target cities.

WITH TargetCities AS (
    SELECT DISTINCT City
    FROM SalesMan
    WHERE Name IN ('Camero', 'Green', 'Johns')
)
SELECT s.Name
FROM SalesMan s
WHERE NOT EXISTS (
    SELECT 1
    FROM TargetCities t
    WHERE t.City = s.City
);


/*
===============================================================================
INTERVIEW RECOMMENDATION
===============================================================================

I. Same city as Davis
---------------------

BEST:

SELECT COUNT(*) AS SalesMan_Count
FROM SalesMan
WHERE City = (
    SELECT City
    FROM SalesMan
    WHERE Name = 'Davis'
);


II. Not in the same city as Camero, Green, or Johns
---------------------------------------------------

BEST:

SELECT s.Name
FROM SalesMan s
WHERE NOT EXISTS (
    SELECT 1
    FROM SalesMan x
    WHERE x.Name IN ('Camero', 'Green', 'Johns')
      AND x.City = s.City
);