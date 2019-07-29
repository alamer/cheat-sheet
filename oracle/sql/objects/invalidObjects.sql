select
'ALTER ' || OBJECT_TYPE || ' ' ||
OWNER || '.' || OBJECT_NAME || ' COMPILE;'
from
dba_objects
where
status = 'INVALID'
and
object_type in ('PACKAGE','FUNCTION','PROCEDURE') 