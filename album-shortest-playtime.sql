-- Returns the album with shortest playtime
select Title 
    from Album
    join Track using (AlbumId) 
    group by AlbumId 
    order by sum(Milliseconds) asc
    limit 1;