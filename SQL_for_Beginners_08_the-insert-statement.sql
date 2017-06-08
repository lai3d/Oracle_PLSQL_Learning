-- https://oracle-base.com/articles/misc/sql-for-beginners-the-insert-statement

-------------------------------------- Setup ------------------------------------------

-- DROP TABLE employees2 PURGE;

CREATE TABLE employees2 (
  employee_id   NUMBER(4) CONSTRAINT employees2_pk PRIMARY KEY,
  employee_name VARCHAR2(10) NOT NULL,
  job           VARCHAR2(9) NOT NULL,
  manager_id    NUMBER(4),
  hiredate      DATE,
  salary        NUMBER(7,2),
  commission    NUMBER(7,2),
  department_id NUMBER(2)
);

-------------------------------------- COMMIT and ROLLBACK ------------------------------------------



-------------------------------------- Basic INSERT ------------------------------------------

INSERT INTO employees2 VALUES (8888,'JONES','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

SELECT *
FROM  employees2
ORDER BY employee_id;

ROLLBACK; -- revert the data to its original state

INSERT INTO employees2 (employee_name, job, hiredate, salary, employee_id)
VALUES ('JONES','CLERK',to_date('17-12-1980','dd-mm-yyyy'),800,8888);

SELECT *
FROM  employees2
ORDER BY employee_id;

ROLLBACK;

INSERT INTO employees2 (employee_id, employee_name, manager_id, hiredate, salary, commission, department_id)
VALUES (8888,'JONES',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
/*
Error starting at line : 41 in command -
INSERT INTO employees2 (employee_id, employee_name, manager_id, hiredate, salary, commission, department_id)
VALUES (8888,'JONES',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20)
Error report -
SQL Error: ORA-01400: cannot insert NULL into ("IOMDEV"."EMPLOYEES2"."JOB")
01400. 00000 -  "cannot insert NULL into (%s)"
*Cause:    An attempt was made to insert NULL into previously listed objects.
*Action:   These objects cannot accept NULL values.
*/
-------------------------------------- INSERT into Views ------------------------------------------

CREATE OR REPLACE VIEW employees2_v AS
SELECT * FROM employees2;

INSERT INTO employees2_v VALUES (8888,'JONES','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

SELECT *
FROM  employees2
ORDER BY employee_id;

ROLLBACK;

INSERT INTO (SELECT employee_id, employee_name, job, hiredate, salary
             FROM   employees2)
VALUES (8888,'JONES','CLERK',to_date('17-12-1980','dd-mm-yyyy'),800);

SELECT *
FROM  employees2
ORDER BY employee_id;

ROLLBACK;
-------------------------------------- INSERT ... SELECT ------------------------------------------

-- Make sure the table is empty.
TRUNCATE TABLE employees2;

INSERT INTO employees2
SELECT * FROM employees;

COMMIT;

SELECT *
FROM  employees2
ORDER BY employee_id;


TRUNCATE TABLE employees2;

INSERT INTO employees2 (employee_id, employee_name, job, hiredate, salary)
SELECT employee_id, employee_name, job, hiredate, salary
FROM   employees;

COMMIT;

SELECT *
FROM  employees2
ORDER BY employee_id;


TRUNCATE TABLE employees2;

INSERT INTO employees2
SELECT *
FROM   employees
WHERE  department_id = 20; -- filter the data or join to other tables to gather the data

COMMIT;

SELECT *
FROM  employees2
ORDER BY employee_id;

-------------------------------------- Scalar Subqueries ------------------------------------------

TRUNCATE TABLE employees2;

INSERT INTO employees2 
  ( employee_id
  , employee_name
  , job
  , hiredate
  , salary) --  the SALARY column is populated by a scalar subquery
VALUES 
  (8888
  , 'JONES'
  , 'CLERK'
  , to_date('17-12-1980','dd-mm-yyyy')
  , (SELECT MAX(salary)+1000 FROM employees)); -- returns the maximum SALARY from the EMPLOYEES table and adds 1000 to it.

SELECT *
FROM  employees2
ORDER BY employee_id;

--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------

--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------