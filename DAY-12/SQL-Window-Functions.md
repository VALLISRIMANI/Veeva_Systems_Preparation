# MySQL Window Functions — Complete Notes

## 1. What is a Window Function?

A window function performs a calculation across a set of related rows **while keeping every individual row**.

### `GROUP BY` vs Window Function

Suppose:

| id | name | dept | salary |
| -: | ---- | ---- | -----: |
|  1 | A    | IT   |  50000 |
|  2 | B    | IT   |  70000 |
|  3 | C    | IT   |  60000 |
|  4 | D    | HR   |  40000 |
|  5 | E    | HR   |  50000 |

### With `GROUP BY`

```sql
SELECT dept, AVG(salary)
FROM employees
GROUP BY dept;
```

Result:

| dept |   avg |
| ---- | ----: |
| IT   | 60000 |
| HR   | 45000 |

The individual employees disappear.

### With a window function

```sql
SELECT
    name,
    dept,
    salary,
    AVG(salary) OVER(PARTITION BY dept) AS dept_avg
FROM employees;
```

Result:

| name | dept | salary | dept_avg |
| ---- | ---- | -----: | -------: |
| A    | IT   |  50000 |    60000 |
| B    | IT   |  70000 |    60000 |
| C    | IT   |  60000 |    60000 |
| D    | HR   |  40000 |    45000 |
| E    | HR   |  50000 |    45000 |

**Important:**

> `GROUP BY` reduces rows.
> Window functions preserve rows.

---

# 2. Basic Syntax

```sql
function() OVER (
    PARTITION BY column
    ORDER BY column
)
```

For example:

```sql
ROW_NUMBER() OVER(
    PARTITION BY dept
    ORDER BY salary DESC
)
```

There are three important pieces:

### `PARTITION BY`

Divides rows into groups.

```sql
PARTITION BY dept
```

Means:

> Perform the calculation separately for each department.

### `ORDER BY`

Determines the order inside each window.

```sql
ORDER BY salary DESC
```

Means:

> Highest salary first.

### Window frame

You may also see:

```sql
ROWS BETWEEN ...
```

This determines **exactly which rows around the current row** participate in the calculation.

We'll cover this later because it's especially important for `LAST_VALUE()`.

---

# 3. Ranking Functions

There are four important ranking functions:

```text
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()
```

---

# 4. ROW_NUMBER()

Assigns a **unique sequential number** to each row.

```sql
SELECT
    name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_num
FROM employees;
```

Suppose:

| name | salary |
| ---- | -----: |
| B    |  70000 |
| C    |  60000 |
| A    |  50000 |
| E    |  50000 |
| D    |  40000 |

Result:

| name | salary | row_num |
| ---- | -----: | ------: |
| B    |  70000 |       1 |
| C    |  60000 |       2 |
| A    |  50000 |       3 |
| E    |  50000 |       4 |
| D    |  40000 |       5 |

Even if salaries are equal, row numbers are different.

### With `PARTITION BY`

```sql
ROW_NUMBER() OVER(
    PARTITION BY dept
    ORDER BY salary DESC
)
```

Ranking restarts for every department.

---

# 5. RANK()

`RANK()` gives the same rank to tied values.

Suppose:

```text
Salary
70000
60000
60000
50000
```

```sql
RANK() OVER(
    ORDER BY salary DESC
)
```

Result:

| salary | rank |
| -----: | ---: |
|  70000 |    1 |
|  60000 |    2 |
|  60000 |    2 |
|  50000 |    4 |

Notice:

```text
1
2
2
4
```

Rank **3 is skipped**.

---

# 6. DENSE_RANK()

Same tied values receive the same rank, but there are **no gaps**.

```sql
DENSE_RANK() OVER(
    ORDER BY salary DESC
)
```

Result:

| salary | dense_rank |
| -----: | ---------: |
|  70000 |          1 |
|  60000 |          2 |
|  60000 |          2 |
|  50000 |          3 |

