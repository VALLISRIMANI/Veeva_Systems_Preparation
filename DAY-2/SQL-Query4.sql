/*
===============================================================================
SQL QUESTION: MEDIAN FROM A FREQUENCY TABLE
===============================================================================

Given:

search_frequency

searches | num_users
---------|----------
1        | 2
2        | 2
3        | 3
4        | 1

Meaning:
---------
2 users made 1 search
2 users made 2 searches
3 users made 3 searches
1 user  made 4 searches

Total users = 2 + 2 + 3 + 1 = 8

Ordered searches:

1, 1, 2, 2, 3, 3, 3, 4

Since there are 8 users, median = average of 4th and 5th values:

Median = (2 + 3) / 2 = 2.5

Answer: 2.5
*/

/*
===============================================================================
SOLUTION 1: CUMULATIVE FREQUENCY + CASE
===============================================================================

For a frequency table, the important idea is cumulative users.

searches | num_users | cumulative_users
---------|-----------|-----------------
1        | 2         | 2
2        | 2         | 4
3        | 3         | 7
4        | 1         | 8

For 8 users:
    Middle positions = 4 and 5

Position 4 -> searches = 2
Position 5 -> searches = 3

Median = (2 + 3) / 2 = 2.5

*/


SELECT ROUND(AVG(searches), 1) AS median
FROM (
    SELECT searches
    FROM search_frequency
    WHERE (
        SELECT SUM(num_users)
        FROM search_frequency sf2
        WHERE sf2.searches <= search_frequency.searches
    ) >= (
        SELECT CEIL(SUM(num_users) / 2)
        FROM search_frequency
    )
    ORDER BY searches
    LIMIT 2
) AS MiddleValues;