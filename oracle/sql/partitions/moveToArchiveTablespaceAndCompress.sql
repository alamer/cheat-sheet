---
SET SERVEROUTPUT ON 
declare
l_partition_high_value_dt date;
p_table_name VARCHAR2(50);
l_sql_stmt VARCHAR2(1024);
begin
    p_table_name:='***';
    for i in ( SELECT PARTITION_NAME, HIGH_VALUE FROM user_tab_partitions WHERE TABLE_NAME = upper( p_table_name ) and tablespace_name='USERS' ORDER BY PARTITION_POSITION)
    loop    
        execute immediate 'select ' || i.HIGH_VALUE || ' from dual' into l_partition_high_value_dt;
        if (l_partition_high_value_dt<sysdate-30) then
            l_sql_stmt := 'alter table ' || p_table_name || ' move partition ' || i.PARTITION_NAME || ' TABLESPACE ARCHIVE COMPRESS UPDATE INDEXES';
            dbms_output.put_line( l_sql_stmt );
            execute immediate l_sql_stmt;
        end if;
    end loop;
end;     