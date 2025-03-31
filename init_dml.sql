-- DATA MANIPULATION LANGUAGE (DML)

-- 1. Insert into the table a single row

INSERT INTO Employees 
	(EmployeeID, FirstName, LastName,   BirthDate,  HireDate,  MonthlySalary)
VALUES
	(105, 'Kennedy', 'Otieno', '1988-08-08', '2017-11-01', 3200.00);

-- 2. Insert into the table multiple rows

INSERT INTO Employees 
	(EmployeeID, FirstName, LastName,   BirthDate,  HireDate,  MonthlySalary)
VALUES
	(101, 'Odira', 'Odingo', '1988-10-02', '2016-01-10', 3200.00),
  (102, 'Bob', 'Kimani', '1986-04-18', '2011-02-10', 6000.00),
  (103, 'Charlie', 'Makokha', '1983-02-10', '2009-05-30', 5000.00),
   (104, 'Dorcas', 'Nyakundi', '1994-02-10', '2021-05-30', 1000.00);
    
-- 3. Update monthly salary for the Dorcas Nyakundi from USD 1000 to USD 2500

UPDATE Employees
	SET MonthlySalary = 2500
    WHERE EmployeeID = 104;
    
-- 4. Remove Charlie Makokha from the payroll since he has left the institution 

DELETE FROM Employees 
WHERE EmployeeID = 103;

-- 5. Rename the table from "Employees" to "HR"

RENAME TABLE Employees TO HR;

-- 6. Remove all the data from the table named "HR"

TRUNCATE TABLE HR;

-- 7. Renaming a column. 

ALTER TABLE HR 
CHANGE COLUMN LastName GivenName VARCHAR(255) NOT NULL;

ALTER TABLE HR
RENAME COLUMN GivenName TO LastName;
