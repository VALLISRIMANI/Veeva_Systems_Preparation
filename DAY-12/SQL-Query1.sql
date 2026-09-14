/*
## Tables

We'll use these 3 tables.

### `employees`

| emp_id | name  | department | salary | joining_date |
| -----: | ----- | ---------- | -----: | ------------ |
|      1 | Alice | IT         |  70000 | 2021-01-10   |
|      2 | Bob   | IT         |  85000 | 2020-06-15   |
|      3 | Carol | IT         |  85000 | 2022-03-20   |
|      4 | David | HR         |  60000 | 2019-08-12   |
|      5 | Emma  | HR         |  75000 | 2021-11-05   |
|      6 | Frank | HR         |  75000 | 2023-01-18   |
|      7 | Grace | Sales      |  50000 | 2020-02-10   |
|      8 | Henry | Sales      |  65000 | 2021-07-22   |
|      9 | Irene | Sales      |  65000 | 2022-09-14   |
|     10 | Jack  | Sales      |  45000 | 2023-05-01   |
|     11 | Kevin | Finance    |  90000 | 2018-04-11   |
|     12 | Laura | Finance    |  80000 | 2020-12-01   |

---

### `sales`

| sale_id | emp_id | sale_date  | amount |
| ------: | -----: | ---------- | -----: |
|     101 |      1 | 2026-01-01 |  10000 |
|     102 |      1 | 2026-02-01 |  15000 |
|     103 |      1 | 2026-03-01 |  12000 |
|     104 |      2 | 2026-01-01 |  20000 |
|     105 |      2 | 2026-02-01 |  18000 |
|     106 |      2 | 2026-03-01 |  25000 |
|     107 |      4 | 2026-01-01 |  12000 |
|     108 |      4 | 2026-02-01 |  14000 |
|     109 |      5 | 2026-01-01 |  16000 |
|     110 |      5 | 2026-02-01 |  19000 |
|     111 |      7 | 2026-01-01 |   8000 |
|     112 |      7 | 2026-02-01 |  11000 |

---

### `departments`

| department | location  |
| ---------- | --------- |
| IT         | Hyderabad |
| HR         | Bangalore |
| Sales      | Chennai   |
| Finance    | Mumbai    |

---

# Level 1 — Basic Window Functions

### Q1. `ROW_NUMBER()`

Display:

```text
name, department, salary, row_number
```

Assign row numbers based on **salary descending**.

---

### Q2. `ROW_NUMBER()` + `PARTITION BY`

Give each employee a row number **within their department**, with the highest-paid employee getting `1`.

Expected columns:

```text
name | department | salary | rn
```

---

### Q3. `RANK()`

Rank employees based on salary from highest to lowest.

```text
name | salary | rank
```

---

### Q4. `DENSE_RANK()`

Rank employees based on salary from highest to lowest using `DENSE_RANK()`.

---

### Q5. Compare all three

Write **one query** showing:

```text
name
salary
row_number
rank
dense_rank
```

Use salary descending.

---

# Level 2 — NTILE()

### Q6. `NTILE(2)`

Divide all employees into **2 salary groups**.

Highest salaries should come first.

Display:

```text
name | salary | bucket
```

---

### Q7. `NTILE(4)`

Divide employees into **4 salary groups**.

```text
name | salary | quartile
```

---

### Q8. Department-wise NTILE

Divide employees into **2 groups within each department**, based on salary descending.

Hint:

```text
PARTITION BY department
```

---

# Level 3 — LAG & LEAD

Now use the `sales` table.

### Q9. Previous sale

For every employee, show:

```text
emp_id
sale_date
amount
previous_amount
```

Use `LAG()`.

The previous sale should be based on `sale_date`.

---

### Q10. Next sale

Show:

```text
emp_id
sale_date
amount
next_amount
```

Use `LEAD()`.

---

### Q11. Difference from previous sale

Show:

```text
emp_id
sale_date
amount
previous_amount
difference
```

Where:

```text
difference = current amount - previous amount
```

Use `LAG()`.

---

### Q12. Two rows back

For every sale, find the sales amount from **2 rows before**.

Use:

```sql
LAG(amount, 2)
```

---

# Level 4 — FIRST_VALUE / LAST_VALUE

### Q13. Highest salary in each department

Using `FIRST_VALUE()`, display:

```text
name
department
salary
highest_salary_in_department
```

---

### Q14. Lowest salary in each department

Using `LAST_VALUE()`, display:

```text
name
department
salary
lowest_salary_in_department
```

⚠️ Remember the `LAST_VALUE()` window-frame issue.

You'll probably need:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
         AND UNBOUNDED FOLLOWING
```

---

### Q15. Highest-paid employee's name

Using `FIRST_VALUE()`, display:

```text
name
department
salary
highest_paid_employee
```

For each department.

For example, for IT, every IT employee should show:

```text
Bob
```

or another tied employee depending on your ordering.

---

# Level 5 — NTH_VALUE()

### Q16. Second-highest salary

Using `NTH_VALUE()`, find the **second salary** when employees are ordered by salary descending.

Display:

```text
name
salary
second_highest_salary
```

---

### Q17. Second-highest salary in each department

Using:

```sql
NTH_VALUE()
PARTITION BY department
```

find the second salary in each department.

---

# Level 6 — Aggregate Window Functions

### Q18. Department salary total

Display:

```text
name
department
salary
department_total
```

Use:

```sql
SUM() OVER()
```

with `PARTITION BY`.

---

### Q19. Department average

Display:

```text
name
department
salary
department_average
```

Use `AVG()` as a window function.

---

### Q20. Difference from department average

Display:

```text
name
department
salary
department_average
difference
```

Where:

```text
difference = salary - department_average
```

---

# Level 7 — Running Totals

Use the `sales` table.

### Q21. Running total for each employee

Display:

```text
emp_id
sale_date
amount
running_total
```

Example for employee 1:

```text
10000 → 10000
15000 → 25000
12000 → 37000
```

Use:

```sql
SUM() OVER(...)
```

---

### Q22. Running average

For every employee, calculate their running average sales amount.

```text
emp_id
sale_date
amount
running_average
```

---

# Level 8 — Interview Questions 🔥

These are more important.

### Q23. Highest-paid employee in each department

Return:

```text
name
department
salary
```

Use a window function.

---

### Q24. Top 2 highest-paid employees from each department

Return:

```text
name
department
salary
```

Use a window function + CTE/subquery.

---

### Q25. Employees earning the same salary

Find employees who have the **same salary as another employee**.

Try solving this using a window function.

---

### Q26. Second-highest salary in each department

Return only the employees whose salary is the **second-highest salary in their department**.

Be careful about ties.

---

### Q27. Highest sale for each employee

Using `sales`, return each employee's highest sale:

```text
emp_id
sale_date
amount
```

Use a window function.

---

### Q28. Compare current sale with previous sale

Return:

```text
emp_id
sale_date
amount
previous_amount
percentage_change
```

Formula:

```text
(current - previous) / previous * 100
```

Use `LAG()`.

---

### Q29. Top 25% employees

Use:

```sql
NTILE(4)
```

to identify employees belonging to the **top salary quartile**.

Return:

```text
name
salary
quartile
```

---

### Q30. Department salary ranking 🔥

Write one query showing:

```text
name
department
salary
row_number
rank
dense_rank
department_average
department_total
highest_department_salary
lowest_department_salary
```

This is your **master question**.
*/


