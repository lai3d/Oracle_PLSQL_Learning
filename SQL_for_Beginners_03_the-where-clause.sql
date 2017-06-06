-- https://oracle-base.com/articles/misc/sql-for-beginners-the-where-clause

-------------------------------------- Introduction ------------------------------------------

-- non-ANSI join syntax

SELECT e.employee_name, e.salary, d.department_id, d.department_name
FROM   employees e, departments d
WHERE  e.department_id = d.department_id  -- Join Condition
AND    d.department_id = 20               -- Filter
AND    e.salary >= 2000                   -- Filter
ORDER BY e.employee_name;

-- ANSI join syntax

SELECT e.employee_name, e.salary, d.department_id, d.department_name
FROM   employees e
       JOIN departments d ON e.department_id = d.department_id
WHERE  d.department_id = 20               -- Filter
AND    e.salary >= 2000                   -- Filter
ORDER BY e.employee_name;

-------------------------------------- Equality and Inequality Conditions ------------------------------------------
/*
= : Equal.
<> or != : Not equal.
> : Greater than.
< : Less than.
>= : Great than or equal.
<= : Less than or equal.
*/

SELECT e.employee_name, e.department_id, e.salary
FROM   employees e
WHERE  e.department_id = 20
AND    e.salary >= 2000
ORDER BY e.employee_name;

-------------------------------------- IN and NOT IN Conditions ------------------------------------------

SELECT e.department_id, e.employee_id, e.employee_name
FROM   employees e
WHERE  e.department_id IN (10, 20)
ORDER BY e.department_id, e.employee_id;

SELECT e.department_id, e.employee_id, e.employee_name
FROM   employees e
WHERE  e.department_id NOT IN (10, 20)
ORDER BY e.department_id, e.employee_id;

SELECT e.department_id, e.employee_id, e.employee_name
FROM   employees e
WHERE  e.department_id IN (SELECT d.department_id
                           FROM   departments d
                           WHERE  d.department_id < 30)
ORDER BY e.department_id, e.employee_id;

-------------------------------------- EXISTS and NOT EXISTS Conditions ------------------------------------------

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  EXISTS (SELECT 1
               FROM   employees e
               WHERE  d.department_id = e.department_id)
ORDER BY d.department_id;

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  NOT EXISTS (SELECT 1
                   FROM   employees e
                   WHERE  d.department_id = e.department_id)
ORDER BY d.department_id;

-------------------------------------- BETWEEN and NOT BETWEEN Conditions ------------------------------------------

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  department_id BETWEEN 20 AND 40 -- within the specified range, boundaries inclusive
ORDER BY d.department_id;

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  department_id NOT BETWEEN 20 AND 40
ORDER BY d.department_id;

-------------------------------------- LIKE and NOT LIKE Conditions ------------------------------------------
-- The '%' is a variable length wildcard. The '_' is a single character wildcard.

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  department_name LIKE '%O%' -- as long as the name includes the character 'O'
ORDER BY d.department_id;

SELECT d.department_id, d.department_name
FROM   departments d
WHERE  department_name NOT LIKE '%O%'
ORDER BY d.department_id;

-------------------------------------- OR Condition ------------------------------------------

SELECT e.employee_id, e.employee_name, e.department_id, e.salary, e.job
FROM   employees e
WHERE  e.department_id = 20
AND    e.job = 'MANAGER'
OR     e.job = 'CLERK'
ORDER BY e.employee_id;

SELECT e.employee_id, e.employee_name, e.department_id, e.salary, e.job
FROM   employees e
WHERE  e.department_id = 20
AND    (e.job = 'MANAGER' OR e.job = 'CLERK')
ORDER BY e.employee_id;

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