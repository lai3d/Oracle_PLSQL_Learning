CURSOR emp_cursor IS
  SELECT l.state_province, l.country_id, d.department_name, e.last_name,
         j.job_title, e.salary, e.commission_pct
  FROM locations l, departments d, employees e, jobs j
  WHERE l.location_id = d.location_id
  AND d.department_id = e.department_id
  AND e.job_id = j.job_id;
  emp_record emp_cursor%ROWTYPE;
  TYPE emp_tab_type IS TABLE OF emp_cursor%ROWTYPE INDEX BY BINARY_INTEGER;
  emp_tab emp_tab_type;
i NUMBER := 1;
BEGIN
  OPEN emp_cursor;
  FETCH emp_cursor INTO emp_record;
  emp_tab(i) := emp_record;
  WHILE ((emp_cursor%FOUND) AND (i <= pMaxRows) LOOP
     i := i + 1;
     FETCH emp_cursor INTO emp_record;
     emp_tab(i) := emp_record;
  END LOOP;
  CLOSE emp_cursor;
  FOR j IN REVERSE 1..i LOOP
     DBMS_OUTPUT.PUT_LINE(emp_tab(j).last_name);
  END LOOP;
END; 