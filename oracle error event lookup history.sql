select session_id,session_serial#,sql_id 
from dba_hist_active_sess_history
where event = 'db file sequential read' 
order by sample_time;



select distinct session_id,sql_id,sql_opname,program,module,action,machine 
from v$active_session_history 
where session_id in ('587','106', '625', '297', '95', '111', '279', '286' )
and event = 'db file sequential read'
and is_awr_sample = 'Y';


select distinct-- s.SAMPLE_TIME,
 --s.SESSION_ID,
sq.SQL_TEXT,
--sq.SQL_FULLTEXT,
sq.SQL_ID
from v$sql sq--, v$active_session_history s
where 1=1--s.SQL_ID = sq.SQL_ID
--and s.SESSION_ID in ('279')
and sq.SQL_ID = '16nkg8946azm7'
