/*
===============================================================================
SQL QUESTION: REPEATED PAYMENTS WITHIN 10 MINUTES
===============================================================================

Consider the following Transactions table:

Transactions:
-------------
trans_id
merchant_id
creditcard_id
amount
transaction_timestamp

Question:
---------
Identify any payments made:

    1. At the SAME merchant
    2. Using the SAME credit card
    3. With the SAME amount
    4. Within 10 minutes of each other

Also count the number of such repeated payments.

Example:

trans_id | merchant_id | creditcard_id | amount | transaction_timestamp
---------|-------------|---------------|--------|----------------------
1        | M1          | C1            | 500    | 10:00
2        | M1          | C1            | 500    | 10:05   <-- repeated
3        | M1          | C1            | 500    | 10:20
4        | M2          | C1            | 500    | 10:06

Transaction 1 and 2 are repeated because:
    Same merchant
    Same card
    Same amount
    Difference = 5 minutes
*/

/*
===============================================================================
SOLUTION 1: SELF JOIN
===============================================================================
*/

SELECT
    t1.trans_id AS transaction_1,
    t2.trans_id AS transaction_2,
    t1.merchant_id,
    t1.creditcard_id,
    t1.amount,
    t1.transaction_timestamp AS transaction_1_time,
    t2.transaction_timestamp AS transaction_2_time
FROM Transactions t1
JOIN Transactions t2
    ON t1.merchant_id = t2.merchant_id
    AND t1.creditcard_id = t2.creditcard_id
    AND t1.amount = t2.amount
    AND t1.trans_id < t2.trans_id
    AND t2.transaction_timestamp <=
        t1.transaction_timestamp + INTERVAL 10 MINUTE
    AND t2.transaction_timestamp >=
        t1.transaction_timestamp;


/*
===============================================================================
COUNT THE REPEATED PAYMENTS
===============================================================================
*/

Using the SELF JOIN approach, COUNT(*) gives the number of repeated
transaction PAIRS.

For example:

Transaction 1 -> Transaction 2
Transaction 2 -> Transaction 3

COUNT(*) = 2 repeated pairs.

/*
SOLUTION 1: COUNT REPEATED PAIRS
*/

SELECT COUNT(*) AS repeated_payment_pairs
FROM Transactions t1
JOIN Transactions t2
    ON t1.merchant_id = t2.merchant_id
    AND t1.creditcard_id = t2.creditcard_id
    AND t1.amount = t2.amount
    AND t1.trans_id < t2.trans_id
    AND t2.transaction_timestamp <=
        t1.transaction_timestamp + INTERVAL 10 MINUTE
    AND t2.transaction_timestamp >=
        t1.transaction_timestamp;


/*
===============================================================================
COUNT REPEATED PAYMENTS PER MERCHANT / CARD
===============================================================================
*/

SELECT
    t1.merchant_id,
    t1.creditcard_id,
    t1.amount,
    COUNT(*) AS repeated_payment_pairs
FROM Transactions t1
JOIN Transactions t2
    ON t1.merchant_id = t2.merchant_id
    AND t1.creditcard_id = t2.creditcard_id
    AND t1.amount = t2.amount
    AND t1.trans_id < t2.trans_id
    AND t2.transaction_timestamp <=
        t1.transaction_timestamp + INTERVAL 10 MINUTE
    AND t2.transaction_timestamp >=
        t1.transaction_timestamp
GROUP BY
    t1.merchant_id,
    t1.creditcard_id,
    t1.amount;