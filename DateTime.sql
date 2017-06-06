-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
select to_char(sysdate, 'hh24:mi:ss') from dual;
-- Result: '12:58:58'
-- '12:59:33'
-------------------------------------------------------
select to_number(to_char(sysdate, 'hh24miss')) from dual;
--Result: 105922
-------------------------------------------------------
-- https://www.techonthenet.com/oracle/functions/to_char.php

select to_char(sysdate,'hh24miss') from dual;
--Result: '110024'
-- '112954'

-- HH24	Hour of day (0-23).
-- MI	Minute (0-59).
-- SS	Second (0-59).

select to_char(sysdate,'D') from dual;
--Result: '2'

select to_char(sysdate,'DAY') from dual;
--Result: 'MONDAY'

select to_char(sysdate,'DD') from dual;
--Result: '29'

select to_char(sysdate,'DDD') from dual;
--Result: '149'

select to_char(sysdate,'DY') from dual;
--Result: 'MON'

-- D	Day of week (1-7).
-- DAY	Name of day.
-- DD	Day of month (1-31).
-- DDD	Day of year (1-366).
-- DY	Abbreviated name of day.
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
select mod(to_number(trunc(sysdate) - trunc(sysdate - 14)), 7) from dual; 
--Result: 0
-------------------------------------------------------
-- https://www.techonthenet.com/oracle/functions/trunc_date.php

select trunc(sysdate) from dual;
--Result: 29-MAY-17
-------------------------------------------------------
select (trunc(sysdate) - trunc(sysdate - 14))  from dual;
--Result: 14
-------------------------------------------------------
select to_number(trunc(sysdate) - trunc(sysdate - 14))  from dual;
--Result: 14
-------------------------------------------------------
-- https://www.techonthenet.com/oracle/functions/mod.php

select mod(14, 7)  from dual; -- remainder of 14 divided by 7
--Result: 0

select mod(13, 7)  from dual;
--Result: 6

select mod(1, 7)  from dual;
--Result: 1

select mod(7, 7)  from dual;
--Result: 0

select mod(3, 2)  from dual;
--Result: 1
-------------------------------------------------------
select MOD(15, 4)  from dual;
--Result: 3

select MOD(15, 0)  from dual; -- The MOD function returns m if n is 0.
--Result: 15

select MOD(11.6, 2)  from dual;
--Result: 1.6

select MOD(11.6, 2.1)  from dual; -- 11.6 - 2.1 * 5 = 11.6 - 10.5 = 1.1
--Result: 1.1

select MOD(-15, 4)  from dual;
--Result: -3

select MOD(-15, 0)  from dual; -- The MOD function returns m if n is 0.
--Result: -15
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-- https://www.techonthenet.com/oracle/functions/to_number.php

select TO_NUMBER('1210.73') from dual;
--Result: 1210.73
-------------------------------------------------------
select TO_NUMBER('1210.73', '9999.99') from dual;
--Result: 1210.73

select TO_NUMBER('1210.7', '9999.9') from dual;
--Result: 1210.7

select TO_NUMBER('546', '999') from dual;
--Result: 546

select TO_NUMBER('23', '99') from dual;
--Result: 23
-------------------------------------------------------
select TRUNC(TO_DATE('22-AUG-03'), 'YEAR') from dual;
--Result: '01-JAN-03'

select TRUNC(TO_DATE('22-AUG-03'), 'Q') from dual;
--Result: '01-JUL-03'

select TRUNC(TO_DATE('22-AUG-03'), 'MONTH') from dual;
--Result: '01-AUG-03'

select TRUNC(TO_DATE('22-AUG-03'), 'DDD') from dual;
--Result: '22-AUG-03'

select TRUNC(TO_DATE('22-AUG-03'), 'DAY') from dual;
--Result: '17-AUG-03'
------------------------------------------------------
-- https://www.techonthenet.com/oracle/functions/to_char.php

select TO_CHAR(1210.73, '9999.9') from dual;
--Result: '1210.7'

select TO_CHAR(-1210.73, '9999.9') from dual;
--Result: '-1210.7'

select TO_CHAR(1210.73, '9,999.99') from dual;
--Result: '1,210.73'

select TO_CHAR(1210.73, '$9,999.00') from dual;
--Result: '$1,210.73'

select TO_CHAR(21, '000099') from dual;
--Result: '000021'
------------------------------------------------------
select TO_CHAR(sysdate, 'yyyy/mm/dd') from dual;
--Result: '2003/07/09'
--Result: '2017/05/29'

select TO_CHAR(sysdate, 'Month DD, YYYY') from dual;
--Result: 'July 09, 2003'
--Result: 'May       29, 2017'

