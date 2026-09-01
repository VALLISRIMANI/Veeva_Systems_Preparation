/*
===============================================================================
SQL QUESTION: FIND MISSING NUMBER IN A SEQUENCE
===============================================================================

Table: num:

number

Question:
---------
Find the missing number in the sequence.

Example:

number
------
1
2
3
5
6

Missing number = 4


===============================================================================
SOLUTION 1: SELF JOIN
===============================================================================
*/

SELECT n1.number + 1 AS missing_number
FROM num n1
LEFT JOIN num n2
    ON n2.number = n1.number + 1
WHERE n2.number IS NULL
  AND n1.number < (
      SELECT MAX(number)
      FROM num
  );


/*
===============================================================================
SOLUTION 2: NOT EXISTS
===============================================================================
*/

SELECT n.number + 1 AS missing_number
FROM num n
WHERE n.number < (
    SELECT MAX(number)
    FROM num
)
AND NOT EXISTS (
    SELECT 1
    FROM num n2
    WHERE n2.number = n.number + 1
);