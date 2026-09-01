/*
===============================================================================
SQL QUESTION: USERS WHO LOGGED IN 3 CONSECUTIVE DAYS
===============================================================================

Table: login_details:

login_id
user_name
login_date

Question:
---------
Find users who logged in for 3 consecutive days.


===============================================================================
SOLUTION 1: LAG()
===============================================================================
*/

SELECT DISTINCT user_name
FROM (
    SELECT
        user_name,
        login_date,
        LAG(login_date, 1) OVER (
            PARTITION BY user_name
            ORDER BY login_date
        ) AS previous_date,
        LAG(login_date, 2) OVER (
            PARTITION BY user_name
            ORDER BY login_date
        ) AS previous_previous_date
    FROM login_details
) AS LoginHistory
WHERE DATEDIFF(login_date, previous_date) = 1
  AND DATEDIFF(previous_date, previous_previous_date) = 1;


/*
===============================================================================
SOLUTION 2: SELF JOIN
===============================================================================
*/

SELECT DISTINCT l1.user_name
FROM login_details l1
JOIN login_details l2
    ON l1.user_name = l2.user_name
   AND DATEDIFF(l2.login_date, l1.login_date) = 1
JOIN login_details l3
    ON l1.user_name = l3.user_name
   AND DATEDIFF(l3.login_date, l2.login_date) = 1;