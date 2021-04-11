col "File Name" format a80
col "Size (MB)" format 999999999
col "Table Space" format a25
select tablespace_name "Table Space" ,      'ALTER DATABASE DATAFILE '||chr(39)||file_name||chr(39)||' resize '  "File Name" ,      bytes/1024/1024 "Size (MB)" ,      status          "Status" , AUTOEXTENSIBLE from   dba_data_files where  tablespace_name like upper('&Tablespace') order  by tablespace_name ,      file_id;