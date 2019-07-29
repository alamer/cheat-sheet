select oc.sql_text, count(*) 
   from v$open_cursor oc 
   group by oc.sql_text 
   having count(*) > 10 
   order by count(*) desc;