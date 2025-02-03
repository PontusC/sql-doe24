-- Day 7
-- One item with multiple colors, bought same day and hour
-- Purchased by Sherri Long (id 4167)
-- Runnig query to see all items ordered by Sherri color of items is indicated by '(<color>)' in desc

select name, phone, desc
from customers
    join orders using (customerid)
    join orders_items using (orderid)
    join products using (sku)
where strftime('%Y%m%d%H', ordered) in (
    select strftime('%Y%m%d%H', ordered) -- Times Sherri ordered down to hour precision
    from customers
        join orders using (customerid)
        join orders_items using (orderid)
        join products using (sku)
    where customerid = 4167 and desc like '%(%)%') 

and rtrim(substr(desc, 0, instr(desc, '('))) in ( -- Stringmatching article bought without color
    select rtrim(substr(desc, 0, instr(desc, '('))) no_color -- Items Sherri ordered with color removed
    from customers
        join orders using (customerid)
        join orders_items using (orderid)
        join products using (sku)
    where customerid = 4167 and desc like '%(%)%')
and not customerid = 4167;