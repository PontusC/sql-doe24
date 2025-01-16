-- returns the percentage of late returns historically (i.e. return_date not null)
-- sums all late returns (value 1 since true) and divides by total rentals (count), then converts to % 
select sum(hours_rented > rental_duration*24) / count(*) * 100 as percentage_late_returns
    from (-- subquery that returns film_id and duration of rent (hours)
        select film_id, timestampdiff(hour, rental_date, return_date) as hours_rented
            from rental
            join inventory using (inventory_id)
            where return_date is not null) as rented_hours
    join film using (film_id);