
delete from chooseo
where o_id in (select o_id from orderr where o_date < TO_DATE('01/01/2023','DD/MM/YYYY'));
