/*
Absolutely. Try these **without looking up the answers**. I’ve arranged them from basic → interview-level and covered `CASE`, `WHEN`, `ELSE`, simple/searched CASE, `NULL`, `ORDER BY`, `GROUP BY`, `HAVING`, `SUM`, `COUNT`, `AVG`, and combinations with `WHERE`/CTEs.

## Tables

### `employees`

| emp_id | name  | department | salary | experience | status   |
| -----: | ----- | ---------- | -----: | ---------: | -------- |
|    101 | Ravi  | IT         |  85000 |          4 | Active   |
|    102 | Anu   | HR         |  55000 |          2 | Active   |
|    103 | Kiran | IT         |  45000 |          1 | Active   |
|    104 | Priya | Sales      |  72000 |          5 | Active   |
|    105 | Arjun | IT         | 110000 |          7 | Active   |
|    106 | Sneha | HR         |  40000 |          1 | Inactive |
|    107 | Rahul | Sales      |  50000 |          3 | Active   |
|    108 | Divya | Finance    |  95000 |          6 | Active   |
|    109 | Vamsi | Finance    |   NULL |          2 | Active   |
|    110 | Meena | Sales      |  65000 |          4 | Inactive |

---

### `orders`

| order_id | customer | department  | amount | status    | payment |
| -------: | -------- | ----------- | -----: | --------- | ------- |
|        1 | Ravi     | Electronics |  15000 | Delivered | Paid    |
|        2 | Anu      | Clothing    |   4500 | Pending   | Unpaid  |
|        3 | Kiran    | Electronics |   8000 | Shipped   | Paid    |
|        4 | Priya    | Grocery     |   2500 | Delivered | Paid    |
|        5 | Arjun    | Electronics |  22000 | Cancelled | Unpaid  |
|        6 | Sneha    | Clothing    |   7000 | Delivered | Paid    |
|        7 | Rahul    | Grocery     |   1200 | Pending   | Unpaid  |
|        8 | Divya    | Electronics |   9500 | Shipped   | Paid    |
|        9 | Vamsi    | Clothing    |  18000 | Delivered | Paid    |
|       10 | Meena    | Grocery     |   NULL | Pending   | Unpaid  |

---

### `students`

| student_id | name  | marks | attendance | department |
| ---------: | ----- | ----: | ---------: | ---------- |
|          1 | Ravi  |    92 |         95 | CSE        |
|          2 | Anu   |    78 |         88 | CSE        |
|          3 | Kiran |    65 |         72 | ECE        |
|          4 | Priya |    45 |         80 | CSE        |
|          5 | Arjun |    35 |         60 | ECE        |
|          6 | Sneha |    88 |         92 | ECE        |
|          7 | Rahul |    55 |         68 | CSE        |
|          8 | Divya |  NULL |         90 | ECE        |

---

# Level 1 — Basic CASE WHEN

### Q1. Salary Category

Display:

```text
name | salary | salary_category
```

Rules:

* salary >= 100000 → `High`
* salary >= 60000 → `Medium`
* otherwise → `Low`

---

### Q2. Employee Experience

Display:

```text
name | experience | experience_level
```

Rules:

* experience >= 5 → `Senior`
* experience >= 3 → `Mid-Level`
* otherwise → `Junior`

---

### Q3. Student Result

Display:

```text
name | marks | result
```

Rules:

* marks >= 40 → `Pass`
* otherwise → `Fail`

---

### Q4. Student Grade

Display:

```text
name | marks | grade
```

Rules:

```text
90+ → A
75–89 → B
60–74 → C
40–59 → D
below 40 → F
```

---

# Level 2 — Simple CASE

### Q5. Order Status Meaning

Using **simple CASE syntax**:

```sql
CASE status
    WHEN ...
```

Convert:

```text
Pending   → Waiting
Shipped   → On the Way
Delivered → Completed
Cancelled → Failed
```

Display:

```text
order_id | status | status_message
```

---

### Q6. Payment Message

Using simple `CASE`, convert:

```text
Paid   → Payment Completed
Unpaid → Payment Pending
```

Display:

```text
order_id | payment | payment_message
```

---

# Level 3 — CASE + Calculations

### Q7. Bonus

Display:

```text
name | salary | bonus
```

Rules:

* salary >= 100000 → 15% bonus
* salary >= 60000 → 10% bonus
* otherwise → 5% bonus

Calculate the **actual bonus amount**.

---

### Q8. Final Salary

Display:

```text
name | salary | final_salary
```

Apply the same bonus rules from Q7 and calculate:

```text
final_salary = salary + bonus
```

---

### Q9. Order Discount

Display:

```text
order_id | amount | discount
```

Rules:

* amount >= 20000 → 20%
* amount >= 10000 → 10%
* amount >= 5000 → 5%
* otherwise → no discount

Calculate the **discount amount**, not the percentage.

---

# Level 4 — CASE + NULL ⭐

### Q10. Salary Availability

Display:

```text
name | salary | salary_status
```

If salary is `NULL`:

```text
Not Available
```

Otherwise:

```text
Available
```

Use `CASE WHEN` and `IS NULL`.

---

### Q11. Student Marks

Display:

```text
name | marks | marks_status
```

Rules:

* `NULL` → `Not Attempted`
* 40 or above → `Passed`
* below 40 → `Failed`

---

# Level 5 — CASE + WHERE

### Q12. IT Salary Classification

Consider **only Active employees in IT**.

Display:

```text
name | salary | category
```

Rules:

```text
salary >= 80000 → High
otherwise → Normal
```

---

### Q13. Large Orders

Consider only orders where:

```text
payment = 'Paid'
```

Then classify:

```text
amount >= 10000 → Large
otherwise → Small
```

Display:

```text
order_id | amount | category
```

---

# Level 6 — CASE + ORDER BY ⭐

### Q14. Custom Employee Ordering

Display all employees in this order:

```text
IT
Finance
Sales
HR
```

Use:

```sql
ORDER BY CASE ...
```

Do **not** simply use alphabetical ordering.

---

### Q15. Custom Order Status

Sort orders in this priority:

```text
Pending
Shipped
Delivered
Cancelled
```

Use `CASE` inside `ORDER BY`.

---

### Q16. Students by Grade Priority

Sort students according to:

```text
A
B
C
D
F
```

Students with higher grades should appear first.

Handle `NULL` marks sensibly.

---

# Level 7 — CASE + Aggregate Functions ⭐⭐⭐

These are particularly important for interviews.

### Q17. Count High-Salary Employees

Find the number of employees whose salary is:

```text
>= 80000
```

Use:

```sql
SUM(CASE WHEN ... THEN 1 ELSE 0 END)
```

---

### Q18. Count Employees by Salary Category

Return **one row** containing:

```text
high_salary
medium_salary
low_salary
```

Rules:

```text
High   >= 80000
Medium 50000–79999
Low    < 50000
```

Use `SUM(CASE...)`.

---

### Q19. Count Passed Students

Find the number of students who passed.

Use:

```sql
COUNT(CASE WHEN ... END)
```

---

### Q20. Total Value of Delivered Orders

Calculate the total `amount` of orders whose status is:

```text
Delivered
```

Use:

```sql
SUM(CASE WHEN ... THEN ... ELSE ... END)
```

---

### Q21. Total Paid vs Unpaid Amount

Return:

```text
total_paid
total_unpaid
```

Use `CASE` inside `SUM()`.

---

# Level 8 — CASE + GROUP BY ⭐⭐⭐

### Q22. Employees by Salary Category

Return:

```text
salary_category | employee_count
```

Categories:

```text
High   >= 80000
Medium 50000–79999
Low    < 50000
```

Use:

```text
CASE + GROUP BY + COUNT
```

---

### Q23. Department-wise High Salary Count

Return:

```text
department | high_salary_count
```

Count employees whose salary is:

```text
>= 80000
```

Group by department.

---

### Q24. Department-wise Average Salary Category

For each department, calculate the average salary and classify it:

```text
Average >= 80000 → High
Average >= 50000 → Medium
Otherwise → Low
```

Output:

```text
department | avg_salary | category
```

---

# Level 9 — CASE + GROUP BY + HAVING ⭐⭐⭐⭐

### Q25. Departments With 2+ High-Salary Employees

Find departments having **at least 2 employees with salary >= 80000**.

Output:

```text
department | high_salary_count
```

Use:

```text
CASE
SUM
GROUP BY
HAVING
```

---

### Q26. Departments With More Passed Students

For each student department, count students who passed.

Return only departments where:

```text
passed_students >= 2
```

---

# Level 10 — More Interview-Style

### Q27. Paid Order Classification

For every order:

* If payment is `Unpaid` → `Payment Pending`
* If payment is `Paid` AND amount >= 10000 → `High Value Paid`
* If payment is `Paid` AND amount < 10000 → `Low Value Paid`

Display:

```text
order_id | amount | payment | category
```

---

### Q28. Student Eligibility

A student is:

```text
Eligible
```

if:

```text
marks >= 60 AND attendance >= 75
```

Otherwise:

```text
Not Eligible
```

If marks are `NULL`:

```text
Marks Missing
```

Display:

```text
name | marks | attendance | eligibility
```

---

### Q29. Employee Promotion Eligibility

An employee is eligible for promotion if:

```text
experience >= 5 AND salary >= 70000
```

Otherwise:

```text
Not Eligible
```

But if status is `Inactive`:

```text
Inactive
```

Display:

```text
name | experience | salary | status | promotion_status
```

**Pay attention to the order of your `WHEN` conditions.**

---

### Q30. Department Performance ⭐⭐⭐⭐

For every department, calculate:

```text
department
total_employees
high_salary_employees
average_salary
```

Then add:

```text
department_rating
```

Rules:

```text
High-salary employees >= 2 → Excellent
High-salary employees = 1  → Good
Otherwise                  → Needs Improvement
```

This requires combining:

```text
CASE
SUM
COUNT
AVG
GROUP BY
```

---

# 🔥 Final Challenge — Q31

Write **one query** that returns:

```text
department
total_employees
active_employees
high_salary_employees
avg_salary
department_category
```

Rules:

### `active_employees`

Count employees whose status is `Active`.

### `high_salary_employees`

Count employees whose salary is `>= 80000`.

### `avg_salary`

Calculate average salary, ignoring `NULL`.

### `department_category`

```text
high_salary_employees >= 2 → Excellent
high_salary_employees = 1  → Good
otherwise                  → Average
```

Use:

```text
CASE
SUM / COUNT`
AVG
GROUP BY
```
*/


