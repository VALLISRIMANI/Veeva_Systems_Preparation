/*
===============================================================================
SQL QUESTION: TIME SPENT BREAKDOWN BY AGE GROUP
===============================================================================

Tables:

activities:
-----------
activity_id
user_id
activity_type
time_spent
activity_date


age_breakdown:
-------------
user_id
age_bucket


Question:
---------
Obtain the breakdown of time spent sending vs opening snaps as a percentage
of the total time spent on these activities, grouped by age group.

Round the percentages to 2 decimal places.


===============================================================================
SOLUTION 1: JOIN + CASE WHEN
===============================================================================
*/

SELECT
    ab.age_bucket,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.activity_type = 'send'
                THEN a.time_spent
                ELSE 0
            END
        ) / SUM(a.time_spent),
        2
    ) AS send_percentage,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.activity_type = 'open'
                THEN a.time_spent
                ELSE 0
            END
        ) / SUM(a.time_spent),
        2
    ) AS open_percentage

FROM activities a
JOIN age_breakdown ab
    ON a.user_id = ab.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY ab.age_bucket
ORDER BY ab.age_bucket;


/*
===============================================================================
SOLUTION 2: Using IF() — MySQL
===============================================================================
*/

SELECT
    ab.age_bucket,
    ROUND(
        100.0 * SUM(
            IF(a.activity_type = 'send', a.time_spent, 0)
        ) / SUM(a.time_spent),
        2
    ) AS send_percentage,

    ROUND(
        100.0 * SUM(
            IF(a.activity_type = 'open', a.time_spent, 0)
        ) / SUM(a.time_spent),
        2
    ) AS open_percentage

FROM activities a
JOIN age_breakdown ab
    ON a.user_id = ab.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY ab.age_bucket
ORDER BY ab.age_bucket;