-- Verificar caminho do archive

set lines 200
col name format a40
select name
, floor(space_limit / 1024 / 1024) "Size MB"
, ceil(space_used / 1024 / 1024) "Used MB"
, SPACE_RECLAIMABLE
, NUMBER_OF_FILES
from v$recovery_file_dest
order by name;