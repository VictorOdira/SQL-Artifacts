SELECT 
    Department,
    SUM(Salary) AS totalSalary
FROM Employees 
GROUP BY Department;

SELECT 
    Department,
    Position, 
    SUM(Salary) OVER(PARTITION BY Department) AS totalSalary,
    SUM(Salary) OVER(PARTITION BY Department, Position) AS totalSalaryByDepartmentandPosition
FROM Employees;

-- RANK() 
SELECT 
   Position, 
   FORMAT(Salary, 0) AS Salary,
    RANK ()  OVER(ORDER BY Salary DESC) AS positionRank
FROM Employees;

-- CURRENT ROW AND N FOLLOWING
SELECT 
  Position, 
  Salary,
    SUM(Salary)  OVER (
    PARTITION BY Position 
    ORDER BY Salary DESC 
    ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
  ) AS positionSalaryWindow
FROM Employees;

-- N PRECEDING AND  CURRENT ROW
SELECT 
  Position, 
  Salary,
    SUM(Salary)  OVER (
    PARTITION BY Position 
    ORDER BY Salary DESC 
    ROWS BETWEEN  2 PRECEDING AND  CURRENT ROW
  ) AS positionSalaryWindow
FROM Employees;

-- UNBOUNDED PRECEDING AND  CURRENT ROW
SELECT 
  Position, 
  Salary,
    SUM(Salary)  OVER (
    PARTITION BY Position 
    ORDER BY Salary DESC 
    ROWS BETWEEN  UNBOUNDED PRECEDING AND  CURRENT ROW
  ) AS positionSalaryWindow
FROM Employees;

-- Rules 
-- Use Window Functions only:
-- 1. in SELECT and ORDER BY Clauses 
SELECT 
    Department,
    Position, 
    SUM(Salary) OVER(PARTITION BY Department) AS totalSalary,
    SUM(Salary) OVER(PARTITION BY Department, Position) AS totalSalaryByDepartmentandPosition
FROM Employees
ORDER BY SUM(Salary) OVER(PARTITION BY Department, Position) DESC;

-- 2. SQL executes WINDOW Functions after WHERE Clause 
SELECT 
    Department,
    Position, 
    SUM(Salary) OVER(PARTITION BY Department) AS totalSalary,
    SUM(Salary) OVER(PARTITION BY Department, Position) AS totalSalaryByDepartmentandPosition
FROM Employees
WHERE Position IN ('Data Analyst', 'Accountant I')
ORDER BY SUM(Salary) OVER(PARTITION BY Department, Position) DESC;

-- 3. WINDOW Functions can only be used together with GROUP BY on when same columns are used  
SELECT 
    Position, 
    FORMAT(SUM(Salary),0) AS Salary,
    RANK ()  OVER(ORDER BY SUM(Salary) DESC) AS positionRank
FROM Employees
GROUP BY Position;

-- 4. Nesting WINDOW Functions is not allowed. 
