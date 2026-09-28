/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM WHERE-1
SELECT *
FROM sales
WHERE UnitPrice = 2900;

SELECT *
FROM sales
WHERE UnitPrice = 2900
AND CustomerID <> 103;

SELECT *
FROM sales
WHERE UnitPrice BETWEEN 500 AND 1000;

SELECT sales.*, Qty * UnitPrice AS "Total"
FROM sales
WHERE Qty < 10
AND Qty * UnitPrice > 5000;

REM WHERE-2
SELECT Name, Address
FROM customers
WHERE telephone LIKE '212%';

REM WHERE-3
SELECT FirstName, LastName
FROM members
WHERE FireDate IS NULL;

REM WHERE-4
SELECT *
FROM customers
WHERE Type = 'Retail'
OR Type = 'Distributor';

SELECT *
FROM customers
WHERE Type IN ('Retail',
               'Distributor');

REM WHERE-5
SELECT FirstName, LastName, MentorID
FROM members
WHERE MentorID IS NOT NULL;

REM WHERE-6
SELECT FirstName, LastName, Salary, Bonus
FROM members
WHERE FirstName = 'John'
AND LastName = 'Jones';

REM WHERE-7
SELECT ProductID, Name
FROM products
WHERE REGEXP_LIKE(Name, 'video|photo|scan', 'i');

SELECT ProductID, Name
FROM products
WHERE REGEXP_LIKE(Name, '^(video|photo|scan)', 'i');

