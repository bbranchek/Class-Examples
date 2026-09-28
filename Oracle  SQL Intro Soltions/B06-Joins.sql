/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM JOIN-1
/*
This solution uses a standard inner join together with a simple conditional expression.
*/

SELECT members.LastName, members.FirstName, members.HireDate
FROM members, teams
WHERE members.TeamID = teams.TeamID
AND teams.Name = 'Production';

REM JOIN-2
/*
This solution also uses standard inner joins together with
a simple conditional expression. However, in this case three tables are used and one must therefore ensure that an appropriate join condition for each pair of tables has been specified.
*/

SELECT products.Name
FROM products, sales, customers
WHERE customers.Name = 'Hi Tech Supply'
AND customers.CustomerID = sales.CustomerID
AND sales.ProductID = products.ProductID;

REM JOIN-3
/*
This solution employs nothing more than inner joins. What makes this challenging, though, is the fact that we must reference every table within our hypothetical database to obtain all of the necessary information. Thus, we must be especially careful that each pair of tables has a corresponding and correctly written inner join condition.
*/

SELECT products.Name AS ProdName,
       teams.Name AS TeamName,
       customers.Name AS CustName
FROM products, members, teams, sales, customers
WHERE products.MemberID = members.MemberID
AND members.TeamID = teams.TeamID
AND products.ProductID = sales.ProductID
AND sales.CustomerID = customers.CustomerID;

REM JOIN-4
/*
This solution is nearly identical to the previous one and likewise utilizes all of the tables within our database. The primary difference is that the result table is limited to only those rows which are relevant for the particular customer in question.
*/

SELECT products.Name AS ProdName,
       teams.Name AS TeamName
FROM products, members, teams, sales, customers
WHERE products.MemberID = members.MemberID
AND members.TeamID = teams.TeamID
AND products.ProductID = sales.ProductID
AND sales.CustomerID = customers.CustomerID
AND customers.Name = 'The Camera Store';

REM JOIN-5
/*
This solution employs a reflexive join and is similar to one discussed within the lecture notes for this section.

When using reflexive joins it is important that sensible alias names for the tables and the columns are selected in order for the query itself as well as the result table to be meaningful.
*/

SELECT mentor.LastName AS MentorLast,
       mentor.FirstName AS MentorFirst,
       trainee.LastName AS TraineeLast,
       trainee.FirstName AS TraineeFirst
FROM members TRAINEE, members MENTOR
WHERE trainee.MentorID = mentor.MemberID
ORDER BY MentorLast, MentorFirst;

REM JOIN-6
/*
This solution employs a reflexive join within the MEMBERS table but does so on a non-key basis. There is no inherent relationship within the data model between Dupre and all the other team members, other than that which we already considered for mentoring. However, within the context of this query we will essentially invent such a relationship by using a non-key join technique.

When doing so, we must first follow the guideline for sensible alias names. Additionally, we must make sure that the comparison table which represents Dupre has been properly reduced to the row or rows which are appropriate.
*/

SELECT TheOthers.LastName, TheOthers.FirstName, TheOthers.Salary
FROM members Dupre, members TheOthers
WHERE Dupre.LastName = 'Dupre'
AND Dupre.FirstName = 'Michael'
AND Dupre.Salary > TheOthers.Salary;

REM JOIN-7
/*
This solution is nearly identical to the previous one; a computational column has been added to the result table, nothing more. However, this demonstrates that when combining techniques, such as the reflexive join and non-key join used here, even the simple task of adding a computational column requires careful thought about the columns used.
*/

SELECT TheOthers.LastName, TheOthers.FirstName, TheOthers.Salary,
       Dupre.Salary - TheOthers.Salary AS Difference
FROM members Dupre, members TheOthers
WHERE Dupre.LastName = 'Dupre'
AND Dupre.FirstName = 'Michael'
AND Dupre.Salary > TheOthers.Salary;

REM JOIN-8
/*
This solution also uses a reflexive and non-key join. The techniques are nearly identical as those already used but the solution may nonetheless still be challenging when just a few details have been changed.
*/

SELECT m1.MemberID, m1.FirstName, m1.LastName,
       m2.MemberID, m2.FirstName, m2.LastName
FROM members m1, members m2
WHERE m1.LastName = m2.LastName
AND m1.MemberID <> m2.MemberID;


REM JOIN-9
/*
This solution is a simple inner join. Our only unique feature is the inclusion of the DISTINCT clause to eliminate the redundant rows which an inner join often produces.
*/

SELECT DISTINCT teams.Name
FROM teams, members
WHERE teams.TeamID = members.TeamID;

REM JOIN-10
/*
This solution uses an outer join and isolates the wild card row which the outer join operation then utilizes.
*/

SELECT teams.Name
FROM members, teams
WHERE members.TeamID (+) = teams.TeamID
AND members.MemberID IS NULL;
