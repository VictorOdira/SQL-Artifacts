-- AGGREGATION FUCTIONS 
SELECT
    COUNT(*) AS "Total Employees",
    SUM(Salary) AS "Annual Salary",
    AVG(Salary) AS "Avg Salary",
    MAX(Salary) AS "Highest Salary",
    MIN(Salary) AS "Lowest Salary"
FROM Employees;


SELECT 
    Department,
    COUNT(*) AS "Total Employees",
    SUM(Salary) AS "Annual Salary",
    AVG(Salary) AS "Avg Salary",
    MAX(Salary) AS "Highest Salary",
    MIN(Salary) AS "Lowest Salary"
FROM Employees
GROUP By Department; 

SELECT 
    Department,
    COUNT(*) AS "Total Employees",
    FORMAT(SUM(Salary), 0) AS "Annual Salary",
    FORMAT(ROUND(AVG(Salary), 2),  0) AS "Avg Salary",
    FORMAT(MAX(Salary), 0) AS "Highest Salary",
    FORMAT(MIN(Salary), 0) AS "Lowest Salary"
FROM Employees
GROUP By Department; 
