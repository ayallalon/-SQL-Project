create or replace procedure ClientInfo(ClientID in number) is
cursor clientCR is
 select pw_id waiterId, o_id, o_date, pay from ((select o_id,  sum(m_price * ch_amount) pay
 from orderr natural join chooseo natural join menu
 where pc_id = ClientID
 group by o_id)
 natural join orderr);



 avgOfOrderr  number := 0;
 numOrderrThis number ;
 x number;
 y number;
 temp clientCR%rowtype;

begin
  select count(*) into numOrderrThis from orderr where pc_id = ClientID;
  dbms_output.put_line('information about orders for this client');
  dbms_output.put_line('number of orderr that our client with id ' || ClientID || ' is: ' || numOrderrThis);
  select count(*) into x from orderr;
  select count(*) into y from client;
  avgOfOrderr := x/y;
  if numOrderrThis > avgOfOrderr then
     dbms_output.put_line('This client orders more than average');
  elsif numOrderrThis < avgOfOrderr then
     dbms_output.put_line('This client orders less than average');
  elsif numOrderrThis = avgOfOrderr then
     dbms_output.put_line('This client orders equal the average');
  end if;
 open clientCR;
 loop 
   fetch clientCR into temp;
   exit when clientCR%notfound;
    dbms_output.put_line('orderrId: ' || temp.o_id ||', date: ' || to_date(temp.o_date, 'dd/mm/yyyy') || ', payment: ' || temp.pay ||', waiter: '|| temp.waiterId);
 end loop;
 close clientCR;
end;
/