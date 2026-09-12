/*
## Database: `company_db`

### Table 1: `employees`

| emp_id | emp_name | dept_id | manager_id | salary | city      |
| -----: | -------- | ------: | ---------: | -----: | --------- |
|    101 | Ravi     |       1 |       NULL |  60000 | Hyderabad |
|    102 | Priya    |       2 |        101 |  55000 | Chennai   |
|    103 | Arjun    |       1 |        101 |  75000 | Hyderabad |
|    104 | Sneha    |       3 |        102 |  50000 | Bangalore |
|    105 | Kiran    |       4 |        102 |  65000 | Chennai   |
|    106 | Anu      |    NULL |        103 |  45000 | Hyderabad |
|    107 | Rahul    |       5 |        103 |  80000 | Mumbai    |
|    108 | Divya    |       1 |        101 |  70000 | Hyderabad |

---

### Table 2: `departments`

| dept_id | dept_name | location_id |
| ------: | --------- | ----------: |
|       1 | IT        |         101 |
|       2 | HR        |         102 |
|       3 | Finance   |         103 |
|       4 | Sales     |         104 |
|       6 | Marketing |         105 |

Notice carefully:

* Department `5` doesn't exist.
* Department `6` has no employees.
* Anu has `NULL` department.

---

### Table 3: `locations`

| location_id | city      | country |
| ----------: | --------- | ------- |
|         101 | Hyderabad | India   |
|         102 | Chennai   | India   |
|         103 | Bangalore | India   |
|         104 | Mumbai    | India   |
|         105 | Delhi     | India   |

---

### Table 4: `projects`

| project_id | project_name    | dept_id |
| ---------: | --------------- | ------: |
|        201 | Banking App     |       1 |
|        202 | HR Portal       |       2 |
|        203 | Finance Tracker |       3 |
|        204 | Sales Dashboard |       4 |
|        205 | AI Platform     |       6 |

---

### Table 5: `employee_projects`

| emp_id | project_id | hours |
| -----: | ---------: | ----: |
|    101 |        201 |   120 |
|    102 |        202 |   100 |
|    103 |        201 |   150 |
|    103 |        205 |    80 |
|    104 |        203 |    90 |
|    105 |        204 |   110 |
|    107 |        201 |   130 |
|    108 |        201 |   100 |
|    108 |        205 |    70 |

---

# 🟢 Level 1 — Basic WHERE

### Q1: Find all employees whose salary is greater than `60000`.

### Q2: Find employees who live in Hyderabad.

### Q3: Find employees whose salary is between `50000` and `70000`.

### Q4: Find employees whose department is `NULL`.

### Q5: Find employees whose name starts with `A`.

---

# 🟢 Level 2 — INNER JOIN

### Q6: Display:

```text
employee name
department name
```
for employees who have a matching department.

### Q7: Display:

```text
employee name
department name
salary
```
only for employees working in the IT department.

### Q8: Display:

```text
employee name
department name
city
```
using `employees`, `departments`, and `locations`.

---

# 🟡 Level 3 — LEFT / RIGHT JOIN

### Q9: Display **all employees**, including employees who don't have a department.

Output:

```text
employee name
department name
```

### Q10: Find employees who **do not have a matching department**.

### Q11: Display **all departments**, including departments that don't have employees.

### Q12: Find departments that have **zero employees**.

### Q13: Write the equivalent of a `RIGHT JOIN` using a `LEFT JOIN`.

---

# 🟡 Level 4 — SELF JOIN

Remember `manager_id`.

### Q14: Display:

```text
employee name
manager name
```
for every employee.

Example:

```text
Priya → Ravi
Arjun → Ravi
```

### Q15: Find all employees whose manager is Ravi.

---

# 🟡 Level 5 — USING

### Q16

Join `employees` and `departments` using `USING`.

Display:

```text
employee name
department name
```

Don't use `ON`.

---

# 🟡 Level 6 — GROUP BY

### Q17

Find the **number of employees in each department**.

Output:

```text
dept_id
employee_count
```

### Q18

Find the **average salary of employees in each department**.

Output:

```text
dept_id
average_salary
```

### Q19: Find the **maximum salary in each department**.

### Q20: Find the **total salary paid by each department**.

---

# 🟠 Level 7 — GROUP BY + HAVING

### Q21: Find departments having **more than 2 employees**.

### Q22: Find departments whose **average salary is greater than 60000**.

### Q23: Find departments whose **total salary is greater than 150000**.

### Q24: Find cities having more than **2 employees**.

---

# 🟠 Level 8 — JOIN + GROUP BY

### Q25

Display:

```text
department name
number of employees
```

Include departments with **zero employees**.

⚠️ This tests whether you understand where to put the `COUNT()` and which table should be on the left.

### Q26: Find the average salary for each **department name**.

### Q27: Find the department with the **highest average salary**.

---

# 🔴 Level 9 — CROSS JOIN

### Q28

Generate every possible combination of:

```text
employee name
project name
```

using `CROSS JOIN`.

Don't worry about whether the employee actually works on the project.

---

# 🔴 Level 10 — Employee + Project JOINs

### Q29

Display employees who are actually working on projects.

Output:

```text
employee name
project name
hours
```

### Q30: Find the **total project hours worked by each employee**.

### Q31: Find employees who have worked **more than 200 total hours** on projects.

### Q32: Find the project with the **highest total hours**.

### Q33: Display all projects, including projects where **nobody has worked yet**.

---

# 🔴 Level 11 — CTEs

Now we start interview-level questions.

### Q34

Create a CTE that calculates each department's average salary.

Then display only departments whose average salary is greater than `60000`.

Concept:

```sql
WITH ...
AS (...)
SELECT ...
```

---

### Q35

Create a CTE that calculates:

```text
emp_id
total_hours
```

Then find employees whose total project hours are greater than `200`.

---

### Q36

Create a CTE containing employees whose salary is greater than `60000`.

Then display their:

```text
employee name
department name
salary
```

---

# 🔥 Level 12 — Multiple Concepts Together

### Q37

Find the **highest-paid employee in each department**.

Expected output:

```text
department
employee
salary
```

---

### Q38

Find departments where:

* employee count > 1
* AND average salary > 60000

Use:

```text
JOIN
GROUP BY
HAVING
```

---

### Q39

Find employees who:

* have a valid department
* work on at least one project
* have total project hours > 100

Output:

```text
employee
department
total_hours
```

---

### Q40 — ⭐ Interview Question

Find the **second-highest salary** from `employees`.

Try solving it **without `LIMIT 1 OFFSET 1` first**.

---

# 🔥 Level 13 — Advanced CTE

### Q41

Using a CTE, calculate the average salary of all employees.

Then display employees whose salary is **greater than the company-wide average salary**.

---

### Q42

Using a CTE, calculate each employee's total project hours.

Then display:

```text
employee
total_hours
```

for the employee(s) with the **highest total project hours**.

---

### Q43 — ⭐ Very Important

Using a CTE, calculate:

```text
department
employee_count
average_salary
```

Then return only departments satisfying:

```text
employee_count >= 2
AND average_salary > 60000
```

---

# 🧠 Final Challenge

### Q44 — Veeva/Placement-style

Write **one query** that displays:

```text
Employee Name
Department Name
Manager Name
Salary
Total Project Hours
```

Requirements:

* Employees without a department should **still appear**.
* Employees without projects should **still appear**.
* Manager name should be obtained using a **self join**.
* Total project hours should be calculated using aggregation.
* Employees with no project hours should show `0`, not `NULL`.

This combines:

**LEFT JOIN + SELF JOIN + GROUP BY + COALESCE + aggregation**

*/

