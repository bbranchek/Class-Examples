
/*
PRIMARY KEY constraints
*/
ALTER TABLE employee
ADD constraint employee_pk PRIMARY KEY (ssn) ;
ALTER TABLE department
ADD constraint department_pk PRIMARY KEY (DNumber) ;
ALTER TABLE dept_locations
ADD constraint dept_locations_pk PRIMARY KEY (DNumber, DLocation) ;
ALTER TABLE dependent
ADD constraint dependent_pk PRIMARY KEY (essn, dependent_name) ;
ALTER TABLE works_on
ADD constraint works_on_pk PRIMARY KEY (essn, pno) ;
ALTER TABLE project
ADD constraint project_pk PRIMARY KEY (PNumber) ;