### Remember

```text
ROW_NUMBER → no ties
RANK       → ties + gaps
DENSE_RANK → ties + no gaps
```

This is extremely important for interviews.

---

# 7. NTILE()

This is the one you specifically asked about.

`NTILE(n)` divides the rows into approximately **n groups/buckets**.

For example:

```sql
NTILE(4) OVER(
    ORDER BY salary DESC
)
```

means:

> Divide the ordered rows into 4 buckets.

Suppose we have 8 employees:

| name | salary |
| ---- | -----: |
| A    |  90000 |
| B    |  80000 |
| C    |  70000 |
| D    |  60000 |
| E    |  50000 |
| F    |  40000 |
| G    |  30000 |
| H    |  20000 |

Query:

```sql
SELECT
    name,
    salary,
    NTILE(4) OVER(
        ORDER BY salary DESC
    ) AS bucket
FROM employees;
```

Result:

| name | salary | bucket |
| ---- | -----: | -----: |
| A    |  90000 |      1 |
| B    |  80000 |      1 |
| C    |  70000 |      2 |
| D    |  60000 |      2 |
| E    |  50000 |      3 |
| F    |  40000 |      3 |
| G    |  30000 |      4 |
| H    |  20000 |      4 |

So:

```text
Bucket 1 → Top 25%
Bucket 2 → Next 25%
Bucket 3 → Next 25%
Bucket 4 → Bottom 25%
```

### Why is `NTILE()` useful?

For example:

```text
Top 10%
Top 25%
Bottom 25%
Quartiles
Performance groups
Salary bands
Customer segmentation
```

### Example

```sql
NTILE(4)
```

= Quartiles

```sql
NTILE(10)
```

= Deciles

```sql
NTILE(100)
```

= Percentile-like groups.

### Important

`NTILE()` tries to distribute rows as evenly as possible.

Suppose you have **10 rows**:

```sql
NTILE(4)
```

The rows cannot be divided perfectly.

MySQL distributes them as evenly as possible:

```text
Bucket 1 → 3 rows
Bucket 2 → 3 rows
Bucket 3 → 2 rows
Bucket 4 → 2 rows
```

---

# 8. LAG()

`LAG()` accesses a value from a **previous row**.

Suppose:

| month | sales |
| ----- | ----: |
| Jan   |   100 |
| Feb   |   150 |
| Mar   |   120 |
| Apr   |   180 |

Query:

```sql
SELECT
    month,
    sales,
    LAG(sales) OVER(
        ORDER BY month
    ) AS previous_sales
FROM monthly_sales;
```

Result:

| month | sales | previous_sales |
| ----- | ----: | -------------: |
| Jan   |   100 |           NULL |
| Feb   |   150 |            100 |
| Mar   |   120 |            150 |
| Apr   |   180 |            120 |

So:

```text
LAG = look backward
```

### Calculate change

```sql
SELECT
    month,
    sales,
    sales - LAG(sales) OVER(
        ORDER BY month
    ) AS change
FROM monthly_sales;
```

Result:

| month | sales | change |
| ----- | ----: | -----: |
| Jan   |   100 |   NULL |
| Feb   |   150 |     50 |
| Mar   |   120 |    -30 |
| Apr   |   180 |     60 |

---

# 9. LEAD()

`LEAD()` is the opposite of `LAG()`.

```text
LAG  → previous row
LEAD → next row
```

```sql
SELECT
    month,
    sales,
    LEAD(sales) OVER(
        ORDER BY month
    ) AS next_sales
FROM monthly_sales;
```

Result:

| month | sales | next_sales |
| ----- | ----: | ---------: |
| Jan   |   100 |        150 |
| Feb   |   150 |        120 |
| Mar   |   120 |        180 |
| Apr   |   180 |       NULL |

---

# 10. LAG() with an offset

You don't have to look only one row back.

```sql
LAG(sales, 2)
```

means:

> Look 2 rows behind.

Example:

