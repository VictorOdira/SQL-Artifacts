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

4. BETWEEN Operator
The BETWEEN operator is used to select values within a given range. The values can be numbers, text, or dates.

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
