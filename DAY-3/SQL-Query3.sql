/*
===============================================================================
SQL QUESTION: RUNNING AVERAGE OF PRODUCT REVIEWS
===============================================================================

Consider the following table:

Product_Reviews:

review_id
user_id
submit_date
product_id
stars

Question:
---------
Compute the running average of stars received by each product.

Example:

product_id | review_id | submit_date | stars
-----------|-----------|-------------|------
101        | 1         | 2023-01-01  | 5
101        | 2         | 2023-01-05  | 3
101        | 3         | 2023-01-10  | 4

Running average:

Review 1 -> 5
Review 2 -> (5 + 3) / 2 = 4
Review 3 -> (5 + 3 + 4) / 3 = 4


===============================================================================
SOLUTION 1: WINDOW FUNCTION
===============================================================================
*/

SELECT
    product_id,
    review_id,
    submit_date,
    stars,
    AVG(stars) OVER (
        PARTITION BY product_id
        ORDER BY submit_date, review_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_avg
FROM Product_Reviews
ORDER BY product_id, submit_date, review_id;


/*
===============================================================================
SOLUTION 2: CORRELATED SUBQUERY
===============================================================================
*/

SELECT
    pr1.product_id,
    pr1.review_id,
    pr1.submit_date,
    pr1.stars,
    (
        SELECT AVG(pr2.stars)
        FROM Product_Reviews pr2
        WHERE pr2.product_id = pr1.product_id
          AND (
                pr2.submit_date < pr1.submit_date
                OR (
                    pr2.submit_date = pr1.submit_date
                    AND pr2.review_id <= pr1.review_id
                )
              )
    ) AS running_avg
FROM Product_Reviews pr1
ORDER BY pr1.product_id, pr1.submit_date, pr1.review_id;


/*
===============================================================================
SOLUTION 3: SELF JOIN
===============================================================================
*/

SELECT
    pr1.product_id,
    pr1.review_id,
    pr1.submit_date,
    pr1.stars,
    AVG(pr2.stars) AS running_avg
FROM Product_Reviews pr1
JOIN Product_Reviews pr2
    ON pr1.product_id = pr2.product_id
   AND (
        pr2.submit_date < pr1.submit_date
        OR (
            pr2.submit_date = pr1.submit_date
            AND pr2.review_id <= pr1.review_id
       )
   )
GROUP BY
    pr1.product_id,
    pr1.review_id,
    pr1.submit_date,
    pr1.stars
ORDER BY
    pr1.product_id,
    pr1.submit_date,
    pr1.review_id;