-- verifica backup

col OUTPUT_BYTES_DISPLAY for a30
col START_TIME for a18
col TIME_TAKEN_DISPLAY for a18
col END_TIME for a18
set lines 300
set pages 500

select session_key,
input_type,
status,
to_char(start_time,'yyyy-mm-dd hh24:mi') start_time,
to_char(end_time,'yyyy-mm-dd hh24:mi') end_time,
output_bytes_display,
time_taken_display
from v$rman_backup_job_details
order by session_key asc;