-- https://oracle-base.com/articles/misc/sql-for-beginners-the-update-statement

-------------------------------------- Basic UPDATE ------------------------------------------

SELECT e.salary
FROM   employees e
ORDER BY e.salary;

UPDATE employees
SET    salary = salary + 1;

SELECT e.salary
FROM   employees e
ORDER BY e.salary;

UPDATE employees
SET    salary = salary - 1
WHERE  salary >= 2000;

SELECT e.salary
FROM   employees e
ORDER BY e.salary;

ROLLBACK;

UPDATE employees
SET    salary     = 9999,
       commission = 1000,
       manager_id = 7566
WHERE  employee_id = 7369;

ROLLBACK;

-------------------------------------- UPDATE via View ------------------------------------------

CREATE OR REPLACE VIEW employees_v AS
SELECT * FROM employees;

UPDATE employees_v
SET    salary = 1000
WHERE  employee_id = 7369;

select *
from employees
order by employee_id;

ROLLBACK;

UPDATE (SELECT employee_id, salary
        FROM   employees
        WHERE  department_id = 20)
SET    salary = 4000;

ROLLBACK;

select *
from employees
where department_id = 20
order by employee_id;
-------------------------------------- Scalar Subqueries ------------------------------------------

UPDATE employees
SET    salary = (SELECT MAX(salary) FROM employees)
WHERE  employee_id = 7369;

ROLLBACK;

-------------------------------------- 0 Rows Updated ------------------------------------------

UPDATE employees
SET    salary = 10000
WHERE  employee_id = 9999;


SET SERVEROUTPUT ON
BEGIN
  UPDATE employees
  SET    salary = 10000
  WHERE  employee_id = 9999;

  DBMS_OUTPUT.put_line('NO_DATA_FOUND Not Raised');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.put_line('NO_DATA_FOUND Raised');
END;
/*
PL/SQL procedure successfully completed.

NO_DATA_FOUND Not Raised
*/

SET SERVEROUTPUT ON
BEGIN
  UPDATE employees
  SET    salary = 10000
  WHERE  employee_id = 9999;

  IF SQL%ROWCOUNT = 0 THEN -- manually test for the number of rows updated using SQL%ROWCOUNT
    -- Manually raise the NO_DATA_FOUND exception.
    RAISE NO_DATA_FOUND;
  END IF;
  DBMS_OUTPUT.put_line('NO_DATA_FOUND Not Raised');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.put_line('NO_DATA_FOUND Raised');
END;
/*
PL/SQL procedure successfully completed.

NO_DATA_FOUND Raised
*/

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


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------