select TO_CHAR(sysdate, 'FMMonth DD, YYYY') from dual;
--Result: 'July 9, 2003'
--Result: 'May 29, 2017'

select TO_CHAR(sysdate, 'MON DDth, YYYY') from dual;
--Result: 'JUL 09TH, 2003'
--Result: 'MAY 29TH, 2017'

select TO_CHAR(sysdate, 'FMMON DDth, YYYY') from dual;
--Result: 'JUL 9TH, 2003'
--Result: 'MAY 29TH, 2017'

select TO_CHAR(sysdate, 'FMMon ddth, YYYY') from dual;
--Result: 'Jul 9th, 2003'
--Result: 'MAY 29TH, 2017'
------------------------------------------------------
-- https://oracle-base.com/articles/misc/oracle-dates-timestamps-and-intervals

ALTER SESSION SET nls_date_format = 'DD-MON-YYYY HH24:MI:SS';

SELECT SYSDATE 
FROM   dual;

SELECT CURRENT_DATE 
FROM   dual;

SELECT SYSDATE, 
       ADD_MONTHS(SYSDATE, 2) 
FROM   dual;

SELECT SYSDATE, 
       LAST_DAY(SYSDATE) 
FROM   dual;

SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE+30) 
FROM   dual;

SELECT SYSDATE, 
       NEXT_DAY(SYSDATE, 'MONDAY') 
FROM   dual;

SELECT SYSDATE, 
       NEW_TIME(SYSDATE, 'GMT', 'EST') 
FROM   dual;

SELECT TO_DATE('10/07/2004 13:31:45', 'DD/MM/YYYY HH24:MI:SS') 
FROM   dual;

SELECT SYSDATE, 
       ROUND(SYSDATE, 'HH24') 
FROM   dual;

SELECT SYSDATE,                -- 06-JUN-2017 14:23:21
       TRUNC(SYSDATE, 'HH24')  -- 06-JUN-2017 14:00:00
FROM   dual;
----------------------- TimeStamp -------------------------------

ALTER SESSION SET nls_timestamp_tz_format = 'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM';

DROP TABLE timestamp_test;

CREATE TABLE timestamp_test AS
SELECT SYSTIMESTAMP AS now
FROM   dual;

SELECT now,
       DUMP(now)
FROM   timestamp_test;

SELECT SYSTIMESTAMP(3)      -- 06-JUN-2017 15:03:37.557000000 +08:00
FROM   dual;

SELECT CURRENT_TIMESTAMP(3) -- 06-JUN-2017 15:02:05.967000000 +08:00
FROM   dual;

SELECT LOCALTIMESTAMP(3)    -- 06-JUN-17 03.02.22.113000000 PM
FROM   dual;

SELECT TO_TIMESTAMP('10/07/2004', 'DD/MM/YYYY')    -- 10-JUL-04 12.00.00.000000000 AM
FROM   dual;

SELECT TO_TIMESTAMP_TZ('10/07/2004', 'DD/MM/YYYY') -- 10-JUL-2004 00:00:00.000000000 +08:00
FROM   dual;

SELECT FROM_TZ(LOCALTIMESTAMP, '3:00') -- 06-JUN-2017 15:05:30.976617000 +03:00
FROM   dual;

SELECT DBTIMEZONE  -- +00:00
FROM   dual;

SELECT SESSIONTIMEZONE  -- Asia/Singapore
FROM dual;

SELECT SYS_EXTRACT_UTC(SYSTIMESTAMP)  -- 06-JUN-17 07.07.36.290575000 AM
FROM dual;



-------------------------  Interval  -----------------------------

SELECT INTERVAL '20' MONTH
FROM   dual;

SELECT INTERVAL '1' YEAR - INTERVAL '1' MONTH
FROM dual;

SELECT INTERVAL '2 3:04:11.333' DAY TO SECOND
FROM   dual;

SELECT INTERVAL '1' DAY - INTERVAL '1' SECOND
FROM dual;

SELECT SYSDATE,
       SYSDATE + INTERVAL '1' MONTH + INTERVAL '1' DAY - INTERVAL '3' SECOND
FROM   dual;

------ Interval functions -------

SELECT NumToYMInterval(2, 'MONTH') 
FROM   dual;

SELECT NumToDSInterval(2, 'HOUR') 
FROM   dual;

SELECT TO_YMInterval('3-10') 
FROM   dual;

SELECT TO_DSInterval('2 10:3:45.123') 
FROM   dual;

SELECT EXTRACT(HOUR FROM NumToDSInterval(2, 'HOUR')) -- 2
FROM   dual;



------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------