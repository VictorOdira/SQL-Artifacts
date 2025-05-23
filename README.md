# SQL Artifacts
Collection of my SQL Files, Scripts and Database Management Items 

## Part 1: Unveiling Insights from Sales Data with SQL SELECT Queries

Welcome to my collection of SQL files, scripts, and database management resources! To kick things off, we willl dive into the heart of data retrieval: the **SELECT query**. In this section, I will be using a sales dataset to illustrate the power and versatility of SQL commands listed below.

Imagine you are a data analyst tasked with extracting meaningful insights from a bustling online store's transaction records. Our journey begins with the init_selectqueries file, a treasure trove of examples that demonstrate how to precisely pull information from sales database.

* **SELECT:** Specifies columns to retrieve (e.g., *SELECT column1, column2... or SELECT * for all*).
* **FROM:** Indicates the source table(s).
* **WHERE:** Filters rows based on conditions.
* **GROUP BY:** Groups rows with matching column values. It is often used with aggregate functions such as *SUM()*, *AVG()* among others.
* **HAVING:** Filters groups created by *GROUP BY*.
* **ORDER BY:** Sorts the result set either in *ASCENDING*  or *DESCENDING* order.
* **LIMIT:** Restricts the number of returned rows.
* **OFFSET:** Skips a specified number of rows.

Understanding these clauses allows for precise data retrieval and manipulation.

## Part 2: Data Definition Language (DDL)

Part 2 gives an overview of Data Definition Language (DDL) commands that include *CREATE*, *ALTER*, and *DROP* for managing database tables.

**What is DDL?**

Data Definition Language (DDL) is a subset of SQL used to define and manage the structure of database objects. DDL deals with the schema and not the data. The common DDL commands for tables include:

 #### 1. CREATE TABLE 
The purpose of *CREATE* is to create a new table in a databse. *CREATE* defines table name, columns, data type and constraints in the following order:

```sql
CREATE TABLE tableName (
   col1 datatype constraints,
   col2 datatype constraints,
   col3 datatype constraints 
);
```
**Example:**

 ```sql
 CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    HireDate DATE NOT NULL,
    MonthlySalary DECIMAL(10, 2) NOT NULL   
 );
 ```
**Keep in Mind:**
  
* *Column names identify each column.*
* *Data types specify the type of data a column can hold e.g., `INT`, `VARCHAR`, `DATE`, `DECIMAL(x,y).*
* *Constraints enforce data integrity rules e.g., `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`.*

#### 2. ALTER TABLE
The purpose *ALTER* is modify a structure of an existing table.

* **Operations include:**
  
    * *ADD COLUMN* which adds a new column to an existing table.
    * *MODIFY COLUMN* which changes a column's data type or constraints.
    * *DROP COLUMN* which removes a column.
    * *ADD CONSTRAINT* which adds a constraint.
    * *DROP CONSTRAINT* which removes a constraint.
    * *RENAME COLUMN* which renames a column.
      
**Examples:**

  ```sql
  ALTER TABLE Employees
  ADD COLUMN Email VARCHAR(100) NOT NULL AFTER BirthDate;
    
  ALTER TABLE Employees
  MODIFY COLUMN LastName VARCHAR(100);
    
  ALTER TABLE Employees
  DROP COLUMN BirthDate;
    
  ALTER TABLE Employees
  ADD CONSTRAINT unique_email UNIQUE (Email);
  ```

*ALTER TABLE* can also be used to rename a table column. These can be applied in two ways. These are:

```sql
ALTER TABLE Employees 
CHANGE COLUMN LastName GivenName VARCHAR(255) NOT NULL;

ALTER TABLE Employees
RENAME COLUMN GivenName TO LastName;
```

#### 3. DROP TABLE

The purpose of *DROP* is to delete an entire table and its data.

 ```sql
 DROP TABLE tableName;
 ```

**Example:**

  ```sql
  DROP TABLE Employees;
  ```
**Keep in Mind:**

  * *Operation is irreversible (without backups) hence verification must be undertaken prior to execution*.
  * *Data integrity ensures data consistency through constraints.*
  * *DBMS Specifics syntax and options may vary across different database management systems (MySQL, PostgreSQL, SQL Server, etc.)*.
  * *Backups will always back up your database before executing destructive DDL commands like `DROP TABLE`*.

## Part 3: Data Manipulation Language (DML)

Data Manipulation Language (DML) is a subset of SQL used to manipulate data within database tables. Idealy, DML revolves around inserting, updating, deleting, and managing existing data and involves SQL commands such as *INSERT*, *UPDATE*, *DELETE*, *TRUNCATE*, and *RENAME*. 

#### 1. INSERT INTO

*INSERT* Statement is used to add new rows of data into a database table. It provides an opportunity to add a single row or multiple rows of data into a table at once. 

**Insert a Single Row:**

 ```sql
