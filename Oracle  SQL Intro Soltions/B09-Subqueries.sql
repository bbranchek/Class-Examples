/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM SUBQUERY-1
SELECT members.LastName, members.FirstName, teams.Name
FROM members, teams
WHERE members.TeamID = teams.TeamID
AND members.HireDate = (SELECT MAX(HireDate)
                        FROM members);

REM SUBQUERY-2
SELECT members.LastName, members.FirstName, teams.Name
FROM members, teams
WHERE members.TeamID = teams.TeamID
AND members.Salary = (SELECT MAX(Salary)
                      FROM members);

REM SUBQUERY-3
SELECT members.LastName, members.FirstName, teams.Name
FROM members, teams
WHERE members.MemberID = teams.LeaderID
AND teams.StartDate = (SELECT MAX(StartDate)
                       FROM teams);

REM SUBQUERY-4
SELECT customers.Name AS CustName,
       products.Name AS ProdName,
       sales.SaleDate
FROM customers, sales, products
WHERE customers.CustomerID = sales.CustomerID
AND sales.ProductID = products.ProductID
AND sales.SaleDate = (SELECT MIN(SaleDate)
                      FROM sales);

REM SUBQUERY-5
SELECT sales.*
FROM sales
WHERE Qty * UnitPrice = (SELECT MAX(Qty * UnitPrice)
                         FROM sales);

REM SUBQUERY-6
SELECT customers.*
FROM customers
WHERE NOT EXISTS (SELECT *
                  FROM sales
                  WHERE sales.CustomerID = customers.CustomerID);

SELECT products.*
FROM products
WHERE NOT EXISTS (SELECT *
                  FROM sales
                  WHERE sales.ProductID = products.ProductID);

REM SUBQUERY-7
INSERT INTO customers (CustomerID, Name)
    VALUES (105, 'New Customer');

INSERT INTO products (ProductID, Name)
     VALUES (306, 'New Product');

SELECT customers.*
FROM customers
WHERE NOT EXISTS (SELECT *
                  FROM sales
                  WHERE sales.CustomerID = customers.CustomerID);

SELECT products.*
FROM products
WHERE NOT EXISTS (SELECT *
                  FROM sales
                  WHERE sales.ProductID = products.ProductID);

ROLLBACK;

REM SUBQUERY-8
SELECT OUTER.FirstName, OUTER.LastName, teams.Name
FROM members OUTER, teams
WHERE OUTER.TeamID = teams.TeamID
AND OUTER.Salary > (SELECT AVG(INNER.Salary)
                    FROM members INNER
                    WHERE INNER.TeamID = teams.TeamID);

REM SUBQUERY-9
SELECT products.Name, products.ListPrice
FROM products
WHERE NOT EXISTS (SELECT *
                  FROM sales, customers
                  WHERE sales.CustomerID = customers.CustomerID
                  AND sales.ProductID = products.ProductID
                  AND customers.Name = 'Hi Tech Supply');

REM SUBQUERY-10
SELECT OUTER.Name AS CustName,
       products.Name AS ProdName, products.ListPrice
FROM customers OUTER, products
WHERE products.ProductID NOT IN
                 (SELECT sales.ProductID
                  FROM sales
                  WHERE sales.CustomerID = OUTER.CustomerID)
ORDER BY CustName, ProdName;

