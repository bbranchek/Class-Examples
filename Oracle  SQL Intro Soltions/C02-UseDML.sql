/* 
Copyright (c) 2013 Sideris Courseware Corporation. All Rights Reserved.
Each instructor or student with access to this file must have purchased
a license to the corresponding Sideris Courseware textbook to which 
these files apply. All other use, broadcast, webcast, duplication or distribution
is prohibited and illegal.
*/


REM DML-1
SELECT TeamID
FROM teams
WHERE Name = 'Production';

INSERT INTO members (MemberID, FirstName, LastName, Gender, TeamID)
     VALUES (509, 'John', 'Doe', 'M', 401);

INSERT INTO products
     VALUES (306, 'New product', 'Newly added', 100, 1, 0, 'Boston', 509);

SELECT MemberID, FirstName, LastName, Gender, TeamID
FROM members;

SELECT ProductID, Name, MemberID
FROM products;

REM DML-2
COMMIT;


REM DML-3
UPDATE members
  SET Salary = Salary * 1.1,
      Bonus = Salary * .05,
      Married = NULL,
      HireDate = '01-JAN-90'
  WHERE LastName = 'Ho';


REM DML-4
ROLLBACK;
SELECT * FROM members;


REM DML-5
/* Update any TEAMS rows where John Jones is the leader */
UPDATE teams
SET LeaderID = NULL
WHERE LeaderID = 500;

/* Update any MEMBERS rows where John Jones is the mentor */
UPDATE members
SET MentorID = NULL
WHERE MentorID = 500;

/* Update any PRODUCTS rows where John Jones is the responsible individual */
UPDATE products
SET MemberID = NULL
WHERE MemberID = 500;

SAVEPOINT remove_from_oversight;

/* Terminate 'John Jones'. While we will retain his row within the table he will no longer be considered active. */
UPDATE members
SET FireDate = '01-MAY-02'
WHERE MemberID = 500;

SAVEPOINT fire_member;
/* ROLLBACK to a savepoint mark. The most recent update is undone.
   The other statements remain pending */
ROLLBACK TO remove_from_oversight;

/* Confirm that the termination has been undone as indicated by the absence
of any value within FireDate
*/
SELECT FirstName, LastName, FireDate
FROM members
WHERE MemberID = 500;

/* Conclude the transaction with all other pending changes made permanent */
COMMIT;


