select TABLESPACE_NAME, round( sum( BYTES ) / 1024 / 1024 / 1024, 1 ) gb 
from user_free_space
group by TABLESPACE_NAME