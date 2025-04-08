USE hr;

SELECT *
FROM Employees;
-- WHERE terminationReason = 'Return to school';

SET SQL_SAFE_UPDATES = 0;

-- Run your capitalization UPDATE
UPDATE Employees
SET terminationReason = CONCAT(UPPER(SUBSTR(terminationReason, 1, 1)),  SUBSTR(terminationReason, 2));

UPDATE Employees
SET terminationReason = REPLACE(terminationReason, 'Not Applicable', 'Not applicable')
WHERE employmentStatus = 'Active';

SELECT 
    terminationReason, 
    COUNT(*) AS Count
FROM Employees
WHERE employmentStatus != 'Active'
GROUP BY  terminationReason
ORDER BY COUNT(*) DESC;

ALTER TABLE Employees
ADD COLUMN fullDuration INT AFTER Period;

UPDATE Employees 
SET Age = TIMESTAMPDIFF(YEAR, STR_TO_DATE(DOB, '%d/%m/%Y'), CURDATE());

ALTER TABLE Employees
ADD COLUMN Period INT AFTER terminationDate;

UPDATE Employees 
SET Period = TIMESTAMPDIFF(
        YEAR, STR_TO_DATE(hireDate, '%d/%m/%Y'), 
        STR_TO_DATE(terminationDate, '%d/%m/%Y'))
WHERE hireDate != '' AND terminationDate != '';

SELECT *
FROM Employees
WHERE durationWorked IS NOT NULL;

SELECT
   TIMESTAMPDIFF(YEAR, STR_TO_DATE(hireDate, '%d/%m/%Y'), STR_TO_DATE(terminationDate, '%d/%m/%Y')) AS Years_worked
FROM Employees
WHERE hireDate != '' AND terminationDate != '' AND Period = 0;


UPDATE Employees
SET fullDuration = CONCAT(
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(hireDate, '%d/%m/%Y'), STR_TO_DATE(terminationDate, '%d/%m/%Y')), ' years, ',
    TIMESTAMPDIFF(MONTH, STR_TO_DATE(hireDate, '%d/%m/%Y'), STR_TO_DATE(terminationDate, '%d/%m/%Y')) 
      % 12, ' months, ',
    DATEDIFF(STR_TO_DATE(terminationDate, '%d/%m/%Y'), STR_TO_DATE(hireDate, '%d/%m/%Y')) 
      % 30, ' days'
  ) 
WHERE hireDate != '' AND terminationDate != '';

UPDATE  Employees 
SET fullDuration = CAST(fullDuration AS CHAR(255));

ALTER TABLE Employees
MODIFY COLUMN fullDuration VARCHAR(255);

ALTER TABLE Employees
RENAME COLUMN fullDuration TO durationWorked ;

ALTER TABLE Employees
RENAME COLUMN Period TO yearsWorked ;
