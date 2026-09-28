/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM SET-1
SELECT DISTINCT products.Name, products.ListPrice     FROM products, sales, customers     WHERE products.ProductID = sales.ProductID     AND sales.CustomerID = customers.CustomerID     AND customers.Name = 'The Camera Store'          UNION     SELECT DISTINCT products.Name, products.ListPrice     FROM products, members, teams     WHERE products.MemberID = members.MemberID     AND members.TeamID = teams.TeamID     AND teams.Name = 'Engineering';

REM SET-2
SELECT DISTINCT products.Name, products.ListPrice     FROM products, sales, customers     WHERE products.ProductID = sales.ProductID     AND sales.CustomerID = customers.CustomerID     AND customers.Name = 'The Camera Store'          INTERSECT     SELECT DISTINCT products.Name, products.ListPrice     FROM products, members, teams     WHERE products.MemberID = members.MemberID     AND members.TeamID = teams.TeamID     AND teams.Name = 'Engineering';

REM SET-3
SELECT DISTINCT products.Name, products.ListPrice     FROM products, sales, customers     WHERE products.ProductID = sales.ProductID     AND sales.CustomerID = customers.CustomerID     AND customers.Name = 'The Camera Store'          MINUS     SELECT DISTINCT products.Name, products.ListPrice     FROM products, members, teams     WHERE products.MemberID = members.MemberID     AND members.TeamID = teams.TeamID     AND teams.Name = 'Engineering';

REM SET-4
SELECT DISTINCT products.Name, products.ListPrice     FROM products, members, teams     WHERE products.MemberID = members.MemberID     AND members.TeamID = teams.TeamID     AND teams.Name = 'Engineering'               MINUS     SELECT DISTINCT products.Name, products.ListPrice     FROM products, sales, customers     WHERE products.ProductID = sales.ProductID     AND sales.CustomerID = customers.CustomerID     AND customers.Name = 'The Camera Store';