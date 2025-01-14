# Exercises-1
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
```sql
-- Returns the album with longest playtime
select Title 
    from Album
    join Track using (AlbumId) 
    group by AlbumId 
    order by sum(Milliseconds) desc
    limit 1;
```
3. What's the title of the shortest album? (fewest minutes of music)
```sql
-- Returns the album with shortest playtime
select Title 
    from Album
    join Track using (AlbumId) 
    group by AlbumId 
    order by sum(Milliseconds) asc
    limit 1;
```
4. What's the title of the album with the most songs?
```sql
-- Returns the album with most songs
select Title
    from Album
    join Track using (AlbumId)
    group by AlbumId
    order by count(*) desc
    limit 1;
```
5. What's the title of the album with the fewest songs?
```sql
-- Returns the album with fewest songs
select Title
    from Album
    join Track using (AlbumId)
    group by AlbumId
    order by count(*) asc
    limit 1;
```