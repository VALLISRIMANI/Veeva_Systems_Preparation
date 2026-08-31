/*
===============================================================================
SQL QUESTION: SECOND HIGHEST SALARY AND TOP 2 EMPLOYEES BY DEPARTMENT
===============================================================================

Table:

employee:

emp_id
f_name
l_name
salary
dept_id


===============================================================================
I. FIND SECOND HIGHEST SALARY IN EACH DEPARTMENT
===============================================================================


===============================================================================
SOLUTION 1: DENSE_RANK()
===============================================================================
*/

SELECT
    dept_id,
    salary AS second_highest_salary
FROM (
    SELECT
        dept_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employee
) AS RankedEmployees
WHERE salary_rank = 2
ORDER BY dept_id;


/*
===============================================================================
SOLUTION 2: CORRELATED SUBQUERY
===============================================================================
*/

SELECT
    e.dept_id,
    MAX(e.salary) AS second_highest_salary
FROM employee e
WHERE e.salary < (
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e2.dept_id = e.dept_id
)
GROUP BY e.dept_id
ORDER BY e.dept_id;


/*
===============================================================================
SOLUTION 3: SUBQUERY + MAX()
===============================================================================
*/

SELECT
    dept_id,
    MAX(salary) AS second_highest_salary
FROM employee
WHERE (dept_id, salary) NOT IN (
    SELECT dept_id, MAX(salary)
    FROM employee
    GROUP BY dept_id
)
GROUP BY dept_id
ORDER BY dept_id;


/*
===============================================================================
II. TOP 2 EMPLOYEES IN EACH DEPARTMENT BASED ON HIGHEST SALARY
===============================================================================


===============================================================================
SOLUTION 1: ROW_NUMBER() — BEST WHEN YOU NEED EXACTLY 2 EMPLOYEES
===============================================================================
*/

SELECT
    dept_id,
    emp_id,
    CONCAT(f_name, ' ', l_name) AS full_name,
    salary
FROM (
    SELECT
        emp_id,
        f_name,
        l_name,
        salary,
        dept_id,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS employee_rank
    FROM employee
) AS RankedEmployees
WHERE employee_rank <= 2
ORDER BY dept_id, salary DESC;

/*
===============================================================================
SOLUTION 2: DENSE_RANK()
===============================================================================

Use this when employees with the same salary should receive the same rank.

*/

SELECT
    dept_id,
    emp_id,
    CONCAT(f_name, ' ', l_name) AS full_name,
    salary
FROM (
    SELECT
        emp_id,
        f_name,
        l_name,
        salary,
        dept_id,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employee
) AS RankedEmployees
WHERE salary_rank <= 2
ORDER BY dept_id, salary DESC;


/*
===============================================================================
SOLUTION 3: CORRELATED SUBQUERY
===============================================================================

For each employee, count how many DISTINCT salaries in the same department
are higher than that employee's salary.

*/

SELECT
    e.dept_id,
    e.emp_id,
    CONCAT(e.f_name, ' ', e.l_name) AS full_name,
    e.salary
FROM employee e
WHERE (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employee e2
    WHERE e2.dept_id = e.dept_id
      AND e2.salary > e.salary
) < 2
ORDER BY e.dept_id, e.salary DESC;