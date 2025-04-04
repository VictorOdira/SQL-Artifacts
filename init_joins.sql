
-- SQL JOINS 

-- INNER JOIN 

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

--- LEFT JOIN (or LEFT OUTER JOIN)

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

-- RIGHT JOIN (or RIGHT OUTER JOIN)

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

--  FULL JOIN (or FULL OUTER JOIN)

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

-- JOINING MULTIPLE TABLES 

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