INSERT INTO Employees 
   (EmployeeID, FirstName, LastName,   BirthDate,  HireDate,  MonthlySalary)
VALUES 
   (101, 'Odira', 'Odingo', "1988-10-02", "2016-01-10", 3200);
 ```

**Insert Multiple Rows:**

 ```sql
INSERT INTO Employees 
    (EmployeeID, FirstName, LastName,   BirthDate,  HireDate,  MonthlySalary)
 VALUES
    (101, 'Odira', 'Odingo', '1988-10-02', '2016-01-10', 3200.00),
    (102, 'Bob', 'Kimani', '1986-04-18', '2011-02-10', 6000.00),
    (103, 'Charlie', 'Makokha', '1983-02-10', '2009-05-30', 5000.00),
    (104, 'Dorcas', 'Nyakundi', '1994-02-10', '2021-05-30', 1000.00);
 ```  

**Keep in Mind**:

   * *It is optional to specfiy the column names given that SQL expects the values for all columns.*
   * *Number of columns, values and respective data types must be matched.*

#### 2. UPDATE TABLE
 
**UPDATE** modifies existing data in a table. It is important that just as **INSERT** one can update one or more rows based on specified conditions. In order to update a specific row,  the **WHERE** clause must be used to identify the row to affected.

**Update a Single Row:**

 ```sql
 UPDATE Employees
   SET MonthlySalary = 5000
   WHERE EmployeeID = 101;
 ```

**Update Multiple Rows:**
Multiple rows can be updated by omitting the *WHERE* clause or by using a condition that matches multiple rows.

```sql
UPDATE Employees
   SET MonthlySalary = MonthlySalary * 1.5,  BirthDate = 1986-12-11
   WHERE EmployeeID = 103;
```

#### 3. DELETE 

**DELETE** is used while removing rows from a table. One can use *DELETE* to remove specific rows or all rows depending on the nature of condition provided. When one is targeting a specific row, he or she must use the *WHERE* clause. 

**Deleting a Single Row**:

 ```sql
