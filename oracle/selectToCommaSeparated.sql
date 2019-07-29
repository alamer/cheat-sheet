SELECT SUBSTR (SYS_CONNECT_BY_PATH (COLUMN_NAME , ','), 2) csv
      FROM (SELECT COLUMN_NAME , ROW_NUMBER () OVER (ORDER BY COLUMN_NAME ) rn,
                   COUNT (*) OVER () cnt
              FROM  TABLE_NAME)
     WHERE rn = cnt
START WITH rn = 1
CONNECT BY rn = PRIOR rn + 1;