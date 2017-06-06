-- https://oracle-base.com/articles/misc/sql-for-beginners-the-from-clause

-------------------------------------- Setup ------------------------------------------
--------------------------------------  ------------------------------------------

SELECT e.employee_name, d.department_name
FROM   employees e
       JOIN departments d ON d.department_id = e.department_id
ORDER BY e.employee_name;

-- non-ANSI syntax for joins

SELECT e.employee_name, d.department_name
FROM   employees e, departments d
WHERE  d.department_id = e.department_id
ORDER BY e.employee_name;

-------------------------------------- Inline Views ------------------------------------------

SELECT ed.employee_name, ed.department_name
FROM   (SELECT e.employee_name, d.department_name
        FROM   employees e, departments d
        WHERE  d.department_id = e.department_id) ed
ORDER BY ed.employee_name;

-------------------------------------- WITH Clause ------------------------------------------

WITH emp_dept_join AS (
  SELECT e.employee_name, d.department_name
  FROM   employees e, departments d
  WHERE  d.department_id = e.department_id
)
SELECT ed.employee_name, ed.department_name
FROM   emp_dept_join ed
ORDER BY ed.employee_name;

-------------------------------------- Views ------------------------------------------

CREATE OR REPLACE VIEW emp_dept_join_v AS
  SELECT e.employee_name, d.department_name
  FROM   employees e, departments d
  WHERE  d.department_id = e.department_id;

SELECT ed.employee_name, ed.department_name
FROM   emp_dept_join_v ed
ORDER BY ed.employee_name;

-------------------------------------- Pipelined Table Functions ------------------------------------------

CREATE TYPE t_employee_name_tab AS TABLE OF VARCHAR2(10);
/

CREATE OR REPLACE FUNCTION get_employee_names
  RETURN t_employee_name_tab PIPELINED
AS
BEGIN
  FOR cur_rec IN (SELECT employee_name FROM employees) LOOP
    PIPE ROW (cur_rec.employee_name);
  END LOOP;
  RETURN;
END;
/

SELECT e.column_value AS employee_name
FROM   TABLE(get_employee_names) e
ORDER BY e.column_value;


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


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------


--------------------------------------  ------------------------------------------