DELETE FROM Employees
WHERE EmployeeID = 103;
```

**Deleting Multiple Rows**:

```sql
DELETE FROM Employees
WHERE Department = 'Sales';
```

### 4. TRUNCATE TABLE

The purpose of *TRUNCATE* is remove all rows from a table with the table structure remaining intact.

```sql
TRUNCATE TABLE tableName;
```

**Example:**

```sql
TRUNCATE TABLE Employees;
```

**Keep in Mind:**

* *TRUNCATE resets auto-incrementing counters. DELETE does not.*
* *TRUNCATE is generally faster than DELETE.*
* *TRUNCATE cannot be used with a *WHERE* clause. It deletes all rows.*
* *TRUNCATE generally cannot be rolled back in database systems.*

#### 5. RENAME TABLE

The purpose *RENAME* is change the name of an existing table.

**MySQL:**

```sql
RENAME TABLE oldTableNname TO newTableName;
```
**PostgreSQL:**

```sql
ALTER TABLE oldTableName RENAME TO newTableName;
```
**SQL Server:**

```sql
EXEC sp_rename 'oldTableNname', 'newTableName';
```
**Example:  MySQL**

```sql
RENAME TABLE OldEmployees TO NewEmployees;
```
**Example PostgreSQL:**

```sql
ALTER TABLE OldEmployees RENAME TO NewEmployees;
```

**Keep in Mind:**

 * *Always check the specific syntax for your DBMS.*
 * *Renaming a table can affect other database objects (views, stored procedures, etc.) that depend on the table.*

## Part 4: SQL WHERE Conditions | AND, OR, NOT, BETWEEN, IN, NOT IN, LIKE

Part 4 explains how to use *SQL WHERE Clause Operators,* including *AND, OR, NOT, BETWEEN, IN, NOT IN, LIKE*. SQL scripts can be found in file named **init_operators.sql**.

#### 1. AND Operator

*AND* operator is used to filter records based on multiple conditions. All specified conditions must be true for a record to be included in the result set.

**Example:** Retrieve all employees from Texas (TX) who have three or more special projects.

```sql
SELECT *
FROM Employees
WHERE State = 'TX' AND specialProjects >= 3;
```
#### 2. OR Operator

*OR* operator is used to filter records based on multiple conditions. At least one of the specified conditions must be true for a record to be included in the result set.

**Example**: Retrieve all employees who are either from Texas (TX) or have a salary greater than 50000.

```sql
SELECT *
FROM Employees
WHERE State = 'TX' OR Salary > 50000;
```
#### 3. NOT Operator

*NOT* operator is used to negate a condition. It selects records where the condition is false.

**Example**: Find the number of employees with special projects not equal to zero.

```sql
SELECT COUNT(employeeId)
FROM Employees
WHERE NOT specialProjects = 0;
```

#### 4. BETWEEN Operator

*BETWEEN* operator is used to select values within a given range. The values can be numbers, text, or dates.

**Example**: Retrieve all employees whose salary is between 40000 and 50000 *(inclusive)*.

```sql 
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 50000;
```

#### 5. IN Operator

*IN* operator allows you to specify multiple values in a WHERE clause.

**Example**: Find the number of employees who are from Texas (TX) or California (CA).

```sql
SELECT COUNT(employeeId)
FROM Employees
WHERE State IN ('TX', 'CA');
```

#### 6. NOT IN Operator

*NOT IN* operator is the negation of the *IN* operator. It selects records where a column's value is not in a specified list.

**Example**: Find the number of employees who are not from Texas (TX) or California (CA).

```sql
SELECT COUNT(employeeId)
FROM Employees
WHERE State NOT IN ('TX', 'CA');
```

#### 7. LIKE Operator

*LIKE* operator is used in a WHERE clause to search for a specified pattern in a column.

% (percent sign): Represents zero, one, or multiple characters.
_ (underscore): Represents a single character.   

**Examples**:

Find all employees whose first name starts with "a".

```sql
SELECT *
FROM Employees
WHERE firstName LIKE 'A%';
```

Find all employees whose first name ends with "a".

```sql
SELECT *
FROM Employees
WHERE firstName LIKE '%a';
```

Find all employees whose first name contains "ri".

```sql
SELECT *
FROM Employees
WHERE firstName LIKE '%ri%';
```

#### 8. LIKE Operator with Underscore

Find all employees whose second letter of their first name is "r".

```sql
SELECT *
FROM Employees
WHERE firstName LIKE '_r%';
```

## Part 4: SQL JOINS 

SQL joins are used to combine rows from two or more tables based on related columns. Part 4 discusses 4 basic types of SQL joins: *INNER JOIN*, *LEFT JOIN* , *RIGHT JOIN* , and *FULL JOIN*

#### 1. INNER JOIN 

*INNER JOIN* only returns matching values from the referred tables. *INNER JOIN* is used to retrieve a match from the referred tables.  

```sql
SELECT 
	B.EmployeeID,
	B.FirstName,
	B.LastName AS 'Surname',
	B.Gender,
	P.MidTermReviewStatus As 'Status',
	P.PerformanceRating AS Rating,
	P.ReviewComments AS 'Comments'
FROM BioData AS B
INNER JOIN PerformanceDetails AS P
	     ON P.EmployeeID = B.EmployeeID;
```
#### 2. LEFT JOIN (or LEFT OUTER JOIN)

*LEFT JOIN * returns all rows from the left table (BioData), and the matched rows from the right table (PerformanceDetails). If no match is found, NULL values are returned for columns from the right table. Usually, *LEFT JOIN* is used when one wants to include all records from the left table, even if there are no matches in the right table.

```sql
SELECT 
	B.EmployeeID,
	B.FirstName,
	B.LastName AS 'Surname',
	B.Gender,
	P.MidTermReviewStatus As 'Status',
	P.PerformanceRating AS Rating,
	P.ReviewComments AS 'Comments'
