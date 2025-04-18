-- SQL SELECT QUERIES 

-- 1. Retrieve all columns and rows in the sales table
SELECT *
FROM salestbl;

-- 2. What is the number of orders based on the sales data

SELECT
	COUNT(Segment) AS order_counts
FROM salestbl; 

-- 3. Find the number of orders per segment

SELECT 
	Segment,
    FORMAT(COUNT(Segment),0) AS Count
FROM salestbl
GROUP BY Segment;

-- 4. Find the number of orders per region from the highest to the lowest. 

SELECT 
    Region,
    FORMAT(COUNT(Segment),0) AS Count
FROM salestbl
GROUP BY Region
ORDER BY COUNT(Segment) DESC;

-- 5. What are the five states with most orders? 
SELECT 
	State,
    FORMAT(COUNT(Segment),0) AS Count
FROM salestbl
GROUP BY State
ORDER BY COUNT(Segment) DESC
LIMIT 5;

-- 6. Arrange the product categories based on quantity ordered from the highest to the lowest.  

SELECT 
	Category,
    FORMAT(SUM(Quantity),0) AS "Quantity Ordered"
FROM salestbl
GROUP BY Category
ORDER BY SUM(Quantity) DESC;

-- 7. What is the contribution of each region in terms of revenue generation to the store? Arrange the regions based on total sales. 

SELECT
	Region,
    FORMAT(SUM(Sales),0) AS Revenue
FROM salestbl
GROUP BY Region
ORDER BY SUM(Sales) DESC;

-- 8. What is the total sales which was made during the period?

SELECT
	FORMAT(SUM(Sales),0) AS "Total Revenue"
FROM Salestbl;

-- 9. What were the 5 most ordered products and what was their respective total revenue and profit generated from their sales?

SELECT 
	SubCategory,
    FORMAT(COUNT(Segment),0) AS Count,
    FORMAT(ROUND(SUM(Sales),2),0) AS Revenue,
     FORMAT(ROUND(SUM(Profit),2),0) AS Profit
FROM Salestbl
GROUP BY SubCategory
ORDER BY COUNT(Segment) DESC
LIMIT 5;

-- 10. What was the total revenue and profit generated by the standard class ship mode?

SELECT 
	ShipMode AS "Ship Mode",
    FORMAT(ROUND(SUM(Sales),2),0) AS Revenue,
	FORMAT(ROUND(SUM(Profit),2),0) AS Profit
FROM Salestbl
WHERE ShipMode = "Standard Class";
    
-- 11. Find the states with an average profit of more than USD 600 in cases where discount was not given by the store. 

SELECT 
	State,
	ROUND(AVG(Profit),2) AS Profit
FROM Salestbl
WHERE Discount = 0
GROUP BY State
HAVING AVG(Profit) > 100
ORDER BY AVG(Profit) DESC
LIMIT 5;

-- 12. Find the states and region with an average profit of more than USD 100 in cases where discount was not given by the store. 

SELECT 
    State,
    Region,
	ROUND(AVG(Profit),2) AS Profit
FROM Salestbl
WHERE Discount = 0
GROUP BY State, Region
HAVING AVG(Profit) > 100
ORDER BY AVG(Profit) DESC
LIMIT 5;
    

