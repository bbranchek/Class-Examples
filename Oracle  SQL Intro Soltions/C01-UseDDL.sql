/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM DDL-1
CREATE TABLE my_employee
(
     employee_id      NUMBER(6) NOT NULL,
     last_name        VARCHAR2(25),
     birth_date       DATE,
     address          VARCHAR2(40),
     salary           NUMBER(8) DEFAULT 15000,
     MaritalStatus    CHAR(1)
);


REM DDL-2
ALTER TABLE my_employee
 ADD      (bonus     NUMBER(8,2))
 MODIFY   (address   VARCHAR2(50),
           last_name NOT NULL)
;


REM DDL-3
DESCRIBE my_employee;
RENAME my_employee TO test_employee;
DROP TABLE test_employee;