-- Q1
SELECT name, salary, 
    CASE 
        WHEN salary >= 100000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- Q2
SELECT name, experience, 
    CASE 
        WHEN experience >= 5 THEN 'Senior'
        WHEN experience >= 3 THEN 'Mid-level'
        ELSE 'Junior'
    END AS experience_level
FROM employees;

-- Q3
SELECT name, marks, 
    CASE 
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS result
FROM students;

-- Q4
SELECT name, marks, 
    CASE 
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 75 AND marks <= 89 THEN 'B'
        WHEN marks >= 60 AND marks <= 74 THEN 'C'
        WHEN marks >= 40 AND marks <= 59 THEN 'D'
        ELSE 'F'
    END AS grade
FROM students;


SELECT name, marks, 
       CASE 
           WHEN marks >= 90 THEN 'A'
           WHEN marks >= 75 THEN 'B'
           WHEN marks >= 60 THEN 'C'
           WHEN marks >= 40 THEN 'D'
           ELSE 'F'
       END AS grade
FROM students;

-- Q5
SELECT order_id, status, 
    CASE status
        WHEN 'Pending' THEN 'Waiting'
        WHEN 'Shipped' THEN 'On the Way'
        WHEN 'Delivered' THEN 'Completed'
        WHEN 'Cancelled' THEN 'Failed'
    END AS status_message
