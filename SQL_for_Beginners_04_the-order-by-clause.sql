-- https://oracle-base.com/articles/misc/sql-for-beginners-the-order-by-clause

-------------------------------------- Identify Columns : Expression, Position and Column Alias ------------------------------------------

SELECT e.salary, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary, e.commission;

SELECT e.salary, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary + NVL(e.commission,0);

SELECT e.salary, e.commission, e.employee_name, e.salary + NVL(e.commission,0) as combination
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary + NVL(e.commission,0);

SELECT e.salary, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY 1; -- Columns can be referenced by their column position.

SELECT e.salary AS sal, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY sal; -- Columns can also be referenced by their column alias.

-------------------------------------- Ascending (ASC) and Descending (DESC) Order ------------------------------------------

-- Ascending (ASC) by default.
SELECT e.salary AS sal, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary;

-- Explicitly setting ASC.
SELECT e.salary AS sal, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary ASC;

SELECT e.salary AS sal, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary DESC;

SELECT e.salary, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary ASC, e.commission DESC; -- Each column in the ORDER BY clause can have a different order.

-------------------------------------- Handling NULLs : NULLS FIRST and NULLS LAST ------------------------------------------

SELECT e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.commission ASC;

SELECT e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.commission ASC NULLS FIRST;

SELECT e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.commission DESC;

SELECT e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.commission DESC NULLS LAST;

SELECT e.salary, e.commission, e.employee_name
FROM   employees e
WHERE  department_id = 30
ORDER BY e.salary ASC NULLS FIRST, e.commission DESC NULLS LAST;

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