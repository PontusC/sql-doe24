-- Day 4
-- Person who orders pastries (SKU starts with BKY, bakery?)
-- orders early in the morning, before 5
select name, phone, max(times_ordered) times_ordered
from (
    select name, phone, count(*) times_ordered
    from customers
        join orders using (customerid)
        join orders_items using (orderid)
        join products using (sku)
    where
        products.sku like 'BKY%' and
        -- Below didnt work without casting as int, why?
        cast (strftime('%H', orders.ordered) as int) between 0 and 5
    group by
        name
);