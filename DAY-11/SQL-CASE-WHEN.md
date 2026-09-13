`CASE WHEN` in MySQL is used to **apply conditions and return different values depending on which condition is true**.

Think of it as the SQL version of **if–else if–else**.

## 1. Basic Syntax

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN condition3 THEN result3
    ELSE result4
END
```

### Example

Suppose we have:

| student_id | name  | marks |
| ---------: | ----- | ----: |
|          1 | Ravi  |    85 |
|          2 | Anu   |    72 |
|          3 | Kiran |    45 |
|          4 | Priya |    30 |

Query:

```sql
SELECT name, marks,
       CASE
           WHEN marks >= 80 THEN 'A'
           WHEN marks >= 60 THEN 'B'
           WHEN marks >= 40 THEN 'C'
           ELSE 'F'
       END AS grade
FROM students;
```

Result:

| name  | marks | grade |
| ----- | ----: | ----- |
| Ravi  |    85 | A     |
| Anu   |    72 | B     |
| Kiran |    45 | C     |
| Priya |    30 | F     |

### How MySQL evaluates it

For Ravi:

```text
85 >= 80 → TRUE → 'A'
```

It **stops there**.

For Anu:

```text
72 >= 80 → FALSE
72 >= 60 → TRUE → 'B'
```

For Priya:

```text
30 >= 80 → FALSE
30 >= 60 → FALSE
30 >= 40 → FALSE
ELSE → 'F'
```

---

# 2. CASE WHEN Without ELSE

`ELSE` is optional.

```sql
SELECT name,
       CASE
           WHEN marks >= 40 THEN 'Pass'
       END AS result
FROM students;
```

If no condition matches, MySQL returns:

```text
NULL
```

So generally, use `ELSE` when you want to avoid unexpected `NULL`s.

---

# 3. CASE WHEN With Multiple Conditions

You can combine conditions using `AND`, `OR`, etc.

Example:

```sql
SELECT name, marks,
       CASE
           WHEN marks >= 90 THEN 'Excellent'
           WHEN marks >= 75 AND marks < 90 THEN 'Very Good'
           WHEN marks >= 50 AND marks < 75 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS performance
FROM students;
```

### Important

The conditions are checked **from top to bottom**.

So this:

```sql
CASE
    WHEN marks >= 40 THEN 'Pass'
    WHEN marks >= 80 THEN 'Excellent'
END
```

is wrong logically.

A mark of `85` satisfies:

```sql
marks >= 40
```

first, so it returns `Pass` and never reaches `Excellent`.

Put **more specific / higher-priority conditions first**.

---

# 4. CASE WHEN in SELECT

This is the most common use.

```sql
SELECT employee_name,
       salary,
       CASE
           WHEN salary >= 100000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;
```

You are creating a **derived/calculated column**.

---

# 5. CASE WHEN in WHERE

You *can* use `CASE` in `WHERE`, but usually a normal boolean condition is clearer.

Example:

```sql
SELECT *
FROM employees
WHERE
    CASE
        WHEN department = 'IT' THEN salary >= 60000
        ELSE salary >= 40000
    END;
```

This means:

```text
IT employees    → salary must be >= 60000
Other employees → salary must be >= 40000
```

However, for interviews, remember that `CASE` is primarily used to **produce values**, not as a replacement for every `WHERE` condition.

---

# 6. CASE WHEN in ORDER BY ⭐

Very useful for interviews.

Suppose we want:

```text
Manager
Developer
Tester
Other
```

in that specific order.

```sql
SELECT employee_name, role
FROM employees
ORDER BY
    CASE
        WHEN role = 'Manager' THEN 1
        WHEN role = 'Developer' THEN 2
        WHEN role = 'Tester' THEN 3
        ELSE 4
    END;
