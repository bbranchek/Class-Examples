SELECT essn
FROM dependent;

DELETE FROM
works_on
WHERE essn = '123456789';

DELETE FROM employee
WHERE ssn = '123456789'; 

SELECT essn
FROM dependent;