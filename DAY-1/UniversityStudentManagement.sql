/*
Implement the above university student management problem using DBMS and SQL queries.

Store the following details for every student:

Roll number | Name | Branch | Section | CGPA

Grade should be computed from CGPA.

Perform:

1. Display students branch-wise.
2. Display students branch-wise sorted in descending order of grade.
3. Display students branch-wise sorted in ascending order of marks/CGPA.
4. Given a branch, find the number of students in that branch and names of students having "S" grade.
5. Find branches having the highest number of "S" grades.
*/



-- Table creation
CREATE TABLE Students (RollNumber INT PRIMARY KEY, Name VARCHAR(100), Branch VARCHAR(50), Section VARCHAR(10), CGPA DECIMAL(3,2));


-- Sample data
INSERT INTO Students (RollNumber, Name, Branch, Section, CGPA) VALUES
(101, 'Rahul', 'CSE', 'A', 9.50),
(102, 'Priya', 'CSE', 'A', 8.70),
(103, 'Arjun', 'CSE', 'B', 9.20),
(104, 'Sneha', 'ECE', 'A', 9.80),
(105, 'Kiran', 'ECE', 'B', 7.90),
(106, 'Anjali', 'ECE', 'A', 9.10),
(107, 'Vijay', 'EEE', 'A', 8.50),
(108, 'Ravi', 'EEE', 'B', 9.30),
(109, 'Meena', 'EEE', 'A', 6.90);


-- Grade calculation based on CGPA
SELECT RollNumber, Name, Branch, Section, CGPA,
    CASE
        WHEN CGPA >= 9.0 THEN 'S'
        WHEN CGPA >= 8.0 THEN 'A'
        WHEN CGPA >= 7.0 THEN 'B'
        WHEN CGPA >= 6.0 THEN 'C'
        WHEN CGPA >= 5.0 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM Students;


-- 1. Display students branch-wise
SELECT RollNumber, Name, Branch, Section, CGPA,
    CASE
        WHEN CGPA >= 9.0 THEN 'S'
        WHEN CGPA >= 8.0 THEN 'A'
        WHEN CGPA >= 7.0 THEN 'B'
        WHEN CGPA >= 6.0 THEN 'C'
        WHEN CGPA >= 5.0 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM Students
ORDER BY Branch;


-- 2. Branch-wise, descending order of grade
SELECT RollNumber, Name, Branch, Section, CGPA,
    CASE
        WHEN CGPA >= 9.0 THEN 'S'
        WHEN CGPA >= 8.0 THEN 'A'
        WHEN CGPA >= 7.0 THEN 'B'
        WHEN CGPA >= 6.0 THEN 'C'
        WHEN CGPA >= 5.0 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM Students
ORDER BY
    Branch,
    CASE
        WHEN CGPA >= 9.0 THEN 1
        WHEN CGPA >= 8.0 THEN 2
        WHEN CGPA >= 7.0 THEN 3
        WHEN CGPA >= 6.0 THEN 4
        WHEN CGPA >= 5.0 THEN 5
        ELSE 6
    END;


-- 3. Branch-wise, ascending order of marks/CGPA
SELECT RollNumber, Name, Branch, Section, CGPA,
    CASE
        WHEN CGPA >= 9.0 THEN 'S'
        WHEN CGPA >= 8.0 THEN 'A'
        WHEN CGPA >= 7.0 THEN 'B'
        WHEN CGPA >= 6.0 THEN 'C'
        WHEN CGPA >= 5.0 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM Students
ORDER BY
    Branch,
    CGPA ASC;

-- 4. Given a branch, count students + names of S-grade students
SELECT 
    COUNT(*) AS TotalStudents,
    SUM(CASE WHEN CGPA >= 9.0 THEN 1 ELSE 0 END) AS SGradeStudents
FROM Students
WHERE Branch = 'CSE';

SELECT Name
FROM Students
WHERE Branch = 'CSE'
  AND CGPA >= 9.0;


-- 5. Find branches having the highest number of S grades
SELECT Branch, SGradeCount
FROM (
    SELECT
        Branch,
        COUNT(*) AS SGradeCount
    FROM Students
    WHERE CGPA >= 9.0
    GROUP BY Branch
) AS BranchCounts
WHERE SGradeCount = (
    SELECT MAX(SGradeCount)
    FROM (
        SELECT
            Branch,
            COUNT(*) AS SGradeCount
        FROM Students
        WHERE CGPA >= 9.0
        GROUP BY Branch
    ) AS Counts
);