select P_NAME, c_phone from person join client on person.p_id = client.pc_id
where P_ID in (select PC_ID from orderr 
               where O_ID in (select O_ID from orderr natural join chooseo natural join menu
               group by O_ID 
               having sum(CH_AMOUNT * M_PRICE) >= (2000)));
