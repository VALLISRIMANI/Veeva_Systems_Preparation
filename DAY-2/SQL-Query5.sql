/*
===============================================================================
SQL QUESTION: MEASUREMENTS
===============================================================================

Consider the following Measurements table:

measurement_id     INT
measurement_value  DOUBLE
measurement_time   DATE


I. Find the sum of measurement values for odd-numbered and even-numbered measurements.

II. Find the sum of measurement values date-wise.
*/

/*
===============================================================================
I. SUM OF ODD AND EVEN NUMBERED MEASUREMENTS
===============================================================================
*/

-- SOLUTION 1: CASE WHEN

SELECT
    SUM(CASE
            WHEN MOD(measurement_id, 2) = 1
            THEN measurement_value
            ELSE 0
        END) AS odd_sum,

    SUM(CASE
            WHEN MOD(measurement_id, 2) = 0
            THEN measurement_value
            ELSE 0
        END) AS even_sum
FROM Measurements;


-- SOLUTION 2: IF() — MySQL

SELECT
    SUM(IF(MOD(measurement_id, 2) = 1, measurement_value, 0)) AS odd_sum,
    SUM(IF(MOD(measurement_id, 2) = 0, measurement_value, 0)) AS even_sum
FROM Measurements;


-- SOLUTION 3: GROUP BY CASE

SELECT
    CASE
        WHEN MOD(measurement_id, 2) = 1 THEN 'Odd'
        ELSE 'Even'
    END AS measurement_type,
    SUM(measurement_value) AS total_value
FROM Measurements
GROUP BY
    CASE
        WHEN MOD(measurement_id, 2) = 1 THEN 'Odd'
        ELSE 'Even'
    END;


/*
===============================================================================
II. SUM OF MEASUREMENT VALUE DATE-WISE
===============================================================================
*/

-- SOLUTION 1: GROUP BY date

SELECT
    measurement_time,
    SUM(measurement_value) AS total_value
FROM Measurements
GROUP BY measurement_time
ORDER BY measurement_time;


-- SOLUTION 2: GROUP BY DATE()

SELECT
    DATE(measurement_time) AS measurement_date,
    SUM(measurement_value) AS total_value
FROM Measurements
GROUP BY DATE(measurement_time)
ORDER BY measurement_date;