# SQL Artifacts
Collection of my SQL Files, Scripts and Database Management Items 

**Part 1: Unveiling Insights from Sales Data with SQL SELECT Queries**

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

**Part 2: Data Definition Language (DDL)**

Part 2 gives an overview of Data Definition Language (DDL) commands that include **CREATE**, **ALTER**, and **DROP** for managing database tables.

## What is DDL?

Data Definition Language (DDL) is a subset of SQL used to define and manage the structure of database objects. It deals with the schema, not the data itself.

## Key DDL Commands for Tables

### 1. `CREATE TABLE`

* **Purpose:** Creates a new table in the database.
* **Syntax:**

    ```sql
    CREATE TABLE table_name (
        column1 datatype constraints,
        column2 datatype constraints,
        ...
    );
    ```

* **Example:**

    ```sql
    CREATE TABLE Students (
        StudentID INT PRIMARY KEY,
        FirstName VARCHAR(50) NOT NULL,
        LastName VARCHAR(50),
        DateOfBirth DATE
    );
    ```

* **Key Elements:**
    * **Column Names:** Identifies each column.
    * **Data Types:** Specifies the type of data a column can hold (e.g., `INT`, `VARCHAR`, `DATE`, `DECIMAL`).
    * **Constraints:** Enforces data integrity rules (e.g., `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`).

### 2. `ALTER TABLE`

* **Purpose:** Modifies the structure of an existing table.
* **Common Operations:**
    * `ADD COLUMN`: Adds a new column.
    * `MODIFY COLUMN` (or `ALTER COLUMN`): Changes a column's data type or constraints.
    * `DROP COLUMN`: Removes a column.
    * `ADD CONSTRAINT`: Adds a constraint.
    * `DROP CONSTRAINT`: Removes a constraint.
    * `RENAME COLUMN`: renames a column.
* **Examples:**

    ```sql
    ALTER TABLE Students ADD COLUMN Email VARCHAR(100);
    ALTER TABLE Students ALTER COLUMN LastName VARCHAR(100);
    ALTER TABLE Students DROP COLUMN DateOfBirth;
    ALTER TABLE Students ADD CONSTRAINT unique_email UNIQUE (Email);
    ```

### 3. `DROP TABLE`

* **Purpose:** Deletes an entire table and its data.
* **Syntax:**

    ```sql
    DROP TABLE table_name;
    ```

* **Example:**

    ```sql
    DROP TABLE Students;
    ```

* **Important Note:** This operation is irreversible (without backups).

## Important Considerations

* **Data Integrity:** DDL ensures data consistency through constraints.
* **Database Design:** Proper DDL usage is crucial for effective database design.
* **DBMS Specifics:** Syntax and options may vary across different database management systems (MySQL, PostgreSQL, SQL Server, etc.).
* **Backups:** Always back up your database before executing destructive DDL commands like `DROP TABLE`.
```

