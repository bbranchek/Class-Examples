ALTER TABLE employee
ADD (
  Officephone VARCHAR2(14) UNIQUE,
  bonus NUMBER(6)
);
ALTER TABLE employee
ADD CONSTRAINT employee_valid_gender
CHECK (sex IN ('M', 'F'));

ALTER TABLE employee
ADD CONSTRAINT employee_valid_salary
CHECK (salary > 10000);

ALTER TABLE employee
ADD CONSTRAINT employee_valid_bdate
CHECK (BDate IS NOT NULL);

ALTER TABLE employee
ADD CONSTRAINT check_bonus_salary
CHECK (salary > bonus);
ALTER TABLE employee
MODIFY (
  LName DEFAULT 'Doe',
  salary DEFAULT 20000,
  address NOT NULL
);
