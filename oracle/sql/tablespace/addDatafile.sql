 sqlplus / as sysdba
 --if use pdb
 ALTER SESSION SET CONTAINER = pdborcl;
 ALTER TABLESPACE <TABLESPACE> ADD DATAFILE '<DATAFILE>' SIZE 1G AUTOEXTEND ON; 