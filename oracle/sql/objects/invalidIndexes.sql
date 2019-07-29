select INDEX_NAME, STATUS from user_ind_partitions t where t.status not in ( 'USABLE' )
union all
select INDEX_NAME, STATUS from user_indexes where STATUS not in ( 'VALID', 'N/A' )