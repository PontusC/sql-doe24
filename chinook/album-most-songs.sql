-- Returns the album with most songs
select Title
    from Album
    join Track using (AlbumId)
    group by AlbumId
    order by count(*) desc
    limit 1;