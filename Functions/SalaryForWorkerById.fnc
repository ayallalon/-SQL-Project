create or replace function SalaryForWorkerById(workerId in number) return number is
  Result number;
  idNotWorker exception;
  pragma exception_init(idNotWorker , -1212);
  myWorker worker%rowtype;
  myKitchenworker kitchenworker%rowtype;
  myWaiter waiter%rowtype;
  numOfOrderr number;
  temp number;
  ----------------------------------------------------------------------------------------------------------
begin
 select count(*) into temp from worker where pwo_id = workerId;
  if temp = 1 then
      select* into myWorker from worker where pwo_id = workerId;
      select count(*) into temp  from waiter where pw_id = workerId;
               if  temp = 1 then
                   select*  into myWaiter from waiter where pw_id = workerId;
                   select count(*) into numOfOrderr
                   from orderr natural join waiter where pw_id = workerId
                   and o_date > to_date('01/01/2023', 'dd/mm/yyyy');
                   Result := myWorker.salary + myWaiter.seniority * 30 + numOfOrderr * 10;
      select count(*) into temp  from kitchenworker where pk_id = workerId;
               elsif temp = 1 then
                     select* into myKitchenworker from kitchenworker where pk_id = workerId;
                     select count(*) into numOfOrderr
                     from responsible natural join Kitchenworker natural join orderr where pk_id = workerId
                     and o_date > to_date('01/01/2023', 'dd/mm/yyyy');
                     if myKitchenworker.rank = 'A' then
                       Result := myWorker.salary + numOfOrderr * 30;
                     elsif  myKitchenworker.rank = 'B' then
                       Result := myWorker.salary + numOfOrderr * 20;
                     elsif  myKitchenworker.rank = 'C' then
                       Result := myWorker.salary + numOfOrderr * 10;
                       end if;
                end if;
      dbms_output.put_line('The salary of employee number: ' ||  workerId || ' for 2023 is ' || Result);
      return(Result);
  else
     raise idNotWorker
  end if;
end;
/
