-- Returns the album with fewest songs
select Title, count(*)
    from Album
    join Track using (AlbumId)
    group by AlbumId
    order by count(*) asc
    limit 1;