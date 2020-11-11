# Oracle DB Cheatsheet

## Tablespace size management

- [Add datafile](sql/tablespace/addDatafile.sql)
- [Move/Rename datafile](sql/tablespace/moveDatafile.sql)
- [Table and index size](sql/tablespace/usedSpace.sql)
- [Table fragmentation (reclaim space report)](sql/tablespace/reclaimSpaceReport.sql)
- [Free space by tablespace](sql/tablespace/getFreeSpaceByTablespace.sql)
- [Shrink table](sql/tablespace/shrink.sql)
- [Move table/partition](sql/tablespace/move.sql)

## Indexes and index partitions

- [Rebuild index or index partition](sql/index/rebuildIndex.sql)
- [Rebuild all indexes and index partitions for table](sql/index/rebuildAllIndexesForTable.sql)
- [Coalesce index to reduce index fragmentation (not release space back)](sql/index/coalesceInde.sql)
- [Archive interval partitioned tables](sql/partitions/moveToArchiveTablespaceAndCompress.sql)
- [Drop interval partitioned table partitions by date](sql/partitions/dropIntervalPartitionsByDate.sql) 

## Invalid objects

- [Get invalid packages,functions and procedures and compile](sql/objects/invalidObjects.sql)
- [Get all invalid index and index partitions](sql/objects/invalidObjects.sql)
- [Refresh materialized view](sql/objects/refreshMaterializedView.sql)

## Statistic

- [Gather statistic](sql/statistic/gatherStatisticForTable.sql)

## Locks

- [Get locked objects](sql/locks/lockedObjects.sql)

## Performance

- [Oracle buffer cache content](sql/performance/bufferCacheContent.sql)
- [Logical and physical reads and writes by v$segstat view](sql/perfrmance/segStat.sql)
- [Check opened cursor count by sql_text](sql/performance/cursorCountBySql.sql)

## Database link

- [Create database link](sql/dblink/createDbLinkBySID.sql)

## Partition management

- [Move table partition](sql/partitions/movePartition.sql)

## Oracle Graphic tools

 ```bash
dbca - db create assistant
dbua - db upgrade assistant
netca - listener create assistant
netmgr - nmanaging tnsnames.ora
```

## Scheduler
- [Stop running job](sql/scheduler/stopRunningJob.sql)


## Clean audit files

```bash
    find /u01/app/oracle/admin/orcl/adump -type f -mtime +7 -name '*.aud' -exec rm -f {} \;
```