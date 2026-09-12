# MySQL CTEs — Complete Guide

# 1. What is a CTE?

**CTE = Common Table Expression**

A CTE is a **temporary named result set** that you define using `WITH` and use within a single SQL statement.

Think of it as:

> **Give a name to an intermediate query result, then use that name in the main query.**

### Basic structure

```sql
WITH cte_name AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT *
FROM cte_name;
```

### Example

```sql
WITH high_salary AS (
    SELECT emp_id, name, salary
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary;
```

### Flow

```text
employees
    ↓
WHERE salary > 80000
    ↓
high_salary CTE
    ↓
SELECT
```

---

# 2. Why Do We Use CTEs?

CTEs are mainly used to:

1. Make complex queries easier to understand
2. Break a large query into smaller steps
3. Reuse an intermediate result within the same statement
4. Work with window functions
5. Perform multi-step aggregations
6. Solve ranking problems
7. Solve hierarchical problems using recursive CTEs

---

# 3. CTE Syntax

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```

### Important

The `WITH` clause comes **before the main query**.

Correct:

```sql
WITH data AS (
    SELECT *
    FROM employees
)
SELECT *
FROM data;
```

Incorrect:

```sql
SELECT *
FROM employees
WITH data AS (...);
```

---

# 4. CTE Exists Only for One Statement

A CTE is not a permanent table.

```sql
WITH employee_data AS (
    SELECT *
    FROM employees
)
SELECT *
FROM employee_data;
```

This works.

But after that statement:

```sql
SELECT *
FROM employee_data;
```

❌ Error — the CTE no longer exists.

### Remember

```text
CTE
 ↓
One SQL statement
 ↓
