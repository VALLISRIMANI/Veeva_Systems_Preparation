/*
## Tables

### `employees`

| emp_id | name    | department_id | manager_id | salary | joining_year |
| -----: | ------- | ------------: | ---------: | -----: | -----------: |
|      1 | Alice   |            10 |       NULL |  90000 |         2019 |
|      2 | Bob     |            20 |          1 |  75000 |         2020 |
|      3 | Charlie |            20 |          1 |  85000 |         2018 |
|      4 | David   |            30 |          2 |  60000 |         2021 |
|      5 | Emma    |            30 |          2 |  70000 |         2020 |
|      6 | Frank   |            20 |          3 |  85000 |         2022 |
|      7 | Grace   |            10 |          1 |  95000 |         2017 |
|      8 | Henry   |            30 |          2 |  60000 |         2023 |
|      9 | Irene   |            40 |          3 |  80000 |         2019 |
|     10 | Jack    |            40 |          3 |  80000 |         2021 |

### `departments`

| department_id | department_name |
| ------------: | --------------- |
|            10 | HR              |
|            20 | IT              |
|            30 | Sales           |
|            40 | Finance         |
|            50 | Marketing       |

---

# 🟢 Level 1 — Basic CTE

### Q1

Using a CTE, find all employees whose salary is greater than `80000`.

### Q2

Using a CTE, find employees who joined after `2020`.

### Q3

Using a CTE, calculate the **average salary of all employees**, then display employees whose salary is greater than the overall average.

---

# 🟡 Level 2 — CTE + GROUP BY

### Q4

Using a CTE, calculate:

```text
department_id
employee_count
average_salary
```

for every department.

### Q5

Using a CTE, find departments whose **average salary is greater than 75000**.

### Q6

Using a CTE, find the department having the **highest average salary**.

---

# 🟠 Level 3 — Multiple CTEs

### Q7

Create one CTE containing employees with salary `>= 70000`.

Then create a second CTE from the first one to find employees belonging to department `20`.

Return:

```text
name
salary
department_id
```

### Q8

Using **two CTEs**:

1. Calculate average salary per department.
2. Find departments whose average salary is greater than the **overall average salary**.

---

# 🔴 Level 4 — CTE + Window Functions

These are particularly important for interviews.

### Q9

Using `ROW_NUMBER()`, rank employees by salary from highest to lowest.

Return:

```text
name
salary
row_number
```

Use a CTE.

---

### Q10

Find the **highest-paid employee in each department** using:

```sql
ROW_NUMBER()
```

Expected columns:

```text
department_id
name
salary
```

---

### Q11

Find the **second-highest-paid employee in each department**.

Use:

```sql
ROW_NUMBER()
```

and a CTE.

---

### Q12

Find the **second-highest distinct salary** in the entire company.

Use:

```sql
DENSE_RANK()
```

and a CTE.

---

### Q13

Find employees who earn **more than the average salary of their own department**.

Hint: this requires a window function.

---

# 🔥 Level 5 — Interview Questions

### Q14

Find employees who have the **same salary as another employee**.

Return:

```text
name
salary
```

Don't simply use `DISTINCT`.

---

### Q15

Find the **top 2 highest-paid employees from every department**.

Use:

```sql
ROW_NUMBER()
```

* CTE.

---

### Q16

Find the department with the **second-highest average salary**.

Use a CTE + `DENSE_RANK()`.

---

### Q17

Find employees whose salary is greater than their **manager's salary**.

You can use a CTE and a self-join.

---

# 🧠 Level 6 — Recursive CTE

### Q18

Generate numbers from **1 to 10** using a recursive CTE.

Expected:

```text
1
2
3
...
10
```

---

### Q19

Using the `employees` table, display the employee hierarchy starting from the top-level employee (`manager_id IS NULL`).

Return:

```text
emp_id
name
manager_id
level
```

---

### Q20 — ⭐ Challenge

Using a recursive CTE, display:

```text
employee name
manager name
level
```

for the complete hierarchy.
*/


-- Q1
WITH employees_data AS (
    SELECT emp_id, name, salary
    FROM employees
)
SELECT *
FROM employees_data
WHERE salary > 80000;

-- Q2
WITH employees_data AS (
    SELECT emp_id, name, salary, joining_year
    FROM employees
)
SELECT *
FROM employees_data
WHERE joining_year > 2020;

-- Q3
WITH average_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT emp_id, name, salary
FROM employees
WHERE salary > (
    SELECT avg_salary
    FROM average_salary
);


