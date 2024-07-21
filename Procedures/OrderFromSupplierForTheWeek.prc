create or replace procedure OrderFromSupplierForTheWeek(supplierId number) is
 cursor s1(id number)is
  select sum (c_amount * ch_amount) as amount,pr_id  
  from orderr natural join chooseo natural join containing
  where o_date < SYSDATE and o_date > SYSDATE - INTERVAL '7' DAY
  group by pr_id;
  cnt number := 0;
  temp number;
  NotValidSupplierID exception;
  pragma exception_init (NotValidSupplierID, -1212);
begin
  select s_id into temp from supplier where s_id = supplierId;
  for p in s1(supplierId)
    loop
      insert into supply values(p.amount, SYSDATE, supplierId, p.pr_id);
      cnt := cnt + 1;
    end loop;
  dbms_output.put_line('An order has been sent to the supplier for:' || cnt ||' products');
  EXCEPTION
  when NO_DATA_FOUND then
    DBMS_OUTPUT.PUT_LINE('No orders found for this week.');
  if temp = 0 then
    raise NotValidSupplierID;
  end if;
end OrderFromSupplierForTheWeek; 
/
