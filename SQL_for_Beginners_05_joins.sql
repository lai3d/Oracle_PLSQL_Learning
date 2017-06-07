-- https://oracle-base.com/articles/misc/sql-for-beginners-joins

/*

Some join methods are more popular than others, so initially focus your attention on those you are most likely to see. The most common joins you are likely to see in code are the following.

[INNER] JOIN ... ON
LEFT [OUTER] JOIN
RIGHT [OUTER] JOIN

The following are less common.

FULL [OUTER] JOIN
CROSS JOIN
NATURAL JOIN
[INNER] JOIN ... USING

The following are very rare at this point.

CROSS APPLY
OUTER APPLY

*/

-------------------------------------- [INNER] JOIN ... ON ------------------------------------------

-- ANSI

SELECT d.department_name,
       e.employee_name
FROM   departments d
       JOIN employees e ON d.department_id = e.department_id
WHERE  d.department_id >= 30
ORDER BY d.department_name;

-- non-ANSI

SELECT d.department_name,
       e.employee_name
FROM   departments d, employees e
WHERE  d.department_id = e.department_id
AND    d.department_id >= 30
ORDER BY d.department_name;

-------------------------------------- LEFT [OUTER] JOIN ------------------------------------------
-- ANSI
SELECT d.department_name,
       e.employee_name     
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id
WHERE  d.department_id >= 30
ORDER BY d.department_name, e.employee_name;

-- non-ANSI
SELECT d.department_name,
       e.employee_name      
FROM   departments d, employees e
WHERE  d.department_id = e.department_id (+) -- Notice the "(+)" is used to indicate the side of the join condition that may be missing
AND    d.department_id >= 30
ORDER BY d.department_name, e.employee_name;

-- ANSI
SELECT d.department_name,
       e.employee_name     
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id AND e.salary >= 2000
WHERE  d.department_id >= 30
ORDER BY d.department_name, e.employee_name;

-- non-ANSI
SELECT d.department_name,
       e.employee_name      
FROM   departments d, employees e
WHERE  d.department_id = e.department_id (+)
AND    e.salary (+) >= 2000 --  the "(+)" is used to indicate a column may have a NULL value as a result of an outer join.
AND    d.department_id >= 30
ORDER BY d.department_name, e.employee_name;


-------------------------------------- RIGHT [OUTER] JOIN ------------------------------------------

SELECT d.department_name,
       e.employee_name     
FROM   employees e
       RIGHT OUTER JOIN departments d ON e.department_id = d.department_id
WHERE  d.department_id >= 30
ORDER BY d.department_name, e.employee_name;

-------------------------------------- FULL [OUTER] JOIN ------------------------------------------

INSERT INTO employees VALUES (8888,'JONES','DBA',null,to_date('02-1-1982','dd-mm-yyyy'),1300,NULL,NULL);
COMMIT;

SELECT d.department_name,
       e.employee_name     
FROM   employees e
       FULL OUTER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, e.employee_name;

-- There is no direct equivalent of a full outer join using the non-ANSI join syntax, but we can recreate it by combining two outer join queries using a UNION ALL, as shown below.

SELECT d.department_name,
       e.employee_name      
FROM   employees e, departments d
WHERE  e.department_id = d.department_id (+)
UNION ALL
SELECT d.department_name,
       e.employee_name      
FROM   departments d, employees e
WHERE  d.department_id = e.department_id (+)
AND    e.employee_name IS NULL
ORDER BY 1, 2;

DELETE FROM employees WHERE employee_id = 8888;
COMMIT;

-------------------------------------- CROSS JOIN ------------------------------------------
-- A CROSS JOIN is the deliberate creation of a Cartesian product. There are no join columns specified, so every possible combination of rows between the two tables is produced.

-- ANSI 
SELECT e.employee_name,
       d.department_name
FROM   employees e
       CROSS JOIN departments d
ORDER BY e.employee_name, d.department_name;

-- non-ANSI
SELECT e.employee_name,
       d.department_name
FROM   employees e, departments d
ORDER BY e.employee_name, d.department_name;


-------------------------------------- NATURAL JOIN ------------------------------------------
-- A NATURAL JOIN is a variant on an INNER JOIN. The join columns are determined implicitly, based on the column names. Any columns that share the same name between the two tables are assumed to be join columns. 
-- ANSI
SELECT e.employee_name,
       d.department_name
FROM   employees e
       NATURAL JOIN departments d
ORDER BY e.employee_name, d.department_name;

-- compare with inner join, the same output

SELECT e.employee_name,
       d.department_name
FROM   employees e
       inner JOIN departments d on d.department_id = e.department_id
ORDER BY e.employee_name, d.department_name;       

/*
Using a NATURAL JOIN is a bad idea for a couple of reasons. First, 
if someone adds a new column to one of the tables that happens to have the same name as a column in the other table, 
they may break any existing natural joins. 
It is effectively a bug waiting to happen. 
Second, you can't apply any filters to columns used in natural joins, as shown in the following example.
*/

SELECT e.employee_name,
       d.department_name
FROM   employees e
       NATURAL JOIN departments d
WHERE  d.department_id = 20
ORDER BY e.employee_name;

/*

ORA-25155: column used in NATURAL join cannot have qualifier
25155. 00000 -  "column used in NATURAL join cannot have qualifier"
*Cause:    Columns that are used for a named-join (either a NATURAL join
           or a join with a USING clause) cannot have an explicit qualifier.
*Action:   Remove the qualifier.
Error at Line: 156 Column: 8

*/



-------------------------------------- [INNER] JOIN ... USING ------------------------------------------
-- The INNER JOIN ... USING is almost a half-way house between a conventional INNER JOIN and a NATURAL JOIN. 
-- The join is made using columns with matching names in each table, but you have to specify the columns to be used, 
-- not the whole condition. This allows you to join on a subset of the columns common to both tables.

SELECT e.employee_name,
       d.department_name
FROM   employees e
       JOIN departments d USING (department_id)
ORDER BY e.employee_name;



SELECT e.employee_name,
       d.department_name
FROM   employees e
       JOIN departments d USING (department_id)
WHERE  d.department_id = 20
ORDER BY e.employee_name;

/*
ORA-25154: column part of USING clause cannot have qualifier
25154. 00000 -  "column part of USING clause cannot have qualifier"
*Cause:    Columns that are used for a named-join (either a NATURAL join
           or a join with a USING clause) cannot have an explicit qualifier.
*Action:   Remove the qualifier.
Error at Line: 194 Column: 8
*/



--------------------------- The CROSS APPLY and OUTER APPLY joins are available in Oracle, but they have only been supported for use in your application code from Oracle 12c onward

-------------------------------------- CROSS APPLY  ------------------------------------------


-------------------------------------- OUTER APPLY ------------------------------------------


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