```sql
LAG(sales, 2) OVER(
    ORDER BY month
)
```

Similarly:

```sql
LEAD(sales, 2)
```

means:

> Look 2 rows ahead.

---

# 11. FIRST_VALUE()

Now we reach another important group.

`FIRST_VALUE()` returns the value from the **first row of the window** according to the window's ordering.

Suppose:

| name | salary |
| ---- | -----: |
| A    |  50000 |
| B    |  70000 |
| C    |  60000 |

Query:

```sql
SELECT
    name,
    salary,
    FIRST_VALUE(salary) OVER(
        ORDER BY salary DESC
    ) AS highest_salary
FROM employees;
```

Result:

| name | salary | highest_salary |
| ---- | -----: | -------------: |
| B    |  70000 |          70000 |
| C    |  60000 |          70000 |
| A    |  50000 |          70000 |

Because:

```sql
ORDER BY salary DESC
```

puts the highest salary first.

So:

```text
FIRST_VALUE = value from the first row
```

---

# 12. FIRST_VALUE() with PARTITION BY

You can find the highest salary **in each department**.

```sql
SELECT
    name,
    dept,
    salary,
    FIRST_VALUE(salary) OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS highest_dept_salary
FROM employees;
```

For IT:

```text
70000
```

For HR:

```text
50000
```

The calculation restarts for each department.

---

# 13. LAST_VALUE()

This one causes confusion in interviews.

`LAST_VALUE()` returns the value from the **last row in the window frame**.

Not necessarily the last row of the entire partition.

Example:

```sql
SELECT
    name,
    salary,
    LAST_VALUE(salary) OVER(
        ORDER BY salary
    ) AS last_salary
FROM employees;
```

You might expect every row to show the maximum salary.

But depending on the default frame, you can get surprising results.

Why?

Because window functions can have a **window frame**.

---

# 14. Window Frames

This is important.

You can specify:

```sql
ROWS BETWEEN ...
```

For example:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
         AND CURRENT ROW
```

Means:

```text
Start from the first row
        ↓
        ↓
up to the current row
```

This is basically a running window.

Another:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
         AND UNBOUNDED FOLLOWING
```

means:

```text
FIRST ROW
   ↓
   ↓
ALL ROWS
   ↓
LAST ROW
```

That means the entire partition.

---

# 15. Correct way to use LAST_VALUE()

If you want the **actual last value of the entire partition**, use:

```sql
LAST_VALUE(salary) OVER(
    ORDER BY salary
    ROWS BETWEEN UNBOUNDED PRECEDING
             AND UNBOUNDED FOLLOWING
)
```

Example:

```sql
SELECT
    name,
    salary,
    LAST_VALUE(salary) OVER(
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
FROM employees;
```

Because salaries are ordered ascending:

```text
50000
60000
70000
```

The last value is:

```text
70000
```

So every row gets:

```text
70000
```

### Key interview point

> `LAST_VALUE()` is affected by the window frame.

That's why you should understand:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
         AND UNBOUNDED FOLLOWING
