Here’s a concise but complete reference for MySQL Date and Time Functions (MySQL 8.x), along with examples for each category.

1. Getting Current Date & Time



Function
Description
Example
Output (Example)




NOW()
Current date & time
SELECT NOW();
2026-08-22 14:35:10


CURDATE()
Current date only
SELECT CURDATE();
2026-08-22


CURTIME()
Current time only
SELECT CURTIME();
14:35:10


UTC_DATE()
Current UTC date
SELECT UTC_DATE();
2026-08-22


UTC_TIME()
Current UTC time
SELECT UTC_TIME();
09:05:10




2. Extracting Parts of a Date



Function
Description
Example
Output




YEAR(date)
Year
SELECT YEAR('2026-08-22');
2026


MONTH(date)
Month (1–12)
SELECT MONTH('2026-08-22');
8


DAY(date) / DAYOFMONTH(date)
Day of month
SELECT DAY('2026-08-22');
22


HOUR(time)
Hour
SELECT HOUR('14:35:10');
14


MINUTE(time)
Minute
SELECT MINUTE('14:35:10');
35


SECOND(time)
Second
SELECT SECOND('14:35:10');
10


DAYOFWEEK(date)
Day of week (1=Sunday)
SELECT DAYOFWEEK('2026-08-22');
7


DAYNAME(date)
Day name
SELECT DAYNAME('2026-08-22');
Saturday


MONTHNAME(date)
Month name
SELECT MONTHNAME('2026-08-22');
August


WEEK(date)
Week number
SELECT WEEK('2026-08-22');
34




3. Date Arithmetic



Function
Description
Example
Output




DATE_ADD(date, INTERVAL expr unit)
Add interval
SELECT DATE_ADD('2026-08-22', INTERVAL 10 DAY);
2026-09-01


DATE_SUB(date, INTERVAL expr unit)
Subtract interval
SELECT DATE_SUB('2026-08-22', INTERVAL 1 MONTH);
2026-07-22


ADDDATE()
Same as DATE_ADD
SELECT ADDDATE('2026-08-22', INTERVAL 5 DAY);
2026-08-27


SUBDATE()
Same as DATE_SUB
SELECT SUBDATE('2026-08-22', INTERVAL 5 DAY);
2026-08-17




4. Date Differences



Function
Description
Example
Output




DATEDIFF(date1, date2)
Days between
SELECT DATEDIFF('2026-08-22', '2026-08-01');
21


TIMESTAMPDIFF(unit, datetime1, datetime2)
Difference in given unit
SELECT TIMESTAMPDIFF(HOUR, '2026-08-22 10:00:00', '2026-08-22 14:00:00');
4




5. Formatting Dates



Function
Description
Example
Output




DATE_FORMAT(date, format)
Format date
SELECT DATE_FORMAT('2026-08-22', '%d-%m-%Y');
22-08-2026


TIME_FORMAT(time, format)
Format time
SELECT TIME_FORMAT('14:35:10', '%h:%i %p');
02:35 PM



Common Format Specifiers:

%Y = 4-digit year
%m = 2-digit month
%d = 2-digit day
%H = hour (00–23)
%h = hour (01–12)
%i = minutes
%s = seconds
%p = AM/PM


6. Creating & Converting Dates



Function
Description
Example
Output




STR_TO_DATE(str, format)
Parse string to date
SELECT STR_TO_DATE('22-08-2026', '%d-%m-%Y');
2026-08-22


CAST(expr AS DATE)
Convert to date
SELECT CAST('2026-08-22 14:35:10' AS DATE);
2026-08-22




✅ Tip: Always store dates in DATE, DATETIME, or TIMESTAMP formats for better indexing and performance.

If you want, I can prepare a MySQL cheat sheet PDF with all date/time functions + examples for quick reference.
Do you want me to create that?
