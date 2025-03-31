-- DATA DEFINITION LANGUAGE (DDL)

-- 1. Creating a table called BioData in the database using MySQL 
CREATE TABLE BioData (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Non Conforming')),
    Cellphone VARCHAR(20) UNIQUE,
    EmailAddress VARCHAR(100) UNIQUE,
    Residence VARCHAR(255)
);

-- 2. Creating a table called JobDetails in the database using MySQL

CREATE TABLE JobDetails (
    JobDetailID INT PRIMARY KEY,
    EmployeeID INT,
    HireDate DATE NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Department VARCHAR(100),
    SupervisorID INT,
    FOREIGN KEY (EmployeeID) REFERENCES BioData(EmployeeID),
    FOREIGN KEY (SupervisorID) REFERENCES BioData(EmployeeID) -- Supervisor is also an employee
);

-- 3. Creating a table called RenumerationAndAllowanceDetails in the database using MySQL
CREATE TABLE RenumerationAndAllowanceDetails (
    RenumerationAllowanceID INT PRIMARY KEY,
    EmployeeID INT,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    AllowanceType VARCHAR(50) CHECK (AllowanceType IN (
        'House Allowance', 'Commuter Allowance', 'LunchAllowance','Hardship Allowance', 'Leave Allowance')),
	  DeductionType VARCHAR(50) CHECK (DeductionType IN (
		'PAYE', 'SHIF', 'NSSF', 'Housing Levy','Loan Repayment', 'Sacco Remittance')),
    TotalAllowance DECIMAL(10, 2) CHECK (TotalAllowance >= 0),
    TotalDeduction DECIMAL(10, 2) CHECK (TotalDeduction >= 0),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES BioData(EmployeeID)
);

-- 4. Creating a table called PerformanceDetails in the database using MySQL

CREATE TABLE PerformanceDetails (
    PerformanceID INT PRIMARY KEY,
    EmployeeID INT,
    PerformanceReviewDate DATE,
    PerformanceRating INT CHECK (PerformanceRating BETWEEN 0 AND 105), -- Assuming a 1-5 scale
    ReviewComments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES BioData(EmployeeID)
);

-- 5. Adding a new column called  MidTermReviewStatus in the table - PerformanceDetails in the database using MySQL after  EmployeeID column

ALTER TABLE PerformanceDetails
ADD COLUMN MidTermReviewStatus VARCHAR(50) NOT NULL CHECK (MidTermReviewStatus IN ("Reviewed",  "Not Reviewed")) AFTER EmployeeID;

-- 6. Deleting a column called  MidTermReviewStatus from a table - PerformanceDetails in the database using MySQL.

ALTER TABLE PerformanceDetails
DROP COLUMN MidTermReviewStatus;

-- 7. Deleting an entire table called PerformanceDetails

DROP TABLE PerformanceDetails;
