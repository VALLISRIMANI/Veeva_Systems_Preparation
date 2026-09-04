### Question 1

**Write a SQL query to retrieve the second highest salary in the Engineering department.**

**Requirements:**

* Return only the **salary**.
* If multiple employees have the **highest salary**, return the **next distinct highest salary**.
* Consider only employees who belong to the **Engineering** department.

**Tables:**

**employees**

| Column        | Type    |
| ------------- | ------- |
| id            | INTEGER |
| first_name    | VARCHAR |
| last_name     | VARCHAR |
| salary        | INTEGER |
| department_id | INTEGER |

**departments**

| Column | Type    |
| ------ | ------- |
| id     | INTEGER |
| name   | VARCHAR |

**Expected Output:**

| Column | Type    |
| ------ | ------- |
| salary | INTEGER |

---

## Correct Solution (Using `DISTINCT`)

```sql
SELECT DISTINCT salary
FROM employees
WHERE department_id = (
    SELECT id
    FROM departments
    WHERE name = 'Engineering'
)
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
```

### Why this works

Suppose the Engineering salaries are:

| Salary |
| ------ |
| 9000   |
| 9000   |
| 8000   |
| 7000   |

* `DISTINCT` → `9000, 8000, 7000`
* `ORDER BY salary DESC` → `9000, 8000, 7000`
* `OFFSET 1` skips `9000`
* `LIMIT 1` returns `8000`

This satisfies the requirement of returning the **next distinct highest salary**.

---

## Alternative Solution (Interview-Friendly)

```sql
SELECT MAX(salary) AS salary
FROM employees
WHERE department_id = (
    SELECT id
    FROM departments
    WHERE name = 'Engineering'
)
AND salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = (
        SELECT id
        FROM departments
        WHERE name = 'Engineering'
    )
);
```

This approach is commonly asked in interviews because it doesn't rely on `LIMIT` or `OFFSET`.


## Question 2: Three-Day Rolling Average of Daily Deposits

### Problem

```text
Write a SQL query to calculate the three-day rolling average of total daily deposits.

Requirements:
- Consider only deposits (transaction_value > 0).
- First calculate the total deposits for each day.
- Then compute the rolling average over the current day and the previous two days.
- Format the date as '%Y-%m-%d'.

Table:
bank_transactions
---------------
user_id
created_at
transaction_value

Output:
dt
rolling_three_day
```

---

# Solution 1 (Window Function - Recommended)

```sql
WITH daily_deposits AS (
    SELECT
        DATE(created_at) AS dt,
        SUM(transaction_value) AS daily_total
    FROM bank_transactions
    WHERE transaction_value > 0
    GROUP BY DATE(created_at)
)

SELECT
    DATE_FORMAT(dt, '%Y-%m-%d') AS dt,
    AVG(daily_total) OVER (
        ORDER BY dt
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_three_day
FROM daily_deposits;
```

---

## Explanation

### Step 1

Filter deposits only.

```sql
WHERE transaction_value > 0
```

Ignore withdrawals.

---

### Step 2

Calculate daily deposit total.

Example:

| Date | Deposit |
| ---- | ------- |
| Jan1 | 30      |
| Jan2 | 50      |
| Jan3 | 10      |
| Jan4 | 30      |

---

### Step 3

Use Window Function

```sql
AVG(daily_total)
OVER(
ORDER BY dt
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
)
```

For each row:

Jan1

Average

```
30
```

Jan2

Average

```
(30+50)/2 = 40
```

Jan3

Average

```
(30+50+10)/3 = 30
```

Jan4

Average

```
(50+10+30)/3 = 30
```

Exactly matches expected output.

---

# Solution 2 (Without Window Functions)

```sql
WITH daily AS (
SELECT
DATE(created_at) dt,
SUM(transaction_value) total
FROM bank_transactions
WHERE transaction_value>0
GROUP BY DATE(created_at)
)

SELECT
d1.dt,
AVG(d2.total) rolling_three_day
FROM daily d1
JOIN daily d2
ON d2.dt BETWEEN DATE_SUB(d1.dt,INTERVAL 2 DAY)
AND d1.dt
GROUP BY d1.dt
ORDER BY d1.dt;
```

