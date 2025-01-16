-- Returns the album with longest playtime
select Title 
    from Album
    join Track using (AlbumId) 
    group by AlbumId 
    order by sum(Milliseconds) desc
    limit 1;