select M_NAME from MENU  
where M_ID in (select M_ID from CHOOSEO
               group by M_ID
               having sum(CH_AMOUNT)>= all(select sum(CH_AMOUNT) from CHOOSEO
                                     group by M_ID));
