SELECT TOP 1 
* FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year