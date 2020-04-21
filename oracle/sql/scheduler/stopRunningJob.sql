SELECT * FROM USER_SCHEDULER_RUNNING_JOBS; 
begin 
   dbms_scheduler.stop_job(<job_name>,true); 
end;