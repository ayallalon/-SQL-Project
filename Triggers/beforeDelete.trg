create or replace trigger beforeDelete
  before delete on person  
  for each row
declare
 
begin
   delete from distribution where v_id = :old.p_id;
   delete from volunteers where v_id = :old.p_id;
   delete from responsible where pk_id = :old.p_id;
   delete from chooseo where o_id in (select o_id from orderr where pw_id = :old.p_id or pc_id = :old.p_id ) ;
   delete from orderr where pw_id = :old.p_id or pc_id = :old.p_id  ;
   delete from client where pc_id = :old.p_id ;
   delete from waiter where pw_id = :old.p_id ;
   delete from kitchenworker where pk_id = :old.p_id ;
   delete from worker where pwo_id = :old.p_id ;
   dbms_output.put_line('This Pid: ' || :old.p_id || ' Removed from all the tables he was in');
end beforeDelete;
/
