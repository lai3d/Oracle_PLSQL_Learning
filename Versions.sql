SELECT * FROM v$version;

/*
Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production
PL/SQL Release 11.2.0.4.0 - Production
"CORE	11.2.0.4.0	Production"
TNS for Linux: Version 11.2.0.4.0 - Production
NLSRTL Version 11.2.0.4.0 - Production
*/


SELECT * FROM v$version
WHERE banner LIKE 'Oracle%'; -- Oracle Database 11g Enterprise Edition Release 11.2.0.4.0 - 64bit Production