FROM orders;

-- Q6
SELECT order_id, payment, 
    CASE payment
        WHEN 'Paid' THEN 'Payment Completed'
        WHEN 'Unpaid' THEN 'Payment Pending'
    END AS payment_message
FROM orders;

-- Q7
SELECT name, salary,
    CASE
        WHEN salary >= 100000 THEN salary * 0.15
        WHEN salary >= 60000 THEN salary * 0.10
        ELSE salary * 0.05
    END AS bonus
FROM employees;

-- Q8
SELECT name, salary, salary + 
    CASE
        WHEN salary >= 100000 THEN salary * 0.15
        WHEN salary >= 60000 THEN salary * 0.10
        ELSE salary * 0.05
    END AS final_salary
FROM employees;

-- Q9
SELECT order_id, amount,
    CASE
        WHEN amount >= 20000 THEN amount * 0.20
        WHEN amount >= 10000 THEN amount * 0.10
        WHEN amount >= 5000 THEN amount * 0.05
        ELSE 0
    END AS discount
FROM orders;

-- Q10
SELECT name, salary,
    CASE
        WHEN salary IS NULL THEN 'Not Available'
        ELSE 'Available'
    END AS salary_status
FROM employees;

-- Q11
SELECT name, marks,
    CASE 
        WHEN marks IS NULL THEN 'Not Attempted'
        WHEN marks >= 40 THEN 'Passed'
        ELSE 'Failed'
    END AS marks_status
