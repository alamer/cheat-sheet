with t1 as (  select  
  o.owner          owner,  
   o.object_name    object_name,  
   o.subobject_name subobject_name,  
   o.object_type    object_type,  
   count(distinct file# || block#)         num_blocks  
from  
   dba_objects  o,  
   v$bh         bh  
where  
   o.data_object_id  = bh.objd  
and o.owner not in ('SYS','SYSTEM')  
and bh.status != 'free'  
group by o.owner, o.object_name, o.subobject_name, o.object_type  
order by count(distinct file# || block#) desc )  
 select  
   t1.owner                                          OWNER,  
   object_name                                       OBJECT_NAME,  
   case when object_type = 'TABLE PARTITION' then 'TAB PART'  
        when object_type = 'INDEX PARTITION' then 'IDX PART'  
        else object_type end OBJECT_TYPE,  
   sum(num_blocks)                                     BLOCKS_COUNT,  
   round((sum(num_blocks)/greatest(sum(blocks), .001))*100,1) PERCENT_OF_TOTAL_SIZE,  
   buffer_pool                                       buffer_pool,  
   sum(bytes)/sum(blocks)                            block_size,  
   round((sum(num_blocks) * (sum(bytes)/sum(blocks)) )/1024/1024,3) MB  
from t1, dba_segments s  
where s.segment_name = t1.object_name  
and s.owner = t1.owner  
and s.segment_type = t1.object_type  
and nvl(s.partition_name,'-') = nvl(t1.subobject_name,'-')  
group by t1.owner, object_name, object_type, buffer_pool  
having sum(num_blocks) > 100  
order by sum(num_blocks) desc