create or replace function update_price_menu(id_product in number) return number is
  cursor s1(product_id number)
  is select* from  menu m natural join containing c where pr_id = product_id;

  productName product.p_name%type;
  extra menu.m_price%type;
  overall_update number default 0;
begin
  select p_name into productName from product where pr_id = id_product;
  for p in s1(id_product)
      loop
        extra:=p.m_price * 0.1;
        overall_update := overall_update + extra;
        update menu m set m.m_price = m.m_price + extra where p.pr_id = id_product;
        commit;
      end loop;
  dbms_output.put_line('the raise of prices in dishes that contained '|| productName ||' was at '|| overall_update||' shekels ');
  return(overall_update);
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No product found with ID ' || id_product);
    RETURN 0;
end update_price_menu;
/
