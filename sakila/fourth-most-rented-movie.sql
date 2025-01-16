-- Shows most rented movie
select title, times_rented
    from ( -- subquery for most rented movie using inventory and rental
        select film_id, count(*) times_rented
            from inventory
            join rental using (inventory_id)
            group by film_id) as rented_movies
    join film using (film_id)
    order by times_rented desc
    limit 3,1; -- starting from from index 3, take 1 result i.e. 4th row