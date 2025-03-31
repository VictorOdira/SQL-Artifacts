-- SQL WHERE CONDITIONS | AND, OR, NOT, BETWEEN, IN, NOT IN, and LIKE OPERATORS

1.LOGICAL OPERATORS
  
-- AND 

-- a. Retrieve all employees from Texas (TX) and have three or more special projects.

SELECT * 
FROM Employees 
WHERE State = 'TX' AND specialProjects >= 3;


-- OR

-- b. Retrieve all employees who are either from Texas (TX) or have salary greater than 5000.

SELECT *
FROM Employees 
WHERE State = 'TX' OR Salary > 50000;

-- NOT 

-- c. Find the number of employees with special projects not zero

SELECT 
 COUNT(employeeId)
FROM Employees
WHERE NOT specialProjects = 0;

-- 2. RANGE OPERATOR 

-- a. Retrieve all employees who salary range between 40000 and 500000

SELECT *
FROM Employees 
WHERE Salary BETWEEN 40000 AND 50000;


-- 3. MEMBERSHIP OPERATORS 

--IN

-- a. Find the number of employees who are coming from Texas (TX) or California (CA) using "IN" operator. 

SELECT 
	COUNT(employeeId)
FROM Employees
WHERE State IN ('TX', 'CA');

-- NOT IN

-- b. Find the number of employees who are not from Texas (TX) or California (CA) using "IN" operator. 
SELECT 
	COUNT(employeeId)
FROM Employees
WHERE State NOT IN ('TX', 'CA');

-- 4 SEARCH OPERATORS

-- LIKE : Use with 'a%' or '%a' or '%a%' or '_a%'

-- a. Find all employees with the first name starts with "A" 

SELECT *
FROM Employees 
WHERE firstName LIKE 'A%';

-- b. Find all employees with the first name ends with "a" 

SELECT *
FROM Employees 
WHERE firstName LIKE '%a';

-- c. Find all employees with a 'ri' in their first name ends

SELECT *
FROM Employees 
WHERE firstName LIKE '%ri%';

-- d. Find all employees with the second letteer of their first name have an 'r'

SELECT *
FROM Employees 
WHERE firstName LIKE '_r%';


