/*
FOREIGN KEY constraints
*/
ALTER TABLE employee
ADD (
constraint employee_superssn_fk FOREIGN KEY (superSSN)
REFERENCES employee (ssn) ,
constraint employee_department_fk FOREIGN KEY (dno)
REFERENCES department (DNumber)
);
ALTER TABLE dependent
ADD (
constraint dependent_fk FOREIGN KEY (essn)
REFERENCES employee (ssn)
ON DELETE CASCADE
);
ALTER TABLE works_on
ADD CONSTRAINT works_on_employee_fk
FOREIGN KEY (essn)
REFERENCES employee (ssn);

ALTER TABLE works_on
ADD CONSTRAINT works_on_project_fk
FOREIGN KEY (pno)
REFERENCES project (PNumber);

ALTER TABLE dept_locations
ADD (
constraint dept_locations_fk FOREIGN KEY (DNumber)
REFERENCES department (DNumber )
);

ALTER TABLE department
ADD (
constraint department_fk FOREIGN KEY (mgrssn)
REFERENCES employee (ssn)
);

ALTER TABLE project
ADD (
constraint project_fk FOREIGN KEY (DNum)
REFERENCES department (DNumber )
);