/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM PSEUDO-ETC-1
/*
Remember that the actual ROWID value is assigned by the database each time a row is inserted. Therefore, the specific ROWID values shown below for our database will almost certainly differ from what you see in your own database.
*/
SELECT Name, ROWID
FROM products;

REM PSEUDO-ETC-2
SELECT Name, ROWID
FROM products
WHERE ROWID = 'AAAISxAAIAAAAAyAAA';

REM PSEUDO-ETC-3
SELECT FirstName, LastName, Gender, Salary
FROM members
WHERE Gender = 'F'
AND ROWNUM <= 2;

SELECT FirstName, LastName, Gender, Salary
FROM members
WHERE Gender = 'M'
AND Salary > 30000
AND ROWNUM <= 1;

SELECT FirstName, LastName, Gender, Salary
FROM members
WHERE Gender = 'M'
AND Salary > 30000
AND ROWNUM <= 1;

REM PSEUDO-ETC-4
SELECT SYSDATE, UID, USERFROM dual;REM PSEUDO-ETC-5
SELECT CustomerID, ProductID, Qty * UnitPrice AS Actual,                              Qty * (UnitPrice * 1.10) AS ProposedFROM salesORDER BY Proposed DESCFETCH FIRST 5 ROWS ONLY;SELECT CustomerID, ProductID, Qty * UnitPrice AS Actual,                              Qty * (UnitPrice * 1.10) AS ProposedFROM salesORDER BY Proposed DESCOFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;SELECT CustomerID, ProductID, Qty * UnitPrice AS Actual,                              Qty * (UnitPrice * 1.10) AS ProposedFROM salesORDER BY Proposed ASCFETCH FIRST 25 PERCENT ROWS ONLY;SELECT CustomerID, ProductID, Qty * UnitPrice AS Actual,                              Qty * (UnitPrice * 1.10) AS ProposedFROM salesORDER BY Proposed ASCFETCH FIRST 25 PERCENT ROWS WITH TIES;