/*
===============================================================================
SQL QUESTION: IDENTIFY POWER USERS
===============================================================================

Consider the following table:

medical_docs_requests:

request_id
user_id
request_date
document_id

Given the nature of the business, a user is a Health Care Professional.

A user is considered a POWER USER if they have requested MORE THAN 15
medical documents in a given month.

Write a SQL query to identify these power users.


===============================================================================
SOLUTION 1: GROUP BY + HAVING
===============================================================================
*/

-- Group requests by user and month.
-- HAVING filters users who have MORE THAN 15 requests.

SELECT
    user_id,
    YEAR(request_date) AS year,
    MONTH(request_date) AS month,
    COUNT(*) AS total_requests
FROM medical_docs_requests
GROUP BY
    user_id,
    YEAR(request_date),
    MONTH(request_date)
HAVING COUNT(*) > 15
ORDER BY
    year,
    month,
    user_id;


/*
===============================================================================
SOLUTION 2: DATE_FORMAT() — MySQL
===============================================================================
*/

SELECT
    user_id,
    DATE_FORMAT(request_date, '%Y-%m') AS request_month,
    COUNT(*) AS total_requests
FROM medical_docs_requests
GROUP BY
    user_id,
    DATE_FORMAT(request_date, '%Y-%m')
HAVING COUNT(*) > 15
ORDER BY
    request_month,
    user_id;


/*
===============================================================================
SOLUTION 3: SUBQUERY
===============================================================================
*/

SELECT
    user_id,
    request_month,
    total_requests
FROM (
    SELECT
        user_id,
        DATE_FORMAT(request_date, '%Y-%m') AS request_month,
        COUNT(*) AS total_requests
    FROM medical_docs_requests
    GROUP BY
        user_id,
        DATE_FORMAT(request_date, '%Y-%m')
) AS MonthlyRequests
WHERE total_requests > 15
ORDER BY
    request_month,
    user_id;