-- Q1:
SELECT emp_id, emp_name, dept_id, salary
FROM employees
WHERE salary > 60000;

-- Q2
SELECT emp_id, emp_name, city
FROM employees
WHERE city = 'Hyderabad';

-- Q3
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

-- Q4
SELECT emp_id, emp_name, dept_id
FROM employees
WHERE dept_id IS NULL;

-- Q5
SELECT emp_id, emp_name, dept_id
FROM employees
WHERE emp_name LIKE 'A%';

-- Q6
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

-- Q7
SELECT e.emp_name, d.dept_name, e.salary
FROM employees e
JOIN departments d
USING (dept_id)
WHERE d.dept_name = 'IT';

SELECT e.emp_name, d.dept_name, e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- Q8
SELECT e.emp_name, d.dept_name, l.city
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
JOIN locations l
ON d.location_id = l.location_id;

-- Q9
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q10
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name IS NULL;

SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- Q11
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q12
SELECT d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- Q13
SELECT e.emp_name, d.dept_name
FROM departments d
LEFT JOIN employees e
ON e.dept_id = d.dept_id;

-- Q14
SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Q15
SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Ravi';

-- Q16
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
USING (dept_id);

-- Q17
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;

-- Q18
SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;

-- Q19
SELECT dept_id, MAX(salary) AS maximum_salary
FROM employees
GROUP BY dept_id;

-- Q20
SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;

-- Q21
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

-- Q22
SELECT dept_id, AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 60000;

-- Q23
SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 150000;

-- Q24
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

-- Q25
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS number_of_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- Q26
SELECT
    d.dept_name,
    AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- Q27
WITH department_avg AS (
    SELECT
        d.dept_id,
        d.dept_name,
        AVG(e.salary) AS average_salary
    FROM departments d
    JOIN employees e
        ON d.dept_id = e.dept_id
    GROUP BY d.dept_id, d.dept_name
),
ranked_departments AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            ORDER BY average_salary DESC
        ) AS rnk
    FROM department_avg
)
SELECT *
FROM ranked_departments
WHERE rnk = 1;


