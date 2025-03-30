# SQL Artifacts
Collection of my SQL Files, Scripts and Database Management Items 

## Part 1: Unveiling Insights from Sales Data with SQL SELECT Queries

Welcome to my collection of SQL files, scripts, and database management resources! To kick things off, we willl dive into the heart of data retrieval: the **SELECT query**. In this section, I will be using a sales dataset to illustrate the power and versatility of SQL commands listed below.

Imagine you are a data analyst tasked with extracting meaningful insights from a bustling online store's transaction records. Our journey begins with the init_selectqueries file, a treasure trove of examples that demonstrate how to precisely pull information from sales database.

* **SELECT:** Specifies columns to retrieve (e.g., `SELECT column1, column2...` or `SELECT *` for all).
* **FROM:** Indicates the source table(s).
* **WHERE:** Filters rows based on conditions.
* **GROUP BY:** Groups rows with matching column values. It is often used with aggregate functions such as **SUM()**, **AVG()** among others.
* **HAVING:** Filters groups created by `GROUP BY`.
* **ORDER BY:** Sorts the result set either in **ASCENDING**  or **DESCENDING** order.
* **LIMIT:** Restricts the number of returned rows.
* **OFFSET:** Skips a specified number of rows.

Understanding these clauses allows for precise data retrieval and manipulation.

## Part 2: Data Definition Language (DDL)

Part 2 gives an overview of Data Definition Language (DDL) commands that include **CREATE**, **ALTER**, **DROP**, **TRUNCATE**, and **RENAME** for managing database tables.

**What is DDL?**

Data Definition Language (DDL) is a subset of SQL used to define and manage the structure of database objects. DDL deals with the schema and not the data. The common DDL commands for tables include:

 ### 1. CREATE TABLE 
* **Purpose:** -Used to create a new table in a databse. **CREATE** defines table name, columns, data type and constraints in the following order:

    ```sql
    CREATE TABLE tableName (
        col1 datatype constraints,
        col2 datatype constraints,
        col3 datatype constraints 
    );
    ```

* **Example:**

    ```sql
    CREATE TABLE** Employee (
        EmployeeID INT PRIMARY KEY NOT NULL,
        FirstName VARCHAR(50) NOT NULL,
        LastName VARCHAR(50) NOT NULL,
        BirthDate DATE,
        HireDate DATE NOT NULL,
        MonthlySalary DECIMAL(10, 2) NOT NULL   
    );
    ```
* For Create table command the following elements must be kept in mind:
    * **Column names** which identifies each column.
    * **Data types** that Specifies the type of data a column can hold e.g., `INT`, `VARCHAR`, `DATE`, `DECIMAL(x,y).
    * **Constraints** which enforces data integrity rules e.g., `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`.

### 2. ALTER TABLE

* **Purpose:** used to modify a structure of an existing table.
* **Operations include:**
    * *ADD COLUMN* which adds a new column to an existing table.
    * *MODIFY COLUMN* which changes a column's data type or constraints.
    * *DROP COLUMN* which removes a column.
    * *ADD CONSTRAINT* which adds a constraint.
    * *DROP CONSTRAINT* which removes a constraint.
    * *RENAME COLUMN* which renames a column.
      
* **Examples:**

    ```sql
    ALTER TABLE Employees ADD COLUMN Email VARCHAR(100) NOT NULL AFTER BirthDate;
    ALTER TABLE Employees ALTER COLUMN LastName VARCHAR(100);
    ALTER TABLE Employees DROP COLUMN BirthDate;
    ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (Email);
    ```

### 3. DROP TABLE

* **Purpose:** Deletes an entire table and its data.
* 
    ```sql
    DROP TABLE table_name;
    ```

* **Example:**

    ```sql
    DROP TABLE Employees;
    ```

* *Key to Note is that the operation is irreversible (without backups)*.

## Important Notes:

* **Data Integrity:-** DDL ensures data consistency through constraints.
* **Database Design:-** Proper DDL usage is crucial for effective database design.
* **DBMS Specifics:-** Syntax and options may vary across different database management systems (MySQL, PostgreSQL, SQL Server, etc.).
* **Backups:-** Always back up your database before executing destructive DDL commands like `DROP TABLE`.
```

### 4. TRUNCATE TABLE

* **Purpose:-** used to remove all rows from a table with the table structure remaining.

    ```sql
    TRUNCATE TABLE tableName;
    ```

* **Example:**

    ```sql
    TRUNCATE TABLE Employees;
    ```

* **Key Differences from `DELETE`:**
    * `TRUNCATE` resets auto-incrementing counters. `DELETE` does not.
    * `TRUNCATE` is generally faster.
    * `TRUNCATE` cannot be used with a `WHERE` clause. It deletes all rows.
    * `TRUNCATE` is a DDL command, while `DELETE` is a DML (Data Manipulation Language) command.
    * `TRUNCATE` generally cannot be rolled back.

### 5. RENAME TABLE

* **Purpose:-** Used to change the name of an existing table.

    * **MySQL:**

        ```sql
        RENAME TABLE oldTableNname TO newTableName;
        ```

    * **PostgreSQL:**

        ```sql
        ALTER TABLE oldTableName RENAME TO newTableName;
        ```

    * **SQL Server:**

        ```sql
        EXEC sp_rename 'oldTableNname', 'newTableName';
        ```

* **Example (MySQL):**

    ```sql
    RENAME TABLE OldEmployees TO NewEmployees;
    ```

* **Example (PostgreSQL):**

    ```sql
    ALTER TABLE OldEmployees RENAME TO NewEmployees;
    ```

* **Important Notes:**
    * Always check the specific syntax for your DBMS.
    * Renaming a table can affect other database objects (views, stored procedures, etc.) that depend on the table.
```


