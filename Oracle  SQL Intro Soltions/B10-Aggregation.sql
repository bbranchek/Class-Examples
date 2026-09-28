/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM GROUP-1
/*
This solution groups a table and summarizes rows within each group. A single table is used.
*/

SELECT ProductID, COUNT(*), AVG(UnitPrice), SUM(Qty * UnitPrice)
FROM sales
GROUP BY ProductID
ORDER BY ProductID;

REM GROUP-2
/*
This solution incorporates a second table with an inner join. Further, the GROUP BY column list is expanded to allow additional non-summary columns to be included within the result table output.
*/

SELECT products.ProductID, products.Name, products.ListPrice,
       COUNT(*) AS Orders,
       AVG(sales.UnitPrice) AS Average,
       SUM(sales.Qty * sales.UnitPrice) AS Total
FROM sales, products
WHERE sales.ProductID = products.ProductID
GROUP BY products.ProductID, products.Name, products.ListPrice
ORDER BY products.ProductID;

REM GROUP-3
/*
This solution performs an inner join on another added tables, namely CUSTOMERS. However, this table is included for the purpose of row selectivity only; no information from CUSTOMERS is included within the result table.
*/

SELECT products.ProductID, products.Name, products.ListPrice,
       COUNT(*) AS Orders,
       AVG(sales.UnitPrice) AS Average,
       SUM(sales.Qty * sales.UnitPrice) AS Total
FROM sales, products, customers
WHERE sales.ProductID = products.ProductID
AND sales.CustomerID = customers.CustomerID
AND customers.Type <> 'Retail'
GROUP BY products.ProductID, products.Name, products.ListPrice
ORDER BY products.ProductID;

                                                               
REM GROUP-4
/*
This solution performs selectivity on the resulting groups using the HAVING clause. Further, summary columns are referenced in the ORDER BY clause.
*/

SELECT products.ProductID, products.Name, products.ListPrice,
       COUNT(*) AS Orders,
       AVG(sales.UnitPrice) AS Average,
       SUM(sales.Qty * sales.UnitPrice) AS Total
FROM sales, products
WHERE sales.ProductID = products.ProductID
GROUP BY products.ProductID, products.Name, products.ListPrice
HAVING COUNT(*) > 3
ORDER BY SUM(sales.Qty * sales.UnitPrice) DESC;


REM GROUP-5
SELECT Gender, AVG(Salary)
FROM members
GROUP BY Gender
ORDER BY Gender;


REM GROUP-6
SELECT Married, AVG(Salary)
FROM members
WHERE FireDate IS NULL
GROUP BY Married
ORDER BY Married;


REM GROUP-7
/*
This solution performs a reflexive or self-join to produce the necessary base table information. The intermediate result table is then grouped in the usual manner.
*/

SELECT MENTOR.LastName, MENTOR.FirstName, COUNT(*)
FROM members MENTOR, members TRAINEE
WHERE TRAINEE.MentorID = MENTOR.MemberID
GROUP BY MENTOR.LastName, MENTOR.FirstName
ORDER BY COUNT(*) DESC;

