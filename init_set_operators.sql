-- SET OPERATORS 

-- Rules of SET Operators 
-- ORDER BY can only be used once;
-- Tables to be combined must have the same number of columns;
-- Columns must have matching data types;
-- Columns must be in the same order; and
-- One should map the same columns in order to obtain an accurate result.

 -- UNION

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

SELECT
	Archive_Date, 
	Speciality,
	Adult_Child,
	Age_Profile, 
	Time_Bands, 
	Total 
FROM Hospital2019;

 -- UNION ALL
 
SELECT 
	COUNT(*)
FROM (
		SELECT *
		FROM Hospital2018

		UNION

		SELECT *
		FROM Hospital2019
        ) AS Combined_Data;

 -- UNION ALL
 
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

-- EXCEPT

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

-- LEFT JOIN with WHERE Clause for EXCEPT in MySQL
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


-- INTERSECT 

-- INTERSECT will only return common rows in both queries. 

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

-- Note: Some versions of MySQl does not support INTERSECT hence it can be emulated by the following:

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
