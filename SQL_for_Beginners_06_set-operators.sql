-- https://oracle-base.com/articles/misc/sql-for-beginners-set-operators

-------------------------------------- Introduction ------------------------------------------

-- Department 10, 20 and 30.
SELECT department_id, department_name
FROM   departments
WHERE  department_id <= 30;

--Department 20, 30 and 40.
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20;

-------------------------------------- UNION ------------------------------------------

SELECT department_id, department_name
FROM   departments
WHERE  department_id <= 30
UNION
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY 1;


-------------------------------------- UNION ALL ------------------------------------------

SELECT department_id, department_name
FROM   departments
WHERE  department_id <= 30
UNION ALL
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY 1;

-------------------------------------- INTERSECT ------------------------------------------

SELECT department_id, department_name
FROM   departments
WHERE  department_id <= 30
INTERSECT
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY 1;

-------------------------------------- MINUS ------------------------------------------
-- This is functionally equivalent to the ANSI set operator EXCEPT DISTINCT.

SELECT department_id, department_name
FROM   departments
WHERE  department_id <= 30
MINUS
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY 1;

-------------------------------------- ORDER BY ------------------------------------------

-- Column name.
SELECT employee_id, employee_name
FROM   employees
WHERE  department_id = 10
UNION ALL
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY employee_id;

-- Column Alias
SELECT employee_id AS emp_id, employee_name
FROM   employees
WHERE  department_id = 10
UNION ALL
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY emp_id;

-- Column position
SELECT employee_id, employee_name
FROM   employees
WHERE  department_id = 10
UNION ALL
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY 1;

-- Wrong column name.
SELECT employee_id, employee_name
FROM   employees
WHERE  department_id = 10
UNION ALL
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY department_id;

/*
ORA-00904: "DEPARTMENT_ID": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
Error at Line: 101 Column: 10
*/

-------------------------------------- Data Types ------------------------------------------

SELECT TO_CHAR(employee_id) AS employee_id, employee_name
FROM   employees
WHERE  department_id = 10
UNION ALL
SELECT department_id, department_name
FROM   departments
WHERE  department_id >= 20
ORDER BY 1;

/*
ORA-01790: expression must have same datatype as corresponding expression
01790. 00000 -  "expression must have same datatype as corresponding expression"
*Cause:    
*Action:
Error at Line: 113 Column: 8
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