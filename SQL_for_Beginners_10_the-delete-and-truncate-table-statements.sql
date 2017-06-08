-- https://oracle-base.com/articles/misc/sql-for-beginners-the-delete-and-truncate-table-statements

-------------------------------------- Basic DELETE ------------------------------------------

select * 
from employees
order by employee_id;

DELETE FROM employees;

ROLLBACK;

DELETE FROM employees
WHERE employee_id = 7369; 

ROLLBACK;

-------------------------------------- DELETE via View ------------------------------------------

CREATE OR REPLACE VIEW employees_v AS
SELECT * FROM employees;

DELETE FROM employees_v
WHERE employee_id = 7369;

ROLLBACK;

DELETE FROM (SELECT employee_id, salary
             FROM   employees
             WHERE  department_id = 20);
             
ROLLBACK;             
-------------------------------------- 0 Rows Deleted ------------------------------------------

DELETE FROM employees
WHERE  employee_id = 9999;
-- 0 rows deleted.

SET SERVEROUTPUT ON
BEGIN
  DELETE FROM employees
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
  DELETE FROM employees
  WHERE  employee_id = 9999;

  IF SQL%ROWCOUNT = 0 THEN
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
-------------------------------------- TRUNCATE TABLE ------------------------------------------
-- The TRUNCATE TABLE statement is a DDL command, 
-- so it includes an implicit COMMIT
-- there is no way to issue a ROLLBACK if you decide you didn't want to remove the rows.

SELECT COUNT(*)
FROM   employees;
-- 14

TRUNCATE TABLE employees;
-- Table EMPLOYEES truncated.

ROLLBACK;
-- Rollback complete.

SELECT COUNT(*)
FROM   employees;
-- 0

-- The TRUNCATE TABLE statement can remove the storage associated with the table, or leave it to be reused later.

-- Remove storage.
TRUNCATE TABLE employees;
TRUNCATE TABLE employees DROP STORAGE;

-- Keep storage.
TRUNCATE TABLE employees REUSE STORAGE;
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