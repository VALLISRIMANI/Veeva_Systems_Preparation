# MySQL JOINs — Complete Guide

A **JOIN** combines rows from two or more tables based on a related column.

Let's use these two tables throughout.

### `employees`

| emp_id | name  | dept_id | salary |
| -----: | ----- | ------: | -----: |
|    101 | Ravi  |       1 |  50000 |
|    102 | Priya |       2 |  60000 |
|    103 | Arjun |       3 |  55000 |
|    104 | Sneha |    NULL |  45000 |
|    105 | Kiran |       5 |  70000 |

### `departments`

| dept_id | dept_name |
| ------: | --------- |
|       1 | IT        |
|       2 | HR        |
|       3 | Finance   |
|       4 | Marketing |

Notice:

* Department **4** has no employee.
* Employee **Sneha** has no department.
* Employee **Kiran** has `dept_id = 5`, which doesn't exist in `departments`.

---

# 1. INNER JOIN

### Meaning

Returns **only matching rows from both tables**.

Think:

```text
Employees ∩ Departments
```

### Syntax

```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```

### Example

```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
```

### Result

| name  | dept_name |
| ----- | --------- |
| Ravi  | IT        |
| Priya | HR        |
| Arjun | Finance   |

Sneha and Kiran are excluded because their departments don't match.

Department Marketing is also excluded because it has no employee.

### Interview point

```sql
INNER JOIN
```

and

```sql
JOIN
```

are normally equivalent in MySQL.

So:

```sql
SELECT *
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
```

is the same as:

```sql
SELECT *
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
```

---

# 2. LEFT JOIN / LEFT OUTER JOIN

### Meaning

Returns:

> **All rows from the LEFT table + matching rows from the RIGHT table.**

If there is no match, the right-side columns become `NULL`.

### Syntax

```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```

### Example

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
```

### Result

| name  | dept_name |
| ----- | --------- |
| Ravi  | IT        |
| Priya | HR        |
| Arjun | Finance   |
| Sneha | NULL      |
| Kiran | NULL      |

Every employee appears because `employees` is on the **left**.

### Important rule

```sql
A LEFT JOIN B
```

means:

> Keep **A completely**, match B wherever possible.

---

# 3. RIGHT JOIN / RIGHT OUTER JOIN

### Meaning

Returns:

> **All rows from the RIGHT table + matching rows from the LEFT table.**

### Example

```sql
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
```

### Result

| name  | dept_name |
| ----- | --------- |
| Ravi  | IT        |
| Priya | HR        |
| Arjun | Finance   |
| NULL  | Marketing |

Marketing appears even though it has no employee.

Why?

Because `departments` is the **right table**.

### Easy way to remember

```text
LEFT JOIN  → keep LEFT table
RIGHT JOIN → keep RIGHT table
```

### Interview tip

Most developers prefer `LEFT JOIN` because you can usually rewrite a `RIGHT JOIN` by reversing the table order.

For example:

```sql
A RIGHT JOIN B
```

can generally be written as:

```sql
B LEFT JOIN A
```

---

# 4. FULL OUTER JOIN

### Meaning

Returns:

> **All rows from both tables**, whether they match or not.

Conceptually:

```text
LEFT JOIN + RIGHT JOIN
```

For our data:

| name  | dept_name |
| ----- | --------- |
| Ravi  | IT        |
| Priya | HR        |
| Arjun | Finance   |
| Sneha | NULL      |
| Kiran | NULL      |
| NULL  | Marketing |

### Important MySQL point 🚨

**MySQL does NOT directly support `FULL OUTER JOIN`.**

So you normally simulate it using `LEFT JOIN + UNION + RIGHT JOIN`.

### Query

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

UNION

SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
```

`UNION` removes duplicate matching rows.

### Alternative

You can also construct it using a `LEFT JOIN` plus unmatched rows from the right side, but for interviews, remember:

```text
MySQL → no native FULL OUTER JOIN
```

---

# 5. CROSS JOIN

### Meaning

Produces **every possible combination** of rows from both tables.

This is called a **Cartesian product**.

If:

```text
employees = 5 rows
departments = 4 rows
```

then:

```text
5 × 4 = 20 rows
```

### Query

```sql
SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;
```

### Example result

| name  | dept_name |
| ----- | --------- |
| Ravi  | IT        |
| Ravi  | HR        |
| Ravi  | Finance   |
| Ravi  | Marketing |
| Priya | IT        |
| Priya | HR        |
| ...   | ...       |

Every employee is paired with every department.

### Important

There is normally **no `ON` condition** in a CROSS JOIN.

```sql
FROM employees e
CROSS JOIN departments d;
```

### Use cases

Useful for things like:

* generating combinations
* product × size combinations
* dates × employees
* all possible schedules

But it can produce huge numbers of rows.

---

# 6. SELF JOIN

A **SELF JOIN** means joining a table with **itself**.

Very common interview question.

Suppose we have:

### `employees`

| emp_id | name  | manager_id |
| -----: | ----- | ---------: |
|    101 | Ravi  |       NULL |
|    102 | Priya |        101 |
|    103 | Arjun |        101 |
|    104 | Sneha |        102 |

We want:

```text
Employee → Manager
```

The manager is also stored inside the `employees` table.

### Query

```sql
SELECT
    e.name AS employee,
    m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;
```

