/* 
Copyright (c) 2010 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/

REM MANAGING CONSTRAINTS-1



SELECT table_name, constraint_name, constraint_type, 
       search_condition, generated
FROM user_constraints;

REM MANAGING CONSTRAINTS-2
SELECT index_name FROM user_indexes;

MANAGING CONSTRAINTS-3
ALTER TABLE employee
  DROP CONSTRAINT employee_valid_gender
  DROP CONSTRAINT employee_valid_salary
  DROP CONSTRAINT employee_valid_bdate
  DROP CONSTRAINT check_bonus_salary;

REM MANAGING CONSTRAINTS-4
create table exceptions(
                  row_id rowid,
                  owner varchar2(30),
                  table_name varchar2(30),
                  constraint varchar2(30)
                  );

REM MANAGING CONSTRAINTS-5
ALTER TABLE employee
  ADD constraint check_salary CHECK (salary < 20000)
  DISABLE;

REM MANAGING CONSTRAINTS-6
ALTER TABLE employee
      ENABLE constraint check_salary
      EXCEPTIONS INTO exceptions;

SELECT row_id
FROM exceptions
WHERE constraint = 'CHECK_SALARY';

REM MANAGING CONSTRAINTS-7
SELECT LName, salary, search_condition
FROM employee
INNER JOIN exceptions ON employee.rowid = exceptions.row_id
INNER JOIN user_constraints
      ON exceptions.constraint = user_constraints.constraint_name;
                                                   
REM MANAGING CONSTRAINTS-8
DELETE FROM exceptions;

UPDATE employee
     SET salary = 19000;

ALTER TABLE employee
     ENABLE constraint check_salary
     EXCEPTIONS INTO exceptions;