```

---

# 16. FIRST_VALUE vs LAST_VALUE

Suppose salaries are:

```text
50000
60000
70000
```

Using:

```sql
ORDER BY salary
```

we get:

```text
FIRST_VALUE → 50000
LAST_VALUE  → 70000
```

Using:

```sql
ORDER BY salary DESC
```

we get:

```text
FIRST_VALUE → 70000
LAST_VALUE  → 50000
```

So the `ORDER BY` direction matters.

---

# 17. NTH_VALUE()

This returns the value from the **N-th row** of the window.

For example:

```sql
NTH_VALUE(salary, 2)
```

means:

> Give me the salary from the second row.

Example:

```sql
SELECT
    name,
    salary,
    NTH_VALUE(salary, 2) OVER(
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS second_highest
FROM employees;
```

If salaries are:

```text
70000
60000
50000
40000
```

then:

```text
second_highest = 60000
```

for each row.

### Syntax

```sql
NTH_VALUE(column, n) OVER(...)
```

Examples:

```sql
NTH_VALUE(salary, 2)
```

→ 2nd value

```sql
NTH_VALUE(salary, 3)
```

→ 3rd value

```sql
NTH_VALUE(salary, 5)
```

→ 5th value

---

# 18. Aggregate Functions as Window Functions

This is another major category.

Normal aggregate:

```sql
SUM(salary)
AVG(salary)
COUNT(*)
MIN(salary)
MAX(salary)
```

can also be used as window functions.

---

## SUM() OVER()

```sql
SELECT
    name,
    salary,
    SUM(salary) OVER() AS total_salary
FROM employees;
```

Every row gets the total salary.

---

## SUM() with PARTITION BY

```sql
SELECT
    name,
    dept,
    salary,
    SUM(salary) OVER(
        PARTITION BY dept
    ) AS dept_total
FROM employees;
```

Every employee gets their department's total.

---

# 19. Running Total

This is one of the most common window-function interview questions.

```sql
SELECT
    month,
    sales,
    SUM(sales) OVER(
        ORDER BY month
    ) AS running_total
FROM monthly_sales;
```

Suppose:

```text
Jan 100
Feb 150
Mar 120
Apr 180
```

Result:

```text
Jan → 100
Feb → 250
Mar → 370
Apr → 550
```

Conceptually:

```text
100

100 + 150 = 250

100 + 150 + 120 = 370

100 + 150 + 120 + 180 = 550
```

---

# 20. Running Average

Same concept:

```sql
SELECT
    month,
    sales,
    AVG(sales) OVER(
        ORDER BY month
    ) AS running_average
FROM monthly_sales;
```

---

# 21. COUNT() OVER()

You can count rows without grouping them away.

```sql
SELECT
    name,
    dept,
    COUNT(*) OVER(
        PARTITION BY dept
    ) AS employees_in_dept
FROM employees;
```

If IT has 3 employees:

```text
A  IT  3
B  IT  3
C  IT  3
```

---

# 22. MIN() and MAX()

Find the minimum salary in each department:

```sql
SELECT
    name,
    dept,
    salary,
    MIN(salary) OVER(
        PARTITION BY dept
    ) AS min_dept_salary
FROM employees;
```

Maximum:

```sql
MAX(salary) OVER(
    PARTITION BY dept
)
```

---

# 23. Very Important Pattern: Highest Salary Per Department

This is a classic interview problem.

### Method 1 — `RANK()`

```sql
WITH ranked AS (
    SELECT
        name,
        dept,
        salary,
        RANK() OVER(
            PARTITION BY dept
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT *
FROM ranked
WHERE rnk = 1;
```

If two people have the same highest salary, both are returned.

### Using `ROW_NUMBER()`

```sql
ROW_NUMBER() OVER(
    PARTITION BY dept
    ORDER BY salary DESC
)
```

Then:

```sql
WHERE rn = 1
```

returns only one employee per department.

---

# 24. Window Function Summary

Here's the important cheat sheet:

| Function         | Purpose                     |
| ---------------- | --------------------------- |
| `ROW_NUMBER()`   | Unique sequential number    |
| `RANK()`         | Ranking with gaps           |
| `DENSE_RANK()`   | Ranking without gaps        |
| `NTILE(n)`       | Divide rows into n buckets  |
| `LAG()`          | Previous row                |
| `LEAD()`         | Next row                    |
| `FIRST_VALUE()`  | First value in window frame |
| `LAST_VALUE()`   | Last value in window frame  |
| `NTH_VALUE()`    | Nth value in window frame   |
| `SUM() OVER()`   | Window/running total        |
| `AVG() OVER()`   | Window/running average      |
| `COUNT() OVER()` | Window count                |
| `MIN() OVER()`   | Window minimum              |
| `MAX() OVER()`   | Window maximum              |

---

# 25. The Most Important Differences

### `ROW_NUMBER`, `RANK`, `DENSE_RANK`

Remember:

```text
Scores: 100 90 90 80

ROW_NUMBER → 1 2 3 4
RANK       → 1 2 2 4
DENSE_RANK → 1 2 2 3
```

---

### `LAG` vs `LEAD`

```text
             CURRENT
               ↓
LAG  ← previous | next → LEAD
```

---

### `FIRST_VALUE` vs `LAST_VALUE`

```text
FIRST_VALUE → first row in frame
LAST_VALUE  → last row in frame
```

And **`LAST_VALUE()` + window frame** is an important interview trap.

---

### `NTILE`

```text
NTILE(2)  → 2 groups
NTILE(4)  → 4 groups
NTILE(10) → 10 groups
NTILE(100) → 100 groups
```

Think:

> **NTILE = Divide rows into buckets.**

---

# 26. One Big Example

Suppose you have:

```text
employees
--------------------------------
id | name | dept | salary
```

You can write:

```sql
SELECT
    name,
    dept,
    salary,

    ROW_NUMBER() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS row_num,

    RANK() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS rank_num,

    DENSE_RANK() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS dense_rank_num,

    NTILE(4) OVER(
        ORDER BY salary DESC
    ) AS salary_quartile,

    LAG(salary) OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS previous_salary,

    LEAD(salary) OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS next_salary,

    FIRST_VALUE(salary) OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS highest_salary,

    LAST_VALUE(salary) OVER(
        PARTITION BY dept
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS lowest_salary,

    SUM(salary) OVER(
        PARTITION BY dept
    ) AS dept_total,

    AVG(salary) OVER(
        PARTITION BY dept
    ) AS dept_average,

    MAX(salary) OVER(
        PARTITION BY dept
    ) AS dept_maximum

FROM employees;
```

This single query demonstrates almost everything important.

---

# 27. What You Should Memorize for Interviews

Don't try to memorize every query individually. Memorize these **patterns**:

### Pattern 1 — Ranking

```sql
RANK() OVER(
    PARTITION BY department
    ORDER BY salary DESC
)
```

### Pattern 2 — Top N per group

```sql
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
)
```

then:

```sql
WHERE rn <= N
```

### Pattern 3 — Previous value

```sql
LAG(column) OVER(
    ORDER BY date
)
```

### Pattern 4 — Next value

```sql
LEAD(column) OVER(
    ORDER BY date
)
```

### Pattern 5 — Running total

```sql
SUM(column) OVER(
    ORDER BY date
)
```

### Pattern 6 — Group total while keeping rows

```sql
SUM(column) OVER(
    PARTITION BY group_column
)
```

### Pattern 7 — Divide into groups

```sql
NTILE(4) OVER(
    ORDER BY column DESC
)
```

### Pattern 8 — First value

```sql
FIRST_VALUE(column) OVER(
    ORDER BY column
)
```

### Pattern 9 — Actual last value

```sql
LAST_VALUE(column) OVER(
    ORDER BY column
    ROWS BETWEEN UNBOUNDED PRECEDING
             AND UNBOUNDED FOLLOWING
)
```

### Pattern 10 — Nth value

```sql
NTH_VALUE(column, n) OVER(
    ORDER BY column
    ROWS BETWEEN UNBOUNDED PRECEDING
             AND UNBOUNDED FOLLOWING
)
```

---

## The easiest mental map

```text
                 WINDOW FUNCTIONS
                        │
       ┌────────────────┼────────────────┐
       │                │                │
    RANKING          NAVIGATION       AGGREGATES
       │                │                │
       ├─ ROW_NUMBER    ├─ LAG           ├─ SUM
       ├─ RANK          ├─ LEAD          ├─ AVG
       ├─ DENSE_RANK    ├─ FIRST_VALUE   ├─ COUNT
       └─ NTILE         ├─ LAST_VALUE    ├─ MIN
                        └─ NTH_VALUE     └─ MAX
```