FROM students;

-- Q12
SELECT name, salary, 
    CASE
        WHEN salary >= 80000 THEN 'High'
        ELSE 'Normal'
    END AS category
FROM employees
WHERE department = 'IT' AND status = 'Active';

-- Q13
SELECT order_id, amount, 
    CASE
        WHEN amount >= 10000 THEN 'Large'
        ELSE 'Small'
    END AS category
FROM orders
WHERE payment = 'Paid';

-- Q14
SELECT * 
FROM employees
ORDER BY
    CASE department 
        WHEN 'IT' THEN 1
        WHEN 'Finance' THEN 2
        WHEN 'Sales' THEN 3
        WHEN 'HR' THEN 4
    END;

-- Q15
SELECT * 
FROM orders
ORDER BY
    CASE status 
        WHEN 'Pending' THEN 1
        WHEN 'Shipped' THEN 2
        WHEN 'Delivered' THEN 3
        WHEN 'Cancelled' THEN 4
    END;

-- Q16
SELECT * 
FROM students
ORDER BY
    CASE 
        WHEN marks >= 90 THEN 1
        WHEN marks >= 75 THEN 2
        WHEN marks >= 60 THEN 3
        WHEN marks >= 40 THEN 4
        WHEN marks IS NULL THEN 6
        ELSE 5
    END;

-- Q17
SELECT 
    SUM(
        CASE 
            WHEN salary >= 80000 THEN 1
            ELSE 0
        END
    ) AS employee_count
FROM employees;

-- Q18
SELECT 
    SUM(
        CASE 
            WHEN salary >= 80000 THEN 1
            ELSE 0
        END
    ) AS high_salary,
    SUM(
        CASE 
            WHEN salary >= 50000 THEN 1
            ELSE 0
        END
    ) AS medium_salary,
    SUM(
        CASE 
            WHEN salary < 50000 THEN 1
            ELSE 0
        END
    ) AS low_salary
FROM employees;

-- Q19
SELECT 
    COUNT(
        CASE
            WHEN marks >= 40 THEN 1
        END
    ) AS students_count