WITH average_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.emp_id, e.name, e.salary
FROM employees e
CROSS JOIN average_salary a
WHERE e.salary > a.avg_salary;

-- Q4
WITH employee_data AS (
    SELECT department_id,
           COUNT(emp_id) AS employee_count,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM employee_data;

-- Q5
WITH departments_data AS (
    SELECT department_id,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 75000
)
SELECT *
FROM departments_data;

--Q6
WITH department_average AS (
    SELECT department_id,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),
ranked_departments AS (
    SELECT department_id,
           average_salary,
           DENSE_RANK() OVER (
               ORDER BY average_salary DESC
           ) AS rnk
    FROM department_average
)
SELECT department_id, average_salary
FROM ranked_departments
WHERE rnk = 1;

-- Q7
WITH employees_data AS (
    SELECT emp_name, salary, department_id
    FROM employees
    WHERE salary >= 70000
),
filtered_data AS (
    SELECT *
    FROM employees_data
    WHERE department_id = 20
)
SELECT *
FROM filtered_data;

-- Q8
WITH averages AS (
    SELECT department_id,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),
overall_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT a.department_id,
       a.average_salary
FROM averages a
CROSS JOIN overall_average o
WHERE a.average_salary > o.avg_salary;

-- Q9
WITH ranked_data AS (
    SELECT emp_name,
           salary,
           ROW_NUMBER() OVER (
               ORDER BY salary DESC
           ) AS row_number
    FROM employees
)
SELECT *
FROM ranked_data;

-- Q10
WITH highest_paid AS (
    SELECT department_id,
           name,
           salary,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT department_id, name, salary
FROM highest_paid
WHERE rn = 1;

-- Q11
WITH second_highest AS (
    SELECT emp_id,
           name,
           department_id,
           salary,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT emp_id, name, department_id, salary
FROM second_highest
WHERE rn = 2;


WITH second_highest AS (
    SELECT emp_id,
           name,
           department_id,
           salary,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
)
SELECT *
FROM second_highest
WHERE rnk = 2;

-- Q12
WITH second_highest AS (
    SELECT emp_id,
           name,
           salary,
           DENSE_RANK() OVER (
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
)
SELECT *
FROM second_highest
WHERE rnk = 2;

-- Q13
WITH employee_averages AS (
    SELECT emp_id,
           name,
           department_id,
           salary,
           AVG(salary) OVER (
               PARTITION BY department_id
           ) AS average_salary
    FROM employees
)
SELECT emp_id,
       name,
       department_id,
       salary
FROM employee_averages
WHERE salary > average_salary;

-- Q14
WITH duplicate_salaries AS (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
)
SELECT e.name,
       e.salary
FROM employees e
JOIN duplicate_salaries d
ON e.salary = d.salary;

-- Q15
WITH top_two AS (
    SELECT name,
           salary,
           department_id,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM top_two
WHERE rn <= 2;

-- Q16
WITH department_average AS (
    SELECT department_id,
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),
ranked_departments AS (
    SELECT department_id,
           average_salary,
           DENSE_RANK() OVER (
               ORDER BY average_salary DESC
           ) AS rnk
    FROM department_average
)
SELECT department_id,
       average_salary
FROM ranked_departments
WHERE rnk = 2;

-- Q17
WITH managers_data AS (
    SELECT emp_id,
           name,
           salary
    FROM employees
)
SELECT e.name AS employee_name,
       m.name AS manager_name,
       e.salary AS employee_salary,
       m.salary AS manager_salary
FROM employees e
JOIN managers_data m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- Q18
WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT *
FROM numbers;

-- Q19
WITH RECURSIVE employee_hierarchy AS (
    -- Anchor
    SELECT
        emp_id,
        name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive part
    SELECT
        e.emp_id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.emp_id
)
SELECT *
FROM employee_hierarchy;

-- Q20
WITH RECURSIVE employee_hierarchy AS (
    -- Anchor
    SELECT
        e.emp_id,
        e.name AS employee_name,
        e.manager_id,
        CAST(NULL AS CHAR(100)) AS manager_name,
        1 AS level
    FROM employees e
    WHERE e.manager_id IS NULL

    UNION ALL

    -- Recursive part
    SELECT
        e.emp_id,
        e.name AS employee_name,
        e.manager_id,
        eh.employee_name AS manager_name,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.emp_id
)
SELECT employee_name,
       manager_name,
       level
FROM employee_hierarchy;