-- Q1
SELECT name, department, salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    )
FROM employees;

-- Q2
SELECT name, department, salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rn
FROM employees;

-- Q3
SELECT name, salary,
    RANK() OVER(
        ORDER BY salary DESC
    )
FROM employees;

-- Q4
SELECT name, salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    )
FROM employees;

-- Q5
SELECT name, salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ),

    RANK() OVER(
        ORDER BY salary DESC
    ),

    DENSE_RANK() OVER(
        ORDER BY salary DESC
    )
FROM employees;

-- Q6
SELECT name, salary,
    NTILE(2) OVER(
        ORDER BY salary DESC
    ) AS bucket
FROM employees;

-- Q7
SELECT name, salary,
    NTILE(4) OVER(
        ORDER BY salary DESC
    ) AS quartile
FROM employees;

-- Q8
SELECT name, department, salary,
    NTILE(2) OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS bucket
FROM employees;

-- Q9
SELECT emp_id, sale_date, amount,
    LAG(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS previous_amount
FROM sales;

-- Q10
SELECT emp_id, sale_date, amount,
    LEAD(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS next_amount
FROM sales;

-- Q11
SELECT emp_id, sale_date, amount,
    LAG(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS previous_amount,

    amount - LAG(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS differnce
FROM sales;

-- Q12
SELECT emp_id, sale_date, amount,
    LAG(amount, 2) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS previous_amount
FROM sales;

-- Q13
SELECT name, department, salary,
    FIRST_VALUE(salary) OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS highest_salary_in_department
FROM employees;

-- Q14
SELECT name, department, salary,
    LAST_VALUE(salary) OVER(
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_salary_in_department
FROM employees;

-- Q15
SELECT name, department, salary,
    FIRST_VALUE(name) OVER(
        PARTITION BY department
        ORDER BY salary DESC, emp_id
    ) AS highest_paid_employee
FROM employees;

-- Q16
SELECT name, salary,
    NTH_VALUE(salary, 2) OVER(
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS second_highest_salary
FROM employees;

-- Q17
SELECT name, department, salary,
    NTH_VALUE(salary, 2) OVER(
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS second_highest_salary
FROM employees;

-- Q18
SELECT name, department, salary,
    SUM(salary) OVER(
        PARTITION BY department
    ) AS department_total
FROM employees;

-- Q19
SELECT name, department, salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_average
FROM employees;

-- Q20
SELECT name, department, salary,
    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_average,

    salary - AVG(salary) OVER(
        PARTITION BY department
    ) AS difference
FROM employees;

-- Q21
SELECT emp_id, sale_date, amount, 
    SUM(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS running_total
FROM sales;

-- Q22
SELECT emp_id, sale_date, amount, 
    AVG(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS running_average
FROM sales;

-- Q23
WITH highest_paid AS (
    SELECT name, department, salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) SELECT * FROM highest_paid WHERE rnk = 1;

SELECT * FROM (
    SELECT name, department, salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) AS highest_paid WHERE rnk = 1;

-- Q24
WITH highest_paid AS (
    SELECT name, department, salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) SELECT * FROM highest_paid WHERE rnk <= 2;

SELECT * FROM (
    SELECT name, department, salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) AS highest_paid WHERE rnk <= 2;

-- Q25
WITH duplicates AS (
    SELECT salary FROM employees GROUP BY salary HAVING COUNT(*) > 1
)
SELECT e.name, e.salary
FROM employees e
JOIN duplicates d
ON e.salary = d.salary;

-- Q26
WITH second_highest_salary AS (
    SELECT name, department, salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
)
SELECT * FROM second_highest_salary WHERE rnk = 2;

-- Q27
WITH ranked_sales AS (
    SELECT emp_id, sale_date, amount
        ROW_NUMBER() OVER(
            PARTITION BY emp_id
            ORDER BY amount DESC, sale_date
        ) AS rn
    FROM sales
) SELECT * FROM ranked_sales WHERE rn = 1;

-- Q28
SELECT emp_id, sale_date, amount,
    LAG(amount) OVER(
        PARTITION BY emp_id
        ORDER BY sale_date
    ) AS previous_amount,

    (
        (amount - LAG(amount) OVER(
            PARTITION BY emp_id
            ORDER BY sale_date
        )) / LAG(amount) OVER(
            PARTITION BY emp_id
            ORDER BY sale_date
        )
    ) * 100 AS percentage_change
FROM sales;


WITH sales_data AS (
    SELECT
        emp_id,
        sale_date,
        amount,
        LAG(amount) OVER(
            PARTITION BY emp_id
            ORDER BY sale_date
        ) AS previous_amount
    FROM sales
)
SELECT
    emp_id,
    sale_date,
    amount,
    previous_amount,
    ((amount - previous_amount) / previous_amount) * 100
        AS percentage_change
FROM sales_data;

-- Q29
WITH top_salary AS (
    SELECT name, salary,
        NTILE(4) OVER(
            ORDER BY salary DESC
        ) AS quartile
    FROM employees
) 
SELECT * FROM top_salary WHERE quartile = 1;

-- Q30
SELECT name, department, salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ),

    RANK() OVER(
        ORDER BY salary DESC
    ),

    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ),

    AVG(salary) OVER(
        PARTITION BY department
    ) AS department_average,

    SUM(salary) OVER(
        PARTITION BY department
    ) AS department_total,

    FIRST_VALUE(salary) OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS highest_department_salary,

    LAST_VALUE(salary) OVER(
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_department_salary

FROM employees;