FROM BioData AS B
LEFT JOIN PerformanceDetails AS P
	     ON P.EmployeeID = B.EmployeeID;
```
#### 3. RIGHT JOIN (or RIGHT OUTER JOIN)

*RIGHT JOIN* returns all rows from the right table (PerformanceDetails), and the matched rows from the left table (BioData). If no match is found, NULL values are returned for columns from the left table. In terms of use case when one wants to include all records from the right table, even if there are no matches in the left table, *RIGHT JOIN* is the best.

```sql
SELECT 
	B.EmployeeID,
	B.FirstName,
	B.LastName AS 'Surname',
	B.Gender,
	P.MidTermReviewStatus As 'Status',
	P.PerformanceRating AS Rating,
	P.ReviewComments AS 'Comments'
FROM BioData AS B
RIGHT JOIN PerformanceDetails AS P
	     ON P.EmployeeID = B.EmployeeID;
```
#### 4. FULL JOIN (or FULL OUTER JOIN)

*FULL JOIN* returns all rows when there is a match in either the left (BioData) or right (PerformanceDetails) table. Rows without a match in one of the tables will have NULL values for columns from that table. *FULL JOIN* is used when you want to include all records from both tables, regardless of whether there is a match.

```sql
SELECT 
	B.EmployeeID,
	B.FirstName,
	B.LastName AS 'Surname',
	B.Gender,
	P.MidTermReviewStatus As 'Status',
	P.PerformanceRating AS Rating,
	P.ReviewComments AS 'Comments'
FROM BioData AS B
FULL JOIN PerformanceDetails AS P
	     ON P.EmployeeID = B.EmployeeID;
```
#### 5. JOINING MULTIPLE TABLES 

Joining multiple tables assist in retrieving data from multiple related tables (BioData, PerformanceDetails, and RenumerationAndAllowance ) and combines them into a single result set. Joining multiple tables allows one to get a comprehensive view of the information.

```sql
SELECT
	B.EmployeeID,
	B.FirstName,
	B.LastName AS 'Surname',
	B.Gender,
	P.MidTermReviewStatus As 'Status',
	P.PerformanceRating AS Rating,
	P.ReviewComments AS 'Comments',
	R.MonthlySalary AS Salary
FROM BioData AS B
LEFT JOIN PerformanceDetails AS P 
	ON B.EmployeeID = P.EmployeeID
LEFT JOIN RenumerationAndAllowance AS R
	ON P.RemunerationID = R.RemunerationID
```
## Part 5: SQL SET OPERATORS: *UNION*, *UNION ALL*, *INTERSECT*, *AND EXCEPT*

Set operators in SQL are techniques for combining or comparing the results of two or more SELECT statements. Set operators act like mathematical set operations for finding the union, intersection, or difference between the rows returned by our queries. 
It is important to note that *SET OPERATORS* can be used together with almost all the clauses *WHERE*, *GROUP BY*, *JOIN*, *HAVING*. Note that *ORDER BY* is allowed only once at the end of a query.

#### Rules of SET Operators

* ORDER BY can only be used once; 
* Tables to be combined must have the same number of columns;
* Columns must have matching data types; 
* Columns must be in the same order; and
* One should map the same columns in order to obtain an accurate result. 

#### 1. UNION 

*UNION* operator merges the results of two or more SELECT queries (statements) into a single result set. It removes duplicate rows by default. This means that it only retrieves distinct rows. 

```sql
SELECT
	Archive_Date AS "Admission Date",
    Speciality,
    Adult_Child AS Category,
    Age_Profile AS "Age Profile",
    Time_Bands AS Period,
    Total 
FROM Hospital2018 
UNION 
SELECT
	Archive_Date, 
	Speciality,
	Adult_Child,
	Age_Profile, 
	Time_Bands, 
	Total 
FROM Hospital2019;
```
**Combining tables using *UNION* and obtaining *COUNT* of rows**

SELECT 
	COUNT(*)
FROM (
		SELECT *
		FROM Hospital2018

		UNION

		SELECT *
		FROM Hospital2019
        ) AS Combined_Data;


#### 2. UNION ALL

*UNION ALL* operator merges the results of two or more SELECT queries (statements) into a single result set. It includes duplicates as well.

```sql
SELECT
	Archive_Date AS "Admission Date",
	Speciality,
	Adult_Child AS Category,
	Age_Profile AS "Age Profile",
	Time_Bands AS Period,
	Total 
