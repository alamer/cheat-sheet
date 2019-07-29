BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(ownname => '<OWNER NAME>', tabname => '<TABLE NAME>', estimate_percent => 100);
END;
