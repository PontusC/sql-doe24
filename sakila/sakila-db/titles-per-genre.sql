-- Shows up to 10 movies per film genre
select genre, group_concat(title)
    from ( -- Subquery to get a list of matching film_ids and their genres
        select fCat.film_id, cat.name genre
            from film_category fCat
            join category cat using (category_id)) as genres
    join film using (film_id)
    group by genre;