```

Here, `CASE` creates a temporary sorting priority:

```text
Manager   → 1
Developer → 2
Tester    → 3
Other     → 4
```

Then `ORDER BY` sorts using those numbers.

---

# 7. CASE WHEN in GROUP BY

You can group values into categories.

Suppose:

| employee | salary |
| -------- | -----: |
| A        |  30000 |
| B        |  45000 |
| C        |  70000 |
| D        | 120000 |

```sql
SELECT
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary < 100000 THEN 'Medium'
        ELSE 'High'
    END AS salary_range,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary < 100000 THEN 'Medium'
        ELSE 'High'
    END;
```

Result:

| salary_range | employee_count |
| ------------ | -------------: |
| Low          |              2 |
| Medium       |              1 |
| High         |              1 |

---

# 8. CASE WHEN With Aggregate Functions ⭐

This is **very important for SQL interviews**.

You can use `CASE` inside `SUM`, `COUNT`, etc.

### Count employees whose salary is above 50,000

```sql
SELECT
    SUM(
        CASE
            WHEN salary > 50000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM employees;
```

Why does this work?

For each employee:

```text
salary > 50000 → 1
otherwise      → 0
```

Then `SUM()` adds them.

---

# 9. Conditional COUNT

Another common pattern:

```sql
SELECT
    COUNT(CASE
              WHEN salary > 50000 THEN 1
          END) AS high_salary_employees
FROM employees;
```

Why does this work?

If condition is false, `CASE` returns `NULL`.

`COUNT(expression)` ignores `NULL`.

So only matching rows are counted.

---

# 10. CASE + SUM for Multiple Categories ⭐

Suppose we want to count:

* High salary employees
* Medium salary employees
* Low salary employees

```sql
SELECT
    SUM(CASE
            WHEN salary >= 100000 THEN 1
            ELSE 0
        END) AS high_salary,

    SUM(CASE
            WHEN salary >= 50000 AND salary < 100000 THEN 1
            ELSE 0
        END) AS medium_salary,

    SUM(CASE
            WHEN salary < 50000 THEN 1
            ELSE 0
        END) AS low_salary
FROM employees;
```

Result could be:

| high_salary | medium_salary | low_salary |
| ----------: | ------------: | ---------: |
|           3 |             8 |          5 |

This pattern is extremely useful in SQL coding rounds.

---

# 11. Simple CASE vs Searched CASE

There are **two forms** of `CASE`.

## A. Searched CASE ⭐

This is the one you'll use most.

```sql
CASE
    WHEN marks >= 80 THEN 'A'
    WHEN marks >= 60 THEN 'B'
    ELSE 'C'
END
```

Each `WHEN` contains a **condition**.

---

## B. Simple CASE

Here you compare one expression against different values.

```sql
CASE department
    WHEN 'IT' THEN 'Technology'
    WHEN 'HR' THEN 'Human Resources'
    WHEN 'Sales' THEN 'Business'
    ELSE 'Other'
END
```

Equivalent idea:

```text
IF department = 'IT'
→ Technology

IF department = 'HR'
→ Human Resources

IF department = 'Sales'
→ Business
```

### Difference

**Simple CASE:**

```sql
CASE column
    WHEN value1 THEN ...
    WHEN value2 THEN ...
END
```

**Searched CASE:**

```sql
CASE
    WHEN condition1 THEN ...
    WHEN condition2 THEN ...
END
```

For example:

```sql
-- Simple
CASE status
    WHEN 'P' THEN 'Pending'
    WHEN 'C' THEN 'Completed'
END
```

vs.

```sql
-- Searched
CASE
    WHEN amount > 10000 THEN 'Large'
    WHEN amount > 5000 THEN 'Medium'
    ELSE 'Small'
END
```

---

# 12. CASE WHEN + NULL ⭐

Be careful with `NULL`.

Don't write:

```sql
WHEN salary = NULL
```

❌ Wrong.

Use:

```sql
WHEN salary IS NULL
```

Example:

```sql
SELECT employee_name,
       CASE
           WHEN salary IS NULL THEN 'Salary Not Available'
           WHEN salary >= 50000 THEN 'High'
           ELSE 'Low'
       END AS category
FROM employees;
```

---

# 13. CASE WHEN for Custom Labels

Suppose orders have statuses:

```text
PENDING
SHIPPED
DELIVERED
CANCELLED
```

You can convert them into user-friendly labels:

```sql
SELECT order_id,
       CASE status
           WHEN 'PENDING' THEN 'Order Processing'
           WHEN 'SHIPPED' THEN 'On the Way'
           WHEN 'DELIVERED' THEN 'Delivered Successfully'
           WHEN 'CANCELLED' THEN 'Order Cancelled'
           ELSE 'Unknown Status'
       END AS status_message
FROM orders;
```

---

# 14. CASE WHEN for Calculations ⭐

You can return numbers, not just text.

Example: Give a 10% bonus if salary is below 50,000.

```sql
SELECT employee_name,
       salary,
       CASE
           WHEN salary < 50000 THEN salary * 0.10
           ELSE 0
       END AS bonus
FROM employees;
```

You can also calculate final salary:

```sql
SELECT employee_name,
       salary +
       CASE
           WHEN salary < 50000 THEN salary * 0.10
           ELSE 0
       END AS final_salary
FROM employees;
```

---

# 15. CASE WHEN + WHERE + GROUP BY + HAVING

This is the kind of combination you should know for interviews.

Suppose:

```text
employees
---------
id
name
department
salary
```

Find departments where the number of high-salary employees is greater than 2.

```sql
SELECT department,
       SUM(
           CASE
               WHEN salary >= 80000 THEN 1
               ELSE 0
           END
       ) AS high_salary_count
FROM employees
GROUP BY department
HAVING
    SUM(
        CASE
            WHEN salary >= 80000 THEN 1
            ELSE 0
        END
    ) > 2;
```

The flow is:

```text
FROM
 ↓
GROUP BY
 ↓
CASE + SUM
 ↓
HAVING
```

---

# 16. CASE WHEN vs IF()

MySQL also has:

```sql
IF(condition, true_value, false_value)
```

Example:

```sql
SELECT name,
       IF(marks >= 40, 'Pass', 'Fail') AS result
FROM students;
```

But `CASE` is more flexible:

```sql
CASE
    WHEN marks >= 80 THEN 'A'
    WHEN marks >= 60 THEN 'B'
    WHEN marks >= 40 THEN 'C'
    ELSE 'F'
END
```

### Interview tip

For simple two-way conditions:

```sql
IF()
```

can be convenient.

For multiple conditions and portable SQL:

```sql
CASE WHEN
```

is generally preferred.

---

# 17. Most Important Interview Patterns

You should remember these **5 patterns**:

### Pattern 1 — Categorization

```sql
CASE
    WHEN condition1 THEN 'Category 1'
    WHEN condition2 THEN 'Category 2'
    ELSE 'Category 3'
END
```

### Pattern 2 — Conditional counting

```sql
SUM(CASE
        WHEN condition THEN 1
        ELSE 0
    END)
```

### Pattern 3 — Conditional aggregation

```sql
SUM(CASE WHEN condition THEN amount ELSE 0 END)
```

### Pattern 4 — Custom sorting

```sql
ORDER BY
CASE
    WHEN condition1 THEN 1
    WHEN condition2 THEN 2
    ELSE 3
END
```

### Pattern 5 — NULL handling

```sql
CASE
    WHEN column IS NULL THEN 'Not Available'
    ELSE column
END
```

---

## ⭐ Key rules to memorize

```text
CASE
 ↓
WHEN condition
 ↓
THEN result
 ↓
WHEN condition
 ↓
THEN result
 ↓
ELSE result
 ↓
END
```

Remember:

1. `CASE` starts the expression.
2. `WHEN` contains the condition.
3. `THEN` gives the result.
4. Multiple `WHEN`s are allowed.
5. `ELSE` is optional.
6. `END` is mandatory.
7. Conditions are checked **top to bottom**.
8. First matching `WHEN` is returned.
9. No match + no `ELSE` → `NULL`.
10. `CASE` can be used with `SELECT`, `ORDER BY`, `GROUP BY`, aggregate functions, and in other SQL expressions.