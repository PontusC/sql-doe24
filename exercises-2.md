# Exercises-2
1. Show a list of film genres. For each genre show a list of titles of movies belonging to that genre.
```sql
-- Lists all titles based on genre
select genre, group_concat(title)
    from ( -- Subquery to get a list of matching film_ids and their genres
        select fCat.film_id, cat.name genre
            from film_category fCat
            join category cat using (category_id)) as genres
    join film using (film_id)
    group by genre;
```
2. What's the title of the most rented movie? How many times has it been rented?
```sql
-- Shows most rented movie
select title, times_rented
    from ( -- subquery for most rented movie using inventory and rental
        select film_id, count(*) times_rented
            from inventory
            join rental using (inventory_id)
            group by film_id) as rented_movies
    join film using (film_id)
    order by times_rented desc
    limit 1;
```
3. What's the title of the 4th most rented movie? How many times has it been rented?
```sql
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
```
4. Have all rentals been paid?
```sql
-- Returns true if outstanding payments
select count(*) < 1 rentals_paid
    from rental
    left join payment on payment.rental_id = rental.rental_id
    -- Returns a set containing ALL rows in rental (left join) and if no matching rental_id found
    -- in payment that column gets marked as null
    where payment.rental_id is null;
```
5. What percentage of the non current rentals have been returned too late?
```sql
-- returns the percentage of late returns historically (i.e. return_date not null)
-- sums all late returns (value 1 since true) and divides by total rentals (count), then converts to % 
select sum(hours_rented > rental_duration*24) / count(*) * 100 as percentage_late_returns
    from (-- subquery that returns film_id and duration of rent (hours)
        select film_id, timestampdiff(hour, rental_date, return_date) as hours_rented
            from rental
            join inventory using (inventory_id)
            where return_date is not null) as rented_hours
    join film using (film_id);
```