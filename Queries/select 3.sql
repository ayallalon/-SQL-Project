select P_NAME from PERSON
where P_ID in ( select PK_ID from RESPONSIBLE
                NATURAL JOIN CHOOSEO NATURAL JOIN ORDERR NATURAL JOIN KITCHENWORKER
                where O_DATE =TO_DATE('24/04/2023','DD/MM/YYYY') and  RANK!='A')
order by P_NAME;
