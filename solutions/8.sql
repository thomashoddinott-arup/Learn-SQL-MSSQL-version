INSERT INTO bands (name)
VALUES ('Michael Jackson');

DECLARE @BandIdToAdd table(
    id int NOT NULL);
insert into @BandIdToAdd(id)
SELECT TOP 1 id 
FROM bands
ORDER by id DESC

INSERT INTO albums (name, release_year, band_id)
VALUES ('Thriller', 1982, (select id from @BandIdToAdd));