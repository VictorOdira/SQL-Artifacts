-- SQL FUNCTIONS 

-- The SQL Functions are used to Clean, Transform, Analyse and Manipulate data in a table. Note that a function is a built-in SQL code which:
-- accepts an input value;
-- processess it; and 
-- returns an output value. 

-- (a). CONCAT combines multiple strings into one. 

SELECT 
	FirstName, 
	lastName,
	CONCAT(firstName, ' ', lastName) AS 'Full Name'
FROM Employees;


UPDATE Employees
SET fullName = CONCAT(firstName, ' ' , lastName);
```
-- (b) UPPER converts all characters into uppercase. 

 SELECT 
	UPPER(FirstName) AS UpperName 
FROM Employees;

	
-- (c) LOWER converts all characters into lowercase. 

SELECT 
	LOWER(FirstName) AS LowerName 
FROM Employees;

-- (d) TRIM removes leading and trailing spaces (white spaces) from a string value.  

SELECT 
	TRIM(Position) 
FROM Employees;

-- How to know a column has records (Column Name - Position) with leading or trailing spaces

SELECT 
	Position 
FROM Employees
WHERE Position != TRIM(Position);

-- How to use both UPDATE and TRIM in order to update records in a table

UPDATE Employees
SET Position = TRIM(Position);

-- How to use both UPDATE and TRIM in order to update records in a table with a WHERE Clause
 
UPDATE Employees
SET Position = TRIM(Position)
WHERE Position != TRIM(Position);

-- (e) REPLACE:** replaces a specific character with a new charater or removes a character.  Both the *Old Value* and *New Value* must be specified. 

-- For instance replacing '-' with a '/' from this record '30-02-2024' 

REPLACE('30-02-2024', '-', '/');

-- In order to remove a charater from a record, an empty string is used as per the example below. 

REPLACE('30-02-2024', '-', '');

-- How to use both UPDATE and REPLACE in order to update records of a column*

UPDATE Employees
SET Position = REPLACE(Position, ',', ''); 

-- (f) LEN in other familiies of SQL and LENGTH for MySQL:** LEN or LENGTH counts the number of characters in a string.

SELECT 
	LEN(FirstName) AS character_count
FROM Employees;

-- or 


SELECT 
	LENGTH(FirstName) AS character_count
FROM Employees;

-- (g) LEFT extracts specific characters from the Start.

SELECT 
	LEFT(Department, 3) AS DepartmentID
FROM Employees; 


-- (h) RIGHT extracts specific characters from the End.

SELECT 
	RIGHT(Department, 3) AS DepartmentID
FROM Employees; 
