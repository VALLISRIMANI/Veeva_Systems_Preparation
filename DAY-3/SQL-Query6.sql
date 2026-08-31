/*
===============================================================================
SQL QUESTION: TEAMS POWER USERS
===============================================================================

Question:
---------
Identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022.

Display:

sender_id
message_count

Order the results in descending order based on message count.

Assumption:
-----------
No two users have sent the same number of messages in August 2022.


TABLE: messages
---------------

message_id   integer
sender_id    integer
receiver_id  integer
content      varchar
sent_date    datetime


===============================================================================
SOLUTION 1: WHERE + GROUP BY + ORDER BY + LIMIT
===============================================================================
*/

SELECT
    sender_id,
    COUNT(*) AS message_count
FROM messages
WHERE sent_date >= '2022-08-01'
  AND sent_date < '2022-09-01'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;


/*
===============================================================================
SOLUTION 2: DATE() FUNCTION
===============================================================================
*/

SELECT
    sender_id,
    COUNT(*) AS message_count
FROM messages
WHERE DATE(sent_date) BETWEEN '2022-08-01' AND '2022-08-31'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;


/*
===============================================================================
SOLUTION 3: YEAR() + MONTH()
===============================================================================
*/

SELECT
    sender_id,
    COUNT(*) AS message_count
FROM messages
WHERE YEAR(sent_date) = 2022
  AND MONTH(sent_date) = 8
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;