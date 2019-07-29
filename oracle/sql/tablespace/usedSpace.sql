select s.table_name,stbl.bytes/1024/1024 as table_size_mb,index_name,sidx.bytes/1024/1024 as index_size_mb
from USER_INDEXES s
inner join user_segments stbl on stbl.SEGMENT_TYPE='TABLE' and stbl.segment_name=s.table_name
inner join user_segments sidx on sidx.SEGMENT_TYPE='INDEX' and sidx.segment_name=s.INDEX_NAME
order by stbl.bytes desc,s.table_name,sidx.bytes desc,index_name