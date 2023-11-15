update worker
set salary = salary * 1.05
where  PWO_ID in ( select PK_ID FROM KITCHENWORKER NATURAL JOIN RESPONSIBLE
                  where Rank='A'
                  group by PK_ID having count(*)>3);