Destroyed / out of scope
```

---

# 5. CTE Does NOT Create a Permanent Table

This:

```sql
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary;
```

does **not** create:

```text
high_salary table
```

inside your database.

It is only available for that statement.

---

# 6. CTE vs Subquery

### Subquery

```sql
SELECT *
FROM (
    SELECT *
    FROM employees
    WHERE salary > 80000
) AS data;
```

### CTE

```sql
WITH data AS (
    SELECT *
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM data;
```

Both can solve similar problems.

### Difference

| CTE                                             | Subquery                               |
| ----------------------------------------------- | -------------------------------------- |
| Uses `WITH`                                     | Uses nested `SELECT`                   |
| More readable for complex queries               | Can become deeply nested               |
| Can be referenced multiple times in a statement | Usually needs to be repeated           |
| Supports recursive queries                      | Doesn't support recursive CTE behavior |
| Temporary named result                          | Inline result                          |

### Interview answer

> A CTE is a named temporary result set defined using `WITH`. It improves readability and is particularly useful for multi-step and recursive queries.

---

# 7. CTE vs Temporary Table

This is another common interview question.

### CTE

```sql
WITH data AS (...)
SELECT *
FROM data;
```

### Temporary table

```sql
CREATE TEMPORARY TABLE data AS
SELECT *
FROM employees;
```

| CTE                         | Temporary Table                    |
| --------------------------- | ---------------------------------- |
| Exists for one statement    | Exists for a longer session/scope  |
| No explicit table creation  | Table is actually created          |
| Good for query organization | Good for storing intermediate data |
| Supports recursive CTEs     | No built-in recursive behavior     |
| Usually simpler             | More overhead/management           |

### Interview trap

Don't say:

> "CTE is stored permanently."

❌ Wrong.

---

# 8. Simple CTE Example

Find employees earning more than 80,000.

```sql
WITH high_salary AS (
    SELECT emp_id, name, salary
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary;
```

---

# 9. CTE with `WHERE`

```sql
WITH it_employees AS (
    SELECT *
    FROM employees
    WHERE department_id = 20
)
SELECT *
FROM it_employees
WHERE salary > 80000;
```

Here there are two filtering stages:

```text
employees
   ↓
department = IT
   ↓
it_employees
   ↓
salary > 80000
```

---

# 10. Multiple CTEs ⭐

You can define multiple CTEs with one `WITH`.

```sql
WITH cte1 AS (
    SELECT ...
),
cte2 AS (
    SELECT ...
    FROM cte1
),
cte3 AS (
    SELECT ...
    FROM cte2
)
SELECT *
FROM cte3;
```

### Example

```sql
WITH employee_data AS (
    SELECT *
    FROM employees
    WHERE salary >= 70000
),
it_employees AS (
    SELECT *
    FROM employee_data
    WHERE department_id = 20
)
SELECT *
FROM it_employees;
```

### Important

The second CTE can use the first CTE.

```text
employees
   ↓
employee_data
   ↓
it_employees
   ↓
main query
```

---

# 11. A CTE Can Be Referenced Multiple Times

Example:

```sql
WITH employee_data AS (
    SELECT *
    FROM employees
    WHERE salary > 70000
)
SELECT
    e1.name AS employee1,
    e2.name AS employee2
FROM employee_data e1
JOIN employee_data e2
    ON e1.department_id = e2.department_id
   AND e1.emp_id < e2.emp_id;
```

The same CTE is referenced as:

```text
employee_data e1
employee_data e2
```

---

# 12. CTE with `GROUP BY` ⭐

Calculate average salary per department.

```sql
WITH department_data AS (
    SELECT
        department_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM department_data;
```

Result conceptually:

```text
department_id | employee_count | average_salary
------------------------------------------------
10            | 2              | 92500
20            | 3              | 81666.67
30            | 3              | 63333.33
40            | 2              | 80000
```

---

# 13. CTE with `HAVING`

Find departments whose average salary is greater than 75,000.

```sql
WITH department_data AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 75000
)
SELECT *
FROM department_data;
```

### Why `HAVING`?

Because:

```sql
AVG(salary)
```

is an aggregate.

Remember:

```text
WHERE
 ↓
filters rows

HAVING
 ↓
filters groups
```

---

# 14. CTE with `JOIN`

```sql
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 70000
)
SELECT
    h.name,
    d.department_name,
    h.salary
FROM high_salary h
JOIN departments d
    ON h.department_id = d.department_id;
```

---

# 15. CTE + Aggregation + Filtering ⭐

Find departments whose average salary is above the company-wide average.

```sql
WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    d.department_id,
    d.avg_salary
FROM department_average d
CROSS JOIN company_average c
WHERE d.avg_salary > c.avg_salary;
```

This is a very useful interview pattern.

### Think:

```text
Employee data
     ↓
GROUP BY department
     ↓
Department averages
     ↓
Compare with company average
```

---

# 16. CTE + Window Functions ⭐⭐⭐

This is one of the **most important uses of CTEs in SQL interviews**.

Suppose we want to assign row numbers based on salary.

```sql
WITH ranked_employees AS (
    SELECT
        emp_id,
        name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked_employees;
```

Result:

```text
name       salary    rn
------------------------
Grace      95000     1
Alice      90000     2
Charlie    85000     3
Frank      85000     4
...
```

---

# 17. Why Do We Need a CTE with Window Functions?

Suppose:

```sql
SELECT
    name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
FROM employees
WHERE rn = 1;
```

❌ You generally cannot use the window-function alias `rn` directly in the `WHERE` of that same query block.

Instead:

```sql
WITH ranked AS (
    SELECT
        name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn = 1;
```

### Pattern to memorize:

```text
Window function
       ↓
CTE
       ↓
WHERE
```

---

# 18. `ROW_NUMBER()` with CTE ⭐⭐⭐

Find the highest-paid employee.

```sql
WITH ranked AS (
    SELECT
        emp_id,
        name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn = 1;
```

---

# 19. Highest-Paid Employee in Each Department ⭐⭐⭐

This is extremely important.

```sql
WITH ranked AS (
    SELECT
        emp_id,
        name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT
    emp_id,
    name,
    department_id,
    salary
FROM ranked
WHERE rn = 1;
```

### Why `PARTITION BY`?

Without:

```sql
PARTITION BY department_id
```

we rank the **entire company**.

With:

```sql
PARTITION BY department_id
```

ranking restarts for every department.

---

# 20. `PARTITION BY` — Very Important

### Entire company

```sql
ROW_NUMBER() OVER (
    ORDER BY salary DESC
)
```

### Each department

```sql
ROW_NUMBER() OVER (
    PARTITION BY department_id
    ORDER BY salary DESC
)
```

Think:

```text
NO PARTITION
────────────────
Company
  ↓
1
2
3
4
5


PARTITION BY department
───────────────────────
HR
  ↓
1
2

IT
  ↓
1
2
3

Sales
  ↓
1
2
3
```

---

# 21. Second-Highest Employee in Each Department

Using `ROW_NUMBER()`:

```sql
WITH ranked AS (
    SELECT
        emp_id,
        name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn = 2;
```

This means:

> Give me the second **row** in each department after sorting by salary.

---

# 22. `ROW_NUMBER()` vs `RANK()` vs `DENSE_RANK()` ⭐⭐⭐

You absolutely should know this for interviews.

Suppose salaries are:

```text
100000
90000
90000
80000
```

### ROW_NUMBER()

```text
100000 → 1
90000  → 2
90000  → 3
80000  → 4
```

Every row gets a unique number.

---

### RANK()

```text
100000 → 1
90000  → 2
90000  → 2
80000  → 4
```

Ranks are skipped after ties.

---

### DENSE_RANK()

```text
100000 → 1
90000  → 2
90000  → 2
80000  → 3
```

No gaps.

---

# 23. When to Use Which?

### "Second employee"

Use:

```sql
ROW_NUMBER()
```

### "Second-highest distinct salary"

Use:

```sql
DENSE_RANK()
```

### "Competition ranking"

Use:

```sql
RANK()
```

---

# 24. Second-Highest Distinct Salary ⭐⭐⭐

```sql
WITH ranked AS (
    SELECT
        emp_id,
        name,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT *
FROM ranked
WHERE rnk = 2;
```

Notice there is **no `PARTITION BY`**.

Why?

Because we're asking about the **whole company**.

---

# 25. Second-Highest Salary in Each Department

```sql
WITH ranked AS (
    SELECT
        emp_id,
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
FROM ranked
WHERE rnk = 2;
```

---

# 26. Top 2 Employees in Each Department

```sql
WITH ranked AS (
    SELECT
        emp_id,
        name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn <= 2;
```

---

# 27. CTE + Window Aggregate

Find employees earning more than their department average.

```sql
WITH employee_data AS (
    SELECT
        emp_id,
        name,
        department_id,
        salary,
        AVG(salary) OVER (
            PARTITION BY department_id
        ) AS department_average
    FROM employees
)
SELECT
    emp_id,
    name,
    department_id,
    salary
FROM employee_data
WHERE salary > department_average;
```

This is a very important pattern.

---

# 28. CTE + `LAG()`

CTEs can also be used with `LAG()`.

Example:

```sql
WITH salary_data AS (
    SELECT
        emp_id,
        name,
        salary,
        LAG(salary) OVER (
            ORDER BY salary
        ) AS previous_salary
    FROM employees
)
SELECT *
FROM salary_data;
```

You can then perform calculations using the previous row.

---

# 29. CTE + `LEAD()`

```sql
WITH salary_data AS (
    SELECT
        emp_id,
        name,
        salary,
        LEAD(salary) OVER (
            ORDER BY salary
        ) AS next_salary
    FROM employees
)
SELECT *
FROM salary_data;
```

Again:

```text
Window function
       ↓
CTE
       ↓
Filter/calculate/use result
```

---

# 30. Recursive CTE ⭐⭐⭐

A recursive CTE is a CTE that refers to **itself**.

Used for:

* Employee hierarchies
* Manager relationships
* Organization trees
* Category trees
* Parent-child relationships
* Number/date generation

Syntax:

```sql
WITH RECURSIVE cte_name AS (

    -- Anchor query

    UNION ALL

    -- Recursive query
)
SELECT *
FROM cte_name;
```

---

# 31. Three Parts of a Recursive CTE

Remember:

```text
        RECURSIVE CTE
             │
     ┌───────┴────────┐
     ↓                ↓
  ANCHOR          RECURSIVE
     │                │
 starting point    next rows
     └───────┬────────┘
             ↓
      TERMINATION
```

---

# 32. Recursive CTE Example — Numbers

Generate 1 to 10.

```sql
WITH RECURSIVE numbers AS (

    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT *
FROM numbers;
```

Result:

```text
1
2
3
4
5
6
7
8
9
10
```

---

# 33. How Number Recursion Works

### First:

```sql
SELECT 1 AS n
```

gives:

```text
1
```

### Recursive step:

```sql
SELECT n + 1
FROM numbers
WHERE n < 10
```

Then:

```text
1 → 2
2 → 3
3 → 4
...
9 → 10
```

When:

```text
n = 10
```

the condition:

```sql
n < 10
```

becomes false.

Recursion stops.

---

# 34. Recursive CTE Must Have a Termination Condition ⚠️

Correct:

```sql
SELECT n + 1
FROM numbers
WHERE n < 10
```

The:

```sql
WHERE n < 10
```

controls termination.

Without an appropriate stopping condition, recursion can continue until MySQL's recursion limit/error handling stops it.

### Interview answer

> A recursive CTE needs an anchor query and a recursive query, and the recursive part must have a condition that eventually stops generating rows.

---

# 35. Employee Hierarchy Using Recursive CTE ⭐⭐⭐

Suppose:

```text
Alice
 ├── Bob
 │    ├── David
 │    ├── Emma
 │    └── Henry
 └── Charlie
      ├── Frank
      ├── Irene
      └── Jack
```

We can retrieve this hierarchy.

```sql
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

    -- Recursive
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
```

---

# 36. Anchor Member

The anchor identifies the **starting row(s)**.

```sql
SELECT
    emp_id,
    name,
    manager_id,
    1 AS level
FROM employees
WHERE manager_id IS NULL
```

Here:

```text
manager_id IS NULL
```

means:

> This employee is at the top of the hierarchy.

---

# 37. Recursive Member

```sql
SELECT
    e.emp_id,
    e.name,
    e.manager_id,
    eh.level + 1
FROM employees e
JOIN employee_hierarchy eh
    ON e.manager_id = eh.emp_id
```

This says:

> Find employees whose manager is someone already found in the hierarchy.

---

# 38. Why `level + 1`?

Starting employee:

```text
Alice → level 1
```

Alice's employees:

```text
Bob     → level 2
Charlie → level 2
Grace   → level 2
```

Bob's employees:

```text
David → level 3
Emma  → level 3
Henry → level 3
```

So:

```sql
eh.level + 1
```

moves one level deeper.

---

# 39. Recursive CTE vs Normal CTE

| Normal CTE                    | Recursive CTE                       |
| ----------------------------- | ----------------------------------- |
| Does not refer to itself      | Refers to itself                    |
| `WITH`                        | `WITH RECURSIVE`                    |
| Used for intermediate results | Used for hierarchical/repeated data |
| No recursion                  | Anchor + recursive member           |
| Simpler                       | More complex                        |

---

# 40. `UNION` vs `UNION ALL`

Important in recursive CTE questions.

### `UNION`

Removes duplicates.

```sql
SELECT ...
UNION
SELECT ...
```

### `UNION ALL`

Keeps duplicates.

```sql
SELECT ...
UNION ALL
SELECT ...
```

Recursive CTEs commonly use:

```sql
UNION ALL
```

because it avoids the duplicate-elimination overhead of `UNION` and is the usual recursive pattern.

---

# 41. CTE + `DISTINCT`

CTEs can contain `DISTINCT` normally.

```sql
WITH departments_data AS (
    SELECT DISTINCT department_id
    FROM employees
)
SELECT *
FROM departments_data;
```

---

# 42. CTE + `ORDER BY`

You can use `ORDER BY` in appropriate query contexts, but don't assume ordering inside a CTE guarantees the final output order.

For final ordering:

```sql
WITH data AS (
    SELECT *
    FROM employees
)
SELECT *
FROM data
ORDER BY salary DESC;
```

### Best practice

Put the final `ORDER BY` in the outermost query when you care about the displayed result order.

---

# 43. CTE + `LIMIT`

```sql
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 70000
)
SELECT *
FROM high_salary
ORDER BY salary DESC
LIMIT 3;
```

---

# 44. CTE Column Names

You can optionally specify CTE column names:

```sql
WITH employee_data(emp_id, employee_name, employee_salary) AS (
    SELECT
        emp_id,
        name,
        salary
    FROM employees
)
SELECT *
FROM employee_data;
```

The names correspond to the columns returned by the CTE query.

---

# 45. CTE Names and Aliases

A CTE can have a table alias in the main query:

```sql
WITH employee_data AS (
    SELECT *
    FROM employees
)
SELECT e.name
FROM employee_data e;
```

Here:

```text
employee_data = CTE name
e             = alias
```

---

# 46. CTE + Self Join

Example: employee vs manager.

```sql
WITH employee_data AS (
    SELECT
        emp_id,
        name,
        manager_id,
        salary
    FROM employees
)
SELECT
    e.name AS employee_name,
    m.name AS manager_name,
    e.salary AS employee_salary,
    m.salary AS manager_salary
FROM employee_data e
JOIN employee_data m
    ON e.manager_id = m.emp_id;
```

This is useful when the same table contains both employees and managers.

---

# 47. Find Employees Earning More Than Their Manager

```sql
WITH employee_data AS (
    SELECT
        emp_id,
        name,
        manager_id,
        salary
    FROM employees
)
SELECT
    e.name AS employee_name,
    m.name AS manager_name,
    e.salary AS employee_salary,
    m.salary AS manager_salary
FROM employee_data e
JOIN employee_data m
    ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;
```

---

# 48. CTE + Duplicate Detection

Find salaries that occur more than once.

```sql
WITH duplicate_salaries AS (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
)
SELECT *
FROM duplicate_salaries;
```

To get employees:

```sql
WITH duplicate_salaries AS (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
)
SELECT
    e.name,
    e.salary
FROM employees e
JOIN duplicate_salaries d
    ON e.salary = d.salary;
```

---

# 49. CTE + Top N Pattern

General pattern:

```sql
WITH ranked AS (
    SELECT
        ...,
        ROW_NUMBER() OVER (
            PARTITION BY ...
            ORDER BY ... DESC
        ) AS rn
    FROM ...
)
SELECT *
FROM ranked
WHERE rn <= N;
```

For example, top 3 employees per department:

```sql
WITH ranked AS (
    SELECT
        name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn <= 3;
```

---

# 50. CTE + Nth Highest Pattern

General pattern:

```sql
WITH ranked AS (
    SELECT
        ...,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT *
FROM ranked
WHERE rnk = N;
```

For example, third-highest distinct salary:

```sql
WITH ranked AS (
    SELECT
        name,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
)
SELECT *
FROM ranked
WHERE rnk = 3;
```

---

# 51. CTE Performance ⚠️

This is an important interview question.

### Question:

**"Are CTEs faster than subqueries?"**

### Correct answer:

> Not necessarily. A CTE is primarily a way to structure and organize a query. Performance depends on the query, execution plan, indexes, optimizer behavior, and how MySQL handles the CTE.

Never say:

> "CTEs are always faster."

❌ Wrong.

---

# 52. CTE Does Not Automatically Improve Performance

Suppose:

```sql
WITH data AS (
    SELECT *
    FROM employees
)
SELECT *
FROM data;
```

This doesn't magically make the query faster.

The main benefit is:

```text
READABILITY
MAINTAINABILITY
REUSABILITY WITHIN THE STATEMENT
RECURSION
```

---

# 53. CTE and Materialization

For interview purposes, know the term **materialization**.

A database optimizer may handle a CTE by:

* merging it into the surrounding query, or
* materializing its result as an intermediate result.

You should **not** assume that every CTE is physically stored as a temporary table.

### Good interview answer

> "A CTE is a logical query construct. Depending on the optimizer and query, MySQL may merge or materialize it; therefore, I don't assume a CTE is always physically stored."

---

# 54. CTE and Indexes

A CTE doesn't automatically create indexes.

If the underlying query uses:

```sql
WHERE department_id = 20
```

performance can still depend on indexes on the underlying table.

For example:

```sql
CREATE INDEX idx_department
ON employees(department_id);
```

can help relevant queries.

### Important

CTE ≠ index.

---

# 55. CTE with `INSERT`, `UPDATE`, and `DELETE`

CTEs aren't conceptually limited to `SELECT` queries; MySQL supports CTEs in supported data-change statement forms subject to its syntax and restrictions.

For placement interviews, knowing the **concept** is enough unless the interviewer specifically focuses on advanced MySQL.

Don't spend most of your preparation time here.

---

# 56. Common CTE Mistakes ⚠️

### Mistake 1 — Forgetting parentheses

Wrong:

```sql
WITH data AS
    SELECT *
    FROM employees
```

Correct:

```sql
WITH data AS (
    SELECT *
    FROM employees
)
```

---

### Mistake 2 — Forgetting the final query

Wrong:

```sql
WITH data AS (
    SELECT *
    FROM employees
);
```

A CTE needs a statement that uses it.

Correct:

```sql
WITH data AS (
    SELECT *
    FROM employees
)
SELECT *
FROM data;
```

---

### Mistake 3 — Treating CTE as permanent table

Wrong assumption:

```text
CTE exists after the query
```

❌

Correct:

```text
CTE → one statement only
```

---

### Mistake 4 — Wrong `PARTITION BY`

Question:

> Find highest salary in each department.

Correct:

```sql
ROW_NUMBER() OVER (
    PARTITION BY department_id
    ORDER BY salary DESC
)
```

Question:

> Find highest salary in the company.

Correct:

```sql
ROW_NUMBER() OVER (
    ORDER BY salary DESC
)
```

---

### Mistake 5 — Using `ROW_NUMBER()` for distinct ranking

Question:

> Second-highest distinct salary

Use:

```sql
DENSE_RANK()
```

not:

```sql
ROW_NUMBER()
```

---

### Mistake 6 — Wrong recursive keyword

Wrong:

```sql
WITH numbers AS (...)
```

for a recursive CTE.

Correct:

```sql
WITH RECURSIVE numbers AS (...)
```

---

### Mistake 7 — No termination condition

Recursive CTE:

```sql
WITH RECURSIVE numbers AS (
    SELECT 1

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
```

The condition:

```sql
n < 10
```

is essential.

---

# 57. The Most Important CTE Patterns ⭐⭐⭐

You should memorize these **five templates**, not 50 individual queries.

## Pattern 1 — Basic CTE

```sql
WITH cte AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT ...
FROM cte;
```

---

## Pattern 2 — Multiple CTEs

```sql
WITH cte1 AS (
    SELECT ...
),
cte2 AS (
    SELECT ...
    FROM cte1
)
SELECT ...
FROM cte2;
```

---

## Pattern 3 — Ranking

```sql
WITH ranked AS (
    SELECT
        ...,
        ROW_NUMBER() OVER (
            PARTITION BY ...
            ORDER BY ... DESC
        ) AS rn
    FROM ...
)
SELECT *
FROM ranked
WHERE rn = ...;
```

---

## Pattern 4 — Aggregate → Rank

```sql
WITH averages AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
ranked AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            ORDER BY avg_salary DESC
        ) AS rnk
    FROM averages
)
SELECT *
FROM ranked
WHERE rnk = ...;
```

This solves:

* highest average
* second-highest average
* third-highest average

etc.

---

## Pattern 5 — Recursive CTE

```sql
WITH RECURSIVE cte AS (

    -- Anchor
    SELECT ...

    UNION ALL

    -- Recursive
    SELECT ...
    FROM cte
    WHERE termination_condition
)
SELECT *
FROM cte;
```

---

# 58. One-Minute Revision Sheet 🚀

Before an interview, remember this:

```text
CTE
│
├── Common Table Expression
│
├── Syntax
│     WITH name AS (...)
│
├── Scope
│     One SQL statement
│
├── Multiple CTEs
│     WITH A AS (...),
│          B AS (...)
│
├── Window Functions
│     ROW_NUMBER()
│     RANK()
│     DENSE_RANK()
│
├── PARTITION BY
│     Each group gets separate ranking
│
├── Recursive CTE
│     WITH RECURSIVE
│
│     Anchor
│       ↓
│     UNION ALL
│       ↓
│     Recursive member
│       ↓
│     Termination
│
└── Performance
      CTE ≠ automatically faster
```

---