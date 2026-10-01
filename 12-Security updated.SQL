/* 
Copyright (c) 2010 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/



REM SECURITY-2

sqlplus student1/password@localhost:1521/FREEPDB1

GRANT select, update ON employee to student;

REM SECURITY-3

connect student/password@localhost:1521/FREEPDB1

SELECT LName, salary FROM student1.employee;

UPDATE student1.employee
   SET salary = salary * 1.1;

SELECT LName, salary
FROM student1.employee;

ROLLBACK;

REM SECURITY-4

connect student1/password@localhost:1521/FREEPDB1


REVOKE update ON employee FROM student;

GRANT update (LName) ON employee TO student;

REM SECURITY-5

connect student/password@localhost:1521/FREEPDB1


UPDATE student1.employee
SET LName = NULL;

UPDATE student1.employee
SET salary = NULL;