SELECT
    d.dept_name,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Q28
SELECT
    e.emp_name,
    p.project_name
FROM employees e
CROSS JOIN projects p;

-- Q29
SELECT
    e.emp_name,
    p.project_name,
    ep.hours
FROM employees e
JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
JOIN projects p
    ON ep.project_id = p.project_id;


SELECT
    e.emp_name,
    p.project_name,
    ep.hours
FROM employees e
JOIN employee_projects ep
USING (emp_id)
JOIN projects p
USING (project_id);

-- Q30
SELECT
    emp_id,
    SUM(hours) AS total_hours
FROM employee_projects
GROUP BY emp_id;

-- Q31
SELECT emp_id, SUM(hours)
FROM employee_projects
GROUP BY emp_id
HAVING SUM(hours) > 200;

-- Q32
WITH project_hours AS (
    SELECT
        project_id,
        SUM(hours) AS total_hours
    FROM employee_projects
    GROUP BY project_id
),
ranked_projects AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            ORDER BY total_hours DESC
        ) AS rnk
    FROM project_hours
)
SELECT *
FROM ranked_projects
WHERE rnk = 1;

-- Q33
SELECT
    p.project_id,
    p.project_name,
    ep.emp_id,
    ep.hours
FROM projects p
LEFT JOIN employee_projects ep
USING (project_id);

-- Q34
WITH average_salary AS (
    SELECT
        dept_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY dept_id
)
SELECT *
FROM average_salary
WHERE average_salary > 60000;

-- Q35
WITH total_project_hours AS (
    SELECT
        emp_id,
        SUM(hours) AS total_hours
    FROM employee_projects
    GROUP BY emp_id
)
SELECT *
FROM total_project_hours
WHERE total_hours > 200;

-- Q36
WITH employeeData AS (
    SELECT
        e.emp_name,
        d.dept_name,
        e.salary
    FROM employees e
    JOIN departments d
    USING (dept_id)
    WHERE e.salary > 60000
)
SELECT *
FROM employeeData;

-- Q37
WITH ranked_employees AS (
    SELECT
        emp_id,
        emp_name,
        dept_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT
    emp_id,
    emp_name,
    dept_id,
    salary
FROM ranked_employees
WHERE rnk = 1;

-- Q38
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) > 1
   AND AVG(e.salary) > 60000;

-- Q39
SELECT
    e.emp_name AS employee,
    d.dept_name AS department,
    SUM(ep.hours) AS total_hours
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.emp_name, d.dept_id, d.dept_name
HAVING SUM(ep.hours) > 100;

-- Q40
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


WITH ranked_salaries AS (
    SELECT
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT salary
FROM ranked_salaries
WHERE rnk = 2;

-- Q41
WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    e.emp_name,
    e.salary
FROM employees e
CROSS JOIN company_average c
WHERE e.salary > c.avg_salary;


WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    emp_name,
    salary
FROM employees
WHERE salary > (SELECT avg_salary FROM company_average);

-- Q42
WITH employee_hours AS (
    SELECT
        emp_id,
        SUM(hours) AS total_hours
    FROM employee_projects
    GROUP BY emp_id
),
ranked_employees AS (
    SELECT
        emp_id,
        total_hours,
        DENSE_RANK() OVER (
            ORDER BY total_hours DESC
        ) AS rnk
    FROM employee_hours
)
SELECT
    e.emp_name AS employee,
    r.total_hours
FROM ranked_employees r
JOIN employees e
    ON r.emp_id = e.emp_id
WHERE r.rnk = 1;

-- Q43
WITH department_stats AS (
    SELECT
        d.dept_id,
        d.dept_name,
        COUNT(e.emp_id) AS employee_count,
        AVG(e.salary) AS average_salary
    FROM departments d
    LEFT JOIN employees e
        ON d.dept_id = e.dept_id
    GROUP BY d.dept_id, d.dept_name
)
SELECT
    dept_name,
    employee_count,
    average_salary
FROM department_stats
WHERE employee_count >= 2
  AND average_salary > 60000;

-- Q44
SELECT
    e.emp_name AS employee_name,
    d.dept_name AS department_name,
    m.emp_name AS manager_name,
    e.salary,
    COALESCE(SUM(ep.hours), 0) AS total_project_hours
FROM employees e

LEFT JOIN departments d
    ON e.dept_id = d.dept_id

LEFT JOIN employees m
    ON e.manager_id = m.emp_id

LEFT JOIN employee_projects ep
    ON e.emp_id = ep.emp_id

GROUP BY
    e.emp_id,
    e.emp_name,
    d.dept_name,
    m.emp_name,
    e.salary;