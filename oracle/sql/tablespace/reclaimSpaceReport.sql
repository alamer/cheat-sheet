with stat as (select table_name,round((blocks*8),2) as Fragmented_size
, round((num_rows*avg_row_len/1024),2) as Actual_size
, round((blocks*8),2)-round((num_rows*avg_row_len/1024),2) reclaim_size,
((round((blocks*8),2)-round((num_rows*avg_row_len/1024),2))/round((blocks*8),2))*100 -10 as reclaimable_space,LAST_ANALYZED from user_tables 
where blocks>0
),
tablesize_report as  (
select segment_name,segment_type,bytes/1024/1024 MB
 from user_segments
 where segment_type='TABLE'),
report as (
select stat.table_name
,mb as size_mb
,stat.fragmented_size/1024 as fragmented_mb
,stat.actual_size/1024 as actual_size_mb
,stat.reclaim_size/1024 as reclaim_size_mb
,stat.LAST_ANALYZED
from stat
inner join tablesize_report r on r.segment_name=stat.table_name
)
select * from report order by size_mb desc,reclaim_size_mb desc