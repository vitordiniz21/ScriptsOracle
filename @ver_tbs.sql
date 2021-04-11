-- rodar o comando abaixo, pegar a saida e setar o pdb
set lines 800
set pages 1000
col con_id for 99
col guid for a35
col name for a15
col open_time for a20
col Alter_Session for a50
col Space_GB for 99999,999
SELECT CON_ID,NAME,GUID,TOTAL_SIZE/1024/1024/1024 as Space_GB, open_mode,TO_CHAR(OPEN_TIME, 'DD-MM-YYYY HH24:MI:SS') as OPEN_TIME, 'alter session set container = '||NAME||' ;' as "Alter_Session"
FROM   v$pdbs
ORDER BY con_id,name;
-- selecionar o con_id referente ao pdb, e alterar na query abaixo
SELECT CON_ID,FILE_NAME FROM CDB_DATA_FILES WHERE CON_ID=3; 
SELECT CON_ID,FILE_NAME FROM CDB_DATA_FILES WHERE CON_ID=3;
select name , status from V$datafile where con_id =3 ;
-- achar a tbs reclamada
+DATA/CDBTIM01/24D27768CD75754DE053CB1AC00AEC96/DATAFILE/users_data.277.896107055
-- convertendo o tamanho da tbs para mbs
SELECT CON_ID,FILE_NAME, bytes/1024/1024  FROM CDB_DATA_FILES WHERE CON_ID=3;
-- realizar o rizese caso a tbs for menor que 32G
ALTER PLUGGABLE DATABASE DATAFILE '+DATA/CDBTIM01/24D27768CD75754DE053CB1AC00AEC96/DATAFILE/users_data.277.896107055' resize 5G;