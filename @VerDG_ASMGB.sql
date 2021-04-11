col Disk_Group_Name format a20
col Total_GB format a10
col Used_GB format a10
col Free_GB format a10


select name as "Disk_Group_Name"
, trunc(total_mb/1024)||'G' as Total_GB
, trunc((total_mb-free_mb)/1024)||'G' as Used_GB
, trunc(free_mb/1024)||'G' as Free_GB
, trunc((total_mb-free_mb)/total_mb*100)||'%' as "%_Used"
from v$asm_diskgroup_stat
--where name ='DW_ARCH'
order by name
/