FROM Hospital2018 

UNION ALL
    
SELECT
	Archive_Date, 
	Speciality,
	Adult_Child,
	Age_Profile, 
	Time_Bands, 
	Total 
FROM Hospital2019;
```
#### 3. EXCEPT / MINUS 

*EXCEPT / MINUS* (depending on the SQL) returns all distinct rows from the first query that are not found in the second query. *EXCEPT / MINUS* is not dirrectly supported in MySQL, therefore *LEFT JOIN* with a WHERE ... IS NULL clause is utilised to achieve the same result.

```sql
SELECT
	Archive_Date AS "Admission Date",
	Speciality,
	Adult_Child AS Category,
	Age_Profile AS "Age Profile",
	Time_Bands AS Period,
	Total 
FROM Hospital2018 

EXCEPT
    
SELECT
	Archive_Date, 
	Speciality,
	Adult_Child,
	Age_Profile, 
	Time_Bands, 
	Total 
FROM Hospital2019;
```

**LEFT JOIN with WHERE Clause for EXCEPT in MySQL**

SELECT
    h18.Archive_Date AS "Admission Date",
    h18.Speciality,
    h18.Adult_Child AS Category,
    h18.Age_Profile AS "Age Profile",
    h18.Time_Bands AS Period,
    h18.Total
FROM Hospital2018 h18
LEFT JOIN Hospital2019 h19 ON
    h18.Archive_Date = h19.Archive_Date AND
    h18.Speciality = h19.Speciality AND
    h18.Adult_Child = h19.Adult_Child AND
    h18.Age_Profile = h19.Age_Profile AND
    h18.Time_Bands = h19.Time_Bands AND
    h18.Total = h19.Total
WHERE h19.Archive_Date IS NULL;

#### 4. INTERSECT 

*INTERSECT* will only return common rows in both queries. 


```sql
SELECT
	Archive_Date AS "Admission Date",
	Speciality,
	Adult_Child AS Category,
	Age_Profile AS "Age Profile",
	Time_Bands AS Period,
	Total 
FROM Hospital2018 

INTERSECT
    
SELECT
	Archive_Date, 
	Speciality,
	Adult_Child,
	Age_Profile, 
	Time_Bands, 
	Total 
FROM Hospital2019;
```
**Note:** Some versions of MySQl does not support *INTERSECT* hence it can be emulated by the following:

```sql
SELECT
    h18.Archive_Date AS "Admission Date",
    h18.Speciality,
    h18.Adult_Child AS Category,
    h18.Age_Profile AS "Age Profile",
    h18.Time_Bands AS Period,
    h18.Total
FROM Hospital2018 h18
INNER JOIN Hospital2019 h19 ON
    h18.Archive_Date = h19.Archive_Date AND
    h18.Speciality = h19.Speciality AND
    h18.Adult_Child = h19.Adult_Child AND
    h18.Age_Profile = h19.Age_Profile AND
    h18.Time_Bands = h19.Time_Bands AND
    h18.Total = h19.Total;
```

## Part 6: SQL FUNCTIONS 

The SQL Functions are used to *Clean*, *Transform*, *Analyse* and *Manipulate* data in a table. Note that a function is a built-in SQL code which:
* accepts an input value;
* processess it; and 
* returns an output value. 

**Types of Functions:**

* *Single_Row Functions:* String, Date and Time, Numeric and NUll fuctions. 
* *Multiple_Row Functions:* Aggregations (Basic) and Windows (Advanced) 

#### 1. String Functions 

They include functions for *Manipulation*, *Calculation*, and *Extraction*.  

**Manipulation** functions include: 

**(a). CONCAT:** combines multiple strings into one. 

```sql 
SELECT 
	FirstName, 
	lastName,
	CONCAT(firstName, ' ', lastName) AS 'Full Name'
FROM Employees;
```
**Use UPDATE and CONCAT**

```sql
UPDATE Employees
SET fullName = CONCAT(firstName, ' ' , lastName);
```
**(b) UPPER:** converts all characters into uppercase. 

```sql 
SELECT 
	UPPER(FirstName) AS UpperName 
