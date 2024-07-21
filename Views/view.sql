
--view 1
create view moneyClient (client_id, money) as select  pc_id, sum(CH_AMOUNT * M_PRICE) 
from orderr natural join menu natural join chooseo
Group by pc_id;

select*
from moneyClient;

--select 1
select pc_id client_id ,money/cnt avg 
from moneyClient natural join (seect pc_id , count(*) cnt from orderr group by pc_id);

--select 2
select p_id, p_name
from person  
where p_id in(select client_id from moneyClient where money > 1500 and client_id in(select pc_id from orderr group by pc_id having count(*)< 3));

--update 
update moneyClient
set money  = money - 100
where client_id in (select pc_id from orderr where o_date = to_date('03/02/2023', 'dd/mm/yyyy'));

--delete
delete moneyClient
where money =  1101;


--view 2
create view viewVolunteer as select * from volunteers
where a_id != 1;

select*
from viewVolunteer;

--select 1
select l_name , v_id
from volunteers
where v_id in(select v_id from viewVolunteer) and v_id in (select v_id from distribution group by v_id having count(*) = 1 );

--select 2
select l_name , v_id
from volunteers
where v_id in(select v_id from viewVolunteer) and v_id in(select v_id from distribution where date_of_distribution = to_date('26/01/2023', 'dd/mm/yyyy'))
                                               or v_id in(select v_id from distribution where date_of_distribution = to_date('20/01/2023', 'dd/mm/yyyy')) ;


--update
update viewVolunteer
set a_id = 13
where v_id in (select v_id from distribution group by v_id having count(*) = 1 )

select v_id, a_id 
from volunteers
where v_id in(select v_id from viewVolunteer) and v_id in (select v_id from distribution group by v_id having count(*) = 1 );

--delete 
delete viewVolunteer
where v_id not in (select v_id from distribution where date_of_distribution > to_date('01/01/2023', 'dd/mm/yyyy'));


select v_id 
from volunteers 
where v_id not in (select v_id from distribution where date_of_distribution > to_date('01/01/2023', 'dd/mm/yyyy')) and a_id != 1 ;

--drop view
drop view viewVolunteer;
drop view moneyClient;
