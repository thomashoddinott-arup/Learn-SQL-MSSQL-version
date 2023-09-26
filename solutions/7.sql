DECLARE @IdToUpdate table(
    id int NOT NULL);
insert into @IdToUpdate(id)
SELECT TOP 1 id 
FROM albums where release_year IS NULL

UPDATE albums
SET release_year = 1986
WHERE id = (select id from @IdToUpdate);