FROM Employees;
```
	
**(c) LOWER:** converts all characters into lowercase. 

```sql 
SELECT 
	LOWER(FirstName) AS LowerName 
FROM Employees;
```

**(d) TRIM:** removes leading and trailing spaces (white spaces) from a string value.  

```sql 
SELECT 
	TRIM(Position) 
FROM Employees;
```
*How to know a column has records (Column Name - Position) with leading or trailing spaces*

```sql 
SELECT 
	Position 
FROM Employees
WHERE Position != TRIM(Position);
```
*How to use both UPDATE and TRIM in order to update records in a table*

```sql 
UPDATE Employees
SET Position = TRIM(Position);
```
*How to use both UPDATE and TRIM in order to update records in a table with a WHERE Clause*

```sql 
UPDATE Employees
SET Position = TRIM(Position)
WHERE Position != TRIM(Position);
```

**(e) REPLACE:** replaces a specific character with a new charater or removes a character.  Both the *Old Value* and *New Value* must be specified. 

For instance replacing '-' with a '/' from this record '30-02-2024' 

```sql
REPLACE('30-02-2024', '-', '/')
```
In order to remove a charater from a record, an empty string is used as per the example below. 

```sql
REPLACE('30-02-2024', '-', '')
```

*How to use both UPDATE and REPLACE in order to update records of a column*

```sql 
UPDATE Employees
SET Position = REPLACE(Position, ',', '')
```
**Calculation** functions include: 

**(f) LEN in other familiies of SQL and LENGTH for MySQL:** LEN or LENGTH counts the number of characters in a string.


```sql 
SELECT 
	LEN(FirstName) AS character_count
FROM Employees;
```
or 

```sql 
SELECT 
	LENGTH(FirstName) AS character_count
FROM Employees;
```
**String Extraction** functions include: 

 For string extraction either *LEFT* or *RIGHT* maybe used depending on the position of the characters of interest. 

**(g) LEFT:** Extracts specific characters from the *Start*.

```sql
SELECT 
	LEFT(Department, 3) AS DepartmentID
FROM Employees; 
```


**(h) RIGHT:** Extracts specific characters from the *End*.

```sql
SELECT 
	RIGHT(Department, 3) AS DepartmentID
FROM Employees; 
```

## Part 7: SQL DATE & TIME FUNCTIONS 

SQL provides a robust set of functions for handling date and time data, which are essential for performing various operations in data analysis, reporting, and application development. The functions allow for extraction of specific parts of a date or time, format dates for readability, perform calculations such as adding or subtracting intervals, validate date values, and cast between different data types. 

#### 1. Part Extraction 

Extracting specific components (e.g., year, month, day, hour, minute, second) from a date or timestamp is a common requirement in day-to-day operations and development. Idealyy, they are used to extract the year and month from a transaction date to analyze monthly or yearly sales trends and for seasonal analysis where one can identify patterns by extracting quarters or weeks from a dataset.

They include *DAY*, *MONTH*, *YEAR*, *DATEPART*, *DATENAME*, *DATETRUNC*, and *EOMONTH*

**DAY, MONTH, and YEAR:** usaully used in MySQL. These can also be used in SQL Server. 

```sql
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM orders;
```
**DATEPART** has a syntax *DATEPART(part, date)* which specifies part of the date or time one wants to extract for use. 

```sql
SELECT 
	DATEPART(year, order_date) AS order_year,
	DATEPART(month, order_date) AS order_month,
	DATEPART(day, order_date) AS order_day,
	DATEPART(hour, order_date) AS order_hour,
	DATEPART(weekday, order_date) AS weekday_number,
	DATEPART(millisecond, order_date) AS milliseconds
FROM orders;
```
*Use Cases for DATEPART()*
DATEPART() can be used to group data by specific time intervals, such as months or quarters, for reporting purposes.

```sql
SELECT 
    DATEPART(year, order_date) AS order_year,
    DATEPART(month, order_date) AS order_month,
    SUM(order_amount) AS total_sales
FROM orders
GROUP BY DATEPART(year, order_date), DATEPART(month, order_date);
```

*Note:*
* *DATEPART()* is used in SQL Server
* *EXTRACT ()* is used in both PostgreSQL and Oracle 
