select M_ID, M_NAME  from MENU NATURAL JOIN RESPONSIBLE
where M_PRICE <80
group by M_ID, M_NAME having count(*)<4
;
