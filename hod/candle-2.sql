-- Day 2
-- Doesnt give 1 precise answer but returns a couple, only correct answer has multiple sku's (maybe 3)
-- and  at least coffe and a bagel
select name, phone, group_concat(sku) sku
from ( -- gets all names with matching initials, phone number and the sku's of what they ordered
    select name, phone, sku
    from customers 
    join orders using (customerid)
    join orders_items using (orderid)
    where name like 'J% P%') as pos_custs
join ( -- gets all skus of coffee or bagels
    select sku
    from products
    where desc like '%Coffee%' or desc like '%Bagel%') as prods using (sku)
group by name;