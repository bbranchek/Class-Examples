/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM SUMMARY-1
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM members;

REM SUMMARY-2
SELECT COUNT(*) FROM members;

REM SUMMARY-3
SELECT COUNT(*)
FROM members, teams
WHERE members.TeamID = teams.TeamID
AND teams.Name = 'Production';

REM SUMMARY-4
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM members, teams
WHERE members.TeamID = teams.TeamID
AND teams.Name = 'Production';