---

## Interview Notes

Common concepts tested:

* CTE
* Window Functions
* Aggregate Functions
* DATE()
* DATE_FORMAT()
* AVG()
* SUM()
* ROWS BETWEEN

---

## Complexity

Daily aggregation:

```
O(n)
```

Window function:

```
O(n)
```

Overall

```
O(n)
```

---

# Question 3: Customers with More Than Three Transactions in Both 2019 and 2020

### Problem

```text
Write a SQL query to identify customers who placed more than three transactions in both 2019 and 2020.

Tables:

transactions
------------
id
user_id
created_at
product_id
quantity

users
-----
id
name

Output:
customer_name
```

---

# Solution 1 (Conditional Aggregation - Recommended)

```sql
SELECT
    u.name AS customer_name
FROM users u
JOIN transactions t
    ON u.id = t.user_id
GROUP BY u.id, u.name
HAVING
    SUM(CASE WHEN YEAR(t.created_at) = 2019 THEN 1 ELSE 0 END) > 3
AND SUM(CASE WHEN YEAR(t.created_at) = 2020 THEN 1 ELSE 0 END) > 3;
```

---

## Explanation

For each customer:

Count transactions in 2019.

Count transactions in 2020.

Return customers whose count in both years exceeds 3.

---

# Solution 2

```sql
SELECT
u.name
FROM users u
JOIN
(
SELECT
user_id
FROM transactions
GROUP BY user_id
HAVING
COUNT(CASE WHEN YEAR(created_at)=2019 THEN 1 END)>3
AND
COUNT(CASE WHEN YEAR(created_at)=2020 THEN 1 END)>3
)x
ON u.id=x.user_id;
```

---

## Complexity

```
O(n)
```

---

# Question 4: Histogram of Comments Per User (January 2020)

### Problem

```text
Create a histogram showing how many users made 0, 1, 2, 3... comments during January 2020.

Users with no January comments should appear in the 0 bucket.

Output:
comment_count
frequency
```

---

# Solution (Recommended)

```sql
WITH user_comments AS (
    SELECT
        u.id,
        COUNT(c.user_id) AS comment_count
    FROM users u
    LEFT JOIN comments c
        ON u.id = c.user_id
       AND c.created_at >= '2020-01-01'
       AND c.created_at < '2020-02-01'
    GROUP BY u.id
)

SELECT
    comment_count,
    COUNT(*) AS frequency
FROM user_comments
GROUP BY comment_count
ORDER BY comment_count;
```

---

## Explanation

LEFT JOIN ensures users with no January comments remain.

First query counts comments per user.

Second query groups users by comment count.

Example

| User | Comments |
| ---- | -------- |
| A    | 0        |
| B    | 2        |
| C    | 2        |
| D    | 5        |

Histogram

| Count | Frequency |
| ----- | --------- |
| 0     | 1         |
| 2     | 2         |
| 5     | 1         |

---

## Complexity

```
O(n)
```

---

# Question 5: Top 3 Departments by Percentage of Employees Earning Over 100K

### Problem

```text
Find the top three departments that have at least ten employees.

Rank them by the percentage of employees earning more than 100000.

Return:

department_name

number_of_employees

percentage_over_100k
```

---

# Solution (Recommended)

```sql
SELECT
    d.name AS department_name,
    COUNT(*) AS number_of_employees,
    ROUND(
        SUM(CASE WHEN e.salary > 100000 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS percentage_over_100k
FROM employees e
JOIN departments d
    ON e.department_id = d.id
GROUP BY d.id, d.name
HAVING COUNT(*) >= 10
ORDER BY percentage_over_100k DESC
LIMIT 3;
```

---

## Explanation

Join employees with departments.

Calculate:

* Total employees
* Employees earning >100K

Percentage:

```sql
SUM(CASE WHEN salary>100000 THEN 1 ELSE 0 END)
/ COUNT(*)
```

Filter departments having at least 10 employees.

Sort by percentage.

Take top three.

---

## Complexity

```
O(n)
```

---

