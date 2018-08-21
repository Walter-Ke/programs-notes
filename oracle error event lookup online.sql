select event, sid, p1, p2, p3 
from v$session_wait 
where 1=1 and event = 'db file sequential read';

select event, row_wait_obj#, row_wait_file#, row_wait_block#, row_wait_row#
from v$session
where event = 'db file sequential read';

select object_name, object_id, owner, object_type
from   dba_objects
where  object_id in  ('160629', '267225');

select sid, serial#, username, status, osuser, machine, port, terminal, program, 
sql_id, sql_exec_start, prev_sql_id, type
from v$session 
where sid in  ('307', '649');

select sid, sql_text 
from v$session a, v$sql b
where sid in ('307','649')
and b.sql_id = a.sql_id;