select OWNER, OBJECT_NAME, SUBOBJECT_NAME, STATISTIC_NAME, VALUE, round( VALUE * 8192 / 1024 / 1024 / 1024, 1 ) GB
from v$segstat
left join DBA_OBJECTS on OBJ# = OBJECT_ID
where OWNER not in ( 'SYS', 'SYSTEM', 'DBSNMP', 'WMSYS', 'XDB', 'EXFSYS', 'MDSYS', 'OLAPSYS', 'SYSMAN' )
and STATISTIC_NAME='logical reads' /* or STATISTIC_NAME='physical reads' or STATISTIC_NAME='logical writes'*/
order by value desc
