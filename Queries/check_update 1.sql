select SALARY, PWO_ID from WORKER
where PWO_ID in ( select PK_ID FROM KITCHENWORKER NATURAL JOIN RESPONSIBLE
                  where Rank='A'
                  group by PK_ID having count(*)>3);
