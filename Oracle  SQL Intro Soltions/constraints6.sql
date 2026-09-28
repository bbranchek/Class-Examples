
ALTER TABLE employee
ADD emailAddress VARCHAR2(256);

ALTER TABLE employee
ADD CONSTRAINT employee_email_format
CHECK (REGEXP_INSTR(emailAddress,
       '^\w+@[A-Za-z_]+?\.[A-Za-z]{2,3}$') > 0);

ALTER TABLE employee
ADD CONSTRAINT employee_officephone_format
CHECK (REGEXP_INSTR(OfficePhone,
       '^\(\d{3}\) \d{3}-\d{4}$') > 0);


UPDATE employee
SET eMailAddress =
'info@sideris...com',
OfficePhone = ' (617) 9659800'
WHERE LName = 'Wong';

UPDATE employee
SET OfficePhone = '(617) 965-9800';



