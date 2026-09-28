/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM ORDER-1
SELECT *
FROM teams
ORDER BY StartDate DESC;

REM ORDER-2
SELECT FirstName, LastName, Salary, Bonus, Gender
FROM members
ORDER BY Gender, Salary;

REM ORDER-3
SELECT FirstName, LastName, Salary, Bonus, Gender
FROM members
ORDER BY Gender, Salary DESC;

REM ORDER-4
SELECT FirstName, LastName, Salary + Bonus AS TotalCompensation, Gender
FROM members
ORDER BY TotalCompensation DESC;

REM ORDER-5
SELECT FirstName, LastName, Salary + Bonus AS TotalCompensation, Gender
FROM members
ORDER BY TotalCompensation ASC;

REM ORDER-6
SELECT *
FROM sales
ORDER BY SaleDate DESC, Qty, UnitPrice;
