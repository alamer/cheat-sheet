select TABLESPACE_NAME, round( sum( BYTES ) / 1024 / 1024 / 1024, 1 ) gb 
from user_free_space
group by TABLESPACE_NAME


select TABLESPACE_NAME,sum(bytes)/1024/1024/1024 as allocated_gb,sum(MAXBYTES)/1024/1024/1024 as total_gb,
     sum(MAXBYTES-bytes)/1024/1024/1024 as free_gb
from DBA_DATA_FILES
group by TABLESPACE_NAME