declare
    l_sql_text varchar2( 128 );
begin
for i in ( select i.table_owner owner, s.SEGMENT_TYPE, s.SEGMENT_NAME, s.PARTITION_NAME, i.TABLE_NAME
            from user_segments s, user_indexes i
            where s.SEGMENT_TYPE in ( 'INDEX PARTITION', 'INDEX' ) and s.SEGMENT_NAME = i.index_name 
                and i.TABLE_NAME in ( '<TABLE NAME>' ) and i.table_owner = '<OWNER NAME>' )
loop
    l_sql_text := null;
    if i.SEGMENT_TYPE = 'INDEX PARTITION' then
        l_sql_text := 'alter index ' || i.OWNER || '.' || i.SEGMENT_NAME || ' rebuild partition ' || i.PARTITION_NAME || ' online';
    elsif i.SEGMENT_TYPE = 'INDEX' then
        l_sql_text := 'alter index ' || i.OWNER || '.' || i.SEGMENT_NAME || ' rebuild online';
    end if;
    if l_sql_text is not null then
        DBMS_OUTPUT.Put_Line( l_sql_text );
        execute immediate l_sql_text;
    end if;
end loop;
end;
