-- Rebuild index
ALTER INDEX <INDEX TO REBUILD> 
    REBUILD TABLESPACE <TABLESPACE NAME> ONLINE;
-- Rebuild index partition
ALTER INDEX <INDEX TO REBUILD>
   REBUILD PARTITION  <PARTITION TO REBUILD>
   TABLESPACE <TABLESPACE NAME> PARALLEL (DEGREE <PARALLEL DEGREE>) ONLINE;
