select min(snap_id) minid, max(snap_id) maxid,
to_char(min(begin_interval_time),'yyyy-mm-dd hh24:mi:ss') mintime,
to_char(max(end_interval_time),'yyyy-mm-dd hh24:mi:ss') maxtime
from dba_hist_snapshot;

 select wait_class_id,wait_class, count(*) cnt
  from dba_hist_active_sess_history
  where snap_id between 38770 and 38975
  group by wait_class_id, wait_class
 order by 3;
 
select event_id, event, count(*) cnt 
from dba_hist_active_sess_history
where snap_id between 38770 and 38975
and wait_class_id=1740759767
group by event_id, event
order by 3;


select event_id, sql_id, count(*) cnt 
from dba_hist_active_sess_history   
where snap_id between 38770 and 38975
--and event_id in (2652584166)
and sql_id = '6nm1np1w8943z'
group by event_id, sql_id
having count(*)> 100
order by 2 desc;


 select owner,current_obj#,object_name,object_type,  count(*) cnt 
  from dba_hist_active_sess_history a, dba_objects b
   where snap_id between 38770 and 38975
  and event_id is null 
  and sql_id in ('6nm1np1w8943z')
  and a.current_obj#=b.object_id
  group by owner,current_obj#,object_name,object_type
  having count(*) > 10
  order by 5 desc;
  
  
  select current_file#,current_block#, count(*) cnt
  from dba_hist_active_sess_history
  where snap_id between 38770 and 38975
  and event_id is null
  and sql_id in ('6nm1np1w8943z')
  and current_obj# in (160629,160628,364852,267225,248020,100016,229238)
  group by current_file#, current_block#
  having count(*)>50
  order by 3;