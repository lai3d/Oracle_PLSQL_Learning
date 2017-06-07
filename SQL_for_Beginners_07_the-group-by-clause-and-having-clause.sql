-- https://oracle-base.com/articles/misc/sql-for-beginners-the-group-by-clause-and-having-clause

-------------------------------------- GROUP BY Clause ------------------------------------------

SELECT COUNT(*) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   employees e;


SELECT e.department_id,
       COUNT(*) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   employees e
GROUP BY e.department_id
ORDER BY e.department_id;


SELECT e.department_id,
       e.job,
       COUNT(*) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   employees e
GROUP BY e.department_id, e.job  -- all non-aggregate columns must be included in the GROUP BY clause.
ORDER BY e.department_id, e.job;

-------------------------------------- Joins ------------------------------------------

SELECT d.department_name,
       COUNT(*) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   departments d
       JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

SELECT d.department_name,
       COUNT(*) AS employee_count, -- 
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

select d.department_name, e.employee_id
from departments d
      left outer join employees e on d.department_id = e.department_id
order by d.DEPARTMENT_NAME;

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count, --  NULL values are not counted
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

-------------------------------------- HAVING Clause ------------------------------------------

SELECT d.department_name, e.job,
       COUNT(e.employee_id) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name, e.job
ORDER BY d.department_name, e.job;


SELECT d.department_name, e.job,
       COUNT(e.employee_id) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name, e.job
HAVING COUNT(e.employee_id) > 1  -- You can think of it as a WHERE clause for the GROUP BY clause.
ORDER BY d.department_name, e.job;


SELECT COUNT(e.employee_id) AS employee_count,
       AVG(e.salary) AS avg_salary,
       SUM(e.salary) AS sum_salary
FROM   departments d
       LEFT OUTER JOIN employees e ON d.department_id = e.department_id
HAVING COUNT(e.employee_id) > 2  --  it is possible to have a HAVING clause without a GROUP BY clause
ORDER BY d.department_name, e.job;

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