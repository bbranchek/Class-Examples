/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM SELECT-1
SELECT CustomerID, ProductID, Qty * UnitPrice AS Actual,
                              Qty * (UnitPrice * 1.10) AS Proposed
FROM sales;


REM SELECT-2
SELECT LastName, FirstName, Salary AS Actual, Salary * .95 AS Proposed
FROM members;

REM SELECT-3
SELECT Name  ||
       ' - ' ||
      Location
FROM products;

REM SELECT-4
SELECT DISTINCT SaleDate
FROM sales;

REM SELECT-5
SELECT TeamID AS "Team #",
       Name AS "Team Name",
       StartDate AS "Started",
       LeaderID AS "Leader #"
FROM teams;

REM SELECT-6
SELECT T.TeamID AS "Team #",
       T.Name AS "Team Name",
       T.StartDate AS "Started",
       T.LeaderID AS "Leader #"
FROM teams T;


REM SELECT-7
SELECT UNIQUE MentorID
FROM members;

