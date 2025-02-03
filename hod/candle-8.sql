-- Day 8
-- Sister of Carlos Myers (last name maybe?)
-- Sold to collector who owns all noah's collectibles
-- Most items with noah in desc have SKU prefix COL

select *, max (items)
from (
    select name, phone, count(*) items
    from customers
        join orders using (customerid)
        join orders_items using (orderid)
        join products using (sku)
    where products.sku like 'COL%'
    group by name
    order by items desc);