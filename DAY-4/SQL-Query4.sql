/*
===============================================================================
SQL QUESTION: TOP K EMPLOYEES BASED ON SALARY
===============================================================================

Table: employee:

emp_id
name
salary
date_of_joining

Question:
---------
Find the top K employees based on salary. If 2 or more employees have the same salary, they must be identified using their date of joining.


===============================================================================
SOLUTION 1: ROW_NUMBER()
===============================================================================
*/

SELECT
    emp_id,
    name,
    salary,
    date_of_joining
FROM (
    SELECT
        emp_id,
        name,
        salary,
        date_of_joining,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC, date_of_joining ASC
        ) AS employee_rank
    FROM employee
) AS RankedEmployees
WHERE employee_rank <= 5;


/*
===============================================================================
SOLUTION 2: LIMIT — SIMPLEST
===============================================================================
*/

SELECT
    emp_id,
    name,
    salary,
    date_of_joining
FROM employee
ORDER BY
    salary DESC,
    date_of_joining ASC
LIMIT 5;