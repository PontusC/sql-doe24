# About
Repository for SQL exercises using [chinook database](https://github.com/lerocha/chinook-database).

## Exercises-1
1. Who's the customer who has spent the most?
```sql
-- Returns the customer from Customers that has spent the most money
select FirstName, LastName
    from Customer 
    join Invoice using (CustomerId) 
    group by CustomerId 
    order by sum(Total) desc
    limit 1;
```
2. What's the title of the longest album? (most minutes of music)
https://github.com/PontusC/chinook-sql-doe24/blob/233cdbd5a1bb97b3416404dea806b37a9730d20f/album-longest-playtime.sql#L1-L7
3. What's the title of the shortest album? (fewest minutes of music)

4. What's the title of the album with the most songs?

5. What's the title of the album with the fewest songs?
