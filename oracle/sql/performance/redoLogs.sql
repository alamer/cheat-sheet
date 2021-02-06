-- show redo log files
SELECT * FROM V$LOGFILE;
-- show redo log groups
select * from v$log
-- add redo log group
ALTER DATABASE ADD LOGFILE GROUP 4 ('/u01/app/oracle/oradata/orcl/redo04a.log') SIZE 4096M;
-- drop redo log group
ALTER DATABASE drop logfile group 1;
-- force log switch
ALTER SYSTEM SWITCH LOGFILE;
-- force checkpoint
ALTER SYSTEM CHECKPOINT;