FROM students;

SELECT 
    SUM(
        CASE
            WHEN marks >= 40 THEN 1
            ELSE 0
        END
    ) AS students_count
FROM students;

-- Q20
SELECT 
    SUM(
        CASE
            WHEN status = 'Delivered' THEN amount
            ELSE 0
        END
    ) AS total_value
FROM orders;

-- Q21
SELECT
    SUM(
        CASE 
            WHEN payment = 'Paid' THEN amount
            ELSE 0
        END
    ) AS total_paid,
    SUM(
        CASE 
            WHEN payment = 'Unpaid' THEN amount
            ELSE 0
        END
    ) AS total_unpaid
FROM orders;

-- Q22
SELECT 
    CASE 
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE 
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END;

-- Q23
SELECT department, 
    COUNT(
        CASE 
            WHEN salary >= 80000 THEN 1
        END
    ) AS high_salary_count
FROM employees
GROUP BY department;


SELECT department,
       SUM(
           CASE
               WHEN salary >= 80000 THEN 1
               ELSE 0
           END
       ) AS high_salary_count
FROM employees
GROUP BY department;

-- Q24
SELECT department,
       AVG(salary) AS avg_salary,
       CASE
           WHEN AVG(salary) >= 80000 THEN 'High'
           WHEN AVG(salary) >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS category
FROM employees
GROUP BY department;

-- Q25
SELECT department, 
    SUM(
        CASE
            WHEN salary >= 80000 THEN 1
            ELSE 0
        END
    ) AS high_salary_count
FROM employees
GROUP BY department
HAVING high_salary_count >= 2;

-- Q26
SELECT department, 
    SUM(
        CASE
            WHEN marks >= 40 THEN 1
            ELSE 0
        END
    ) AS passed_students
FROM students
GROUP BY department
HAVING passed_students >= 2;

-- Q27
SELECT order_id, amount, payment,
    CASE 
        WHEN payment = 'Unpaid' THEN 'Payment Pending'
        WHEN payment = 'Paid' AND amount >= 10000 THEN 'High Value Paid'
        WHEN payment = 'Paid' AND amount < 10000 THEN 'Low Value Paid'
    END AS category
FROM orders;

-- Q28
SELECT name, marks, attendance, 
    CASE
        WHEN marks IS NULL THEN 'Marks Missing'
        WHEN marks >= 60 AND attendance >= 75 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility
FROM students;

-- Q29
SELECT name, experience, salary, status,
    CASE
        WHEN status = 'Inactive' THEN 'Inactive'
        WHEN experience >= 5 AND salary >= 70000 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS promotion_status
FROM employees;

-- Q30
SELECT department, COUNT(emp_id) AS total_employees, 
    SUM(
        CASE
            WHEN salary >= 80000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees,
    AVG(salary) AS average_salary,
    CASE
        WHEN SUM(
            CASE
                WHEN salary >= 80000 THEN 1
                ELSE 0
            END
        ) >= 2 THEN 'Excellent'

        WHEN SUM(
            CASE
                WHEN salary >= 80000 THEN 1
                ELSE 0
            END
        ) = 1 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS department_rating
FROM employees
GROUP BY department;

-- Q31
WITH dept_stats AS (
    SELECT
        department,
        COUNT(emp_id) AS total_employees,
        SUM(
            CASE
                WHEN status = 'Active' THEN 1
                ELSE 0
            END
        ) AS active_employees,
        SUM(
            CASE
                WHEN salary >= 80000 THEN 1
                ELSE 0
            END
        ) AS high_salary_employees,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT
    department,
    total_employees,
    active_employees,
    high_salary_employees,
    average_salary,
    CASE
        WHEN high_salary_employees >= 2 THEN 'Excellent'
        WHEN high_salary_employees = 1 THEN 'Good'
        ELSE 'Average'
    END AS department_category
FROM dept_stats;