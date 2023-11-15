update containing
set c_amount = c_amount * 0.5
where m_id in (select m_id from containing natural join product 
               where p_name = 'Sugar' )and m_id not in( select m_id from containing natural join product 
                                                       where p_name = 'Salt' ) and pr_id in(select pr_id from product
                                                                                             where p_name='Sugar');
