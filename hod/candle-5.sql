-- Day 5
-- Person with a lot of cats
-- Old cats, there is senior cat food in products
-- Lives at staten island

select name, phone, max(purchased_cat_food) purchased_cat_food
from(
    select name, phone, sum(orders_items.qty) purchased_cat_food
    from customers
        join orders using (customerid)
        join orders_items using (orderid)
        join products using (sku)
    where products.desc like '%Senior Cat Food%' and
        customers.citystatezip like '%Staten Island%'
    group by name
    order by purchased_cat_food
);