### Result

| employee | manager |
| -------- | ------- |
| Ravi     | NULL    |
| Priya    | Ravi    |
| Arjun    | Ravi    |
| Sneha    | Priya   |

Here:

```text
e = employee
m = manager
```

Both aliases refer to the **same table**.

### Key idea

```sql
employees e
JOIN employees m
```

That's a SELF JOIN.

---

# 7. NATURAL JOIN

MySQL also supports `NATURAL JOIN`.

It automatically joins tables using columns having the **same name**.

For example, both tables have:

```text
dept_id
```

So:

```sql
SELECT *
FROM employees
NATURAL JOIN departments;
```

automatically uses:

```sql
employees.dept_id = departments.dept_id
```

### Why it is usually avoided

The join condition is implicit.

If the tables later get another column with the same name, the behavior can change unexpectedly.

For interviews:

> **NATURAL JOIN automatically joins columns with the same names.**

But in real-world SQL, explicit joins are generally clearer:

```sql
JOIN departments d
ON e.dept_id = d.dept_id
```

---

# 8. JOIN with USING

This isn't a separate join type, but it's important for interviews.

If both tables have the same column name, you can use:

```sql
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
USING (dept_id);
```

Instead of:

```sql
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
```

`USING` works when the column has the **same name in both tables**.

---

# 9. Multiple JOINs

You can join more than two tables.

Suppose we have:

```text
employees
departments
locations
```

Query:

```sql
SELECT
    e.name,
    d.dept_name,
    l.city
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
JOIN locations l
ON d.location_id = l.location_id;
```

The result combines information from all three tables.

This is extremely common in interviews.

---

# 10. JOIN with WHERE

Very important distinction.

Suppose we want employees belonging to IT.

```sql
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';
```

Here:

```sql
ON
```

specifies **how tables are related**.

```sql
WHERE
```

filters the resulting rows.

---

# 11. LEFT JOIN + WHERE — Important Interview Trap 🚨

Consider:

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';
```

This effectively removes rows where `d.dept_name` is `NULL`.

So although you wrote:

```sql
LEFT JOIN
```

the filtering can make it behave like an inner join for that condition.

### If you want to keep employees without departments

Put the condition in `ON`:

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
AND d.dept_name = 'IT';
```

This distinction is **very important for SQL interviews**.

---

# 12. Finding Unmatched Rows

This is one of the most frequently asked JOIN patterns.

### Employees without a department

```sql
SELECT e.name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
```

Result:

```text
Sneha
Kiran
```

### Pattern to remember

```sql
LEFT JOIN
WHERE right_table.id IS NULL
```

means:

> Find records in the left table that don't have a match in the right table.

---

# 13. Find Departments With No Employees

Reverse the previous logic:

```sql
SELECT d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
```

Result:

```text
Marketing
```

---

# JOINs Visualized

Think of two sets:

```text
A = employees
B = departments
```

### INNER JOIN

```text
      A       B
     ┌───┐ ┌───┐
     │   │███│   │
     │   │███│   │
     └───┘ └───┘
        only match
```

### LEFT JOIN

```text
      A       B
     ┌────┐┌───┐
     │████│███ │
     │████│███ │
     └────┘└───┘
       ALL A
```

### RIGHT JOIN

```text
      A       B
     ┌───┐┌────┐
     │   │██████│
     │   │██████│
     └───┘└────┘
          ALL B
```

### FULL OUTER JOIN

```text
      A       B
     ┌────┐┌────┐
     │███████████│
     │███████████│
     └────┘└────┘
       ALL A + B
```

### CROSS JOIN

```text
A × B

Every row of A
      ↓
Every row of B
```

---

# The Most Important Comparison

| JOIN              | What does it return?                   |
| ----------------- | -------------------------------------- |
| `INNER JOIN`      | Only matching rows                     |
| `LEFT JOIN`       | All left + matching right              |
| `RIGHT JOIN`      | All right + matching left              |
| `FULL OUTER JOIN` | All rows from both                     |
| `CROSS JOIN`      | Every possible combination             |
| `SELF JOIN`       | Table joined with itself               |
| `NATURAL JOIN`    | Automatically joins same-named columns |

---

# ⭐ Interview Cheat Sheet

Remember this:

```text
INNER
   ↓
Only matching

LEFT
   ↓
Everything from LEFT

RIGHT
   ↓
Everything from RIGHT

FULL
   ↓
Everything from BOTH

CROSS
   ↓
EVERY combination

SELF
   ↓
Table with ITSELF

NATURAL
   ↓
Automatically matching same-named columns
```

### Most important SQL patterns to practice

```sql
-- 1. Matching records
SELECT *
FROM A
INNER JOIN B
ON A.id = B.id;
```

```sql
-- 2. All A + matching B
SELECT *
FROM A
LEFT JOIN B
ON A.id = B.id;
```

```sql
-- 3. A records having NO match in B
SELECT A.*
FROM A
LEFT JOIN B
ON A.id = B.id
WHERE B.id IS NULL;
```

```sql
-- 4. All B + matching A
SELECT *
FROM A
RIGHT JOIN B
ON A.id = B.id;
```

```sql
-- 5. All combinations
SELECT *
FROM A
CROSS JOIN B;
```

```sql
-- 6. Table joined with itself
SELECT e.name, m.name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;
```