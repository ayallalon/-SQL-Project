create or replace trigger newResponsible
  before insert on responsible  
  for each row
declare
 minA number:= 120;
 minB number := 70;
 minC number := 50;
 temp number;
 workerA number;
 workerB number;
 workerC number;
begin
  select sum(m_price) into temp  from menu where m_id = :new.m_id ;
  select count(*) into workerA from kitchenworker where pk_id = :new.pk_id and  rank = 'A';
  select count(*) into workerB from kitchenworker where pk_id = :new.pk_id and  rank = 'B';
  select count(*) into workerC from kitchenworker where pk_id = :new.pk_id and  rank = 'C';
  if workerA = 1 then
    if (temp < minA)then
      update menu set m_price = minA where m_id = :new.m_id;
    end if;
  elsif workerB = 1 then
    if (temp < minB) then
      update menu set m_price = minB where m_id = :new.m_id;
    end if;
  elsif workerC = 1 then
    if temp < minC then 
      update menu set m_price = minC where m_id = :new.m_id;
    end if;
  end if;
end newResponsible;
/
