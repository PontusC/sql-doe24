-- Day 6
-- Person with wood floor? didnt exist
-- uses coupon, no info about that in db
-- person with lowest possible profit margin?

select name, phone, min(total_margin)
from(
    select name, phone, sum(margin) total_margin
    from customers
    join
        orders using (customerid)
        join (
            select orderid, (qty * (unit_price - wholesale_cost)) margin
            from orders_items
                join products using (sku)) using (orderid)
    group by name
    order by total_margin asc
);