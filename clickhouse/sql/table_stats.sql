select parts.*,
       columns.compressed_size,
       columns.uncompressed_size,
       columns.ratio
from (
         select table,
                formatReadableSize(sum(data_uncompressed_bytes))          AS uncompressed_size,
                formatReadableSize(sum(data_compressed_bytes))            AS compressed_size,
                sum(data_compressed_bytes) / sum(data_uncompressed_bytes) AS ratio
         from system.columns
         where database = currentDatabase()
         group by table
         ) columns
         right join (
    select table,
           sum(rows)                                            as rows,
           max(modification_time)                               as latest_modification,
           formatReadableSize(sum(bytes))                       as disk_size,
           formatReadableSize(sum(primary_key_bytes_in_memory)) as primary_keys_size,
           any(engine)                                          as engine,
           sum(bytes)                                           as bytes_size
    from system.parts
    where active and database = currentDatabase()
    group by database, table
    ) parts on columns.table = parts.table