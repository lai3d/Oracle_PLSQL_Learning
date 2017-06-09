-- https://stackoverflow.com/questions/205736/get-list-of-all-tables-in-oracle?rq=1

/*
There exists 3 datadictinary for this

DBA_TABLES describes all relational tables in the database.
*/

SELECT owner, table_name
  FROM dba_tables;
  
/*
Description of relational tables accessible to the user
*/

SELECT owner, table_name
  FROM all_tables;
  
/*  
USER_TABLES describes the relational tables owned by the current user. This view does not display the OWNER column.
*/

SELECT table_name
  FROM user_tables;

--------------------------------------------------------------------------------
select owner, table_name
FROM all_tables
group by owner, table_name
order by owner;

select count(table_name)
from user_tables; -- 835! Oh! Quite a lot!



