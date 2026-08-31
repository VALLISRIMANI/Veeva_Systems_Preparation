/*
===============================================================================
SQL QUESTION: CLINICAL TRIALS, DRUGS AND PHASES
===============================================================================

Consider the following 3 tables representing a health-specific database:

Trails:
-------
trail_id
trail_name
start_date
end_date
drug_id

Drugs:
------
drug_id
drug_name
description

Phases:
-------
trail_id
phase
start_date
end_date


Question:
---------
Return all clinical trials, their associated drug, the phases those trials have gone through, and the start and end dates of those phases.

Expected columns:

trail_id
trail_name
drug_name
phase
phase_start_date
phase_end_date


===============================================================================
SOLUTION 1: INNER JOIN
===============================================================================
*/

SELECT
    t.trail_id,
    t.trail_name,
    d.drug_name,
    p.phase,
    p.start_date AS phase_start_date,
    p.end_date AS phase_end_date
FROM Trails t
JOIN Drugs d
    ON t.drug_id = d.drug_id
JOIN Phases p
    ON t.trail_id = p.trail_id
ORDER BY
    t.trail_id,
    p.phase;


/*
===============================================================================
SOLUTION 2: LEFT JOIN
===============================================================================
*/

SELECT
    t.trail_id,
    t.trail_name,
    d.drug_name,
    p.phase,
    p.start_date AS phase_start_date,
    p.end_date AS phase_end_date
FROM Trails t
LEFT JOIN Drugs d
    ON t.drug_id = d.drug_id
LEFT JOIN Phases p
    ON t.trail_id = p.trail_id
ORDER BY
    t.trail_id,
    p.phase;
