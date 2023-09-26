## Setup

1). Close the DB connection at https://sqliteonline.com/ (click the `X` just below the `MS SQL` section on the side bar). Reconnect to the database and drop the `demo` table (as before)

2). Copy and paste [start-schema.sql](./start-schema.sql) into the SQL console and hit run

3). **Complete exercise 1**

(If you didn't complete 3, go back to step 1; run [full-schema.sql](./solutions/full-schema.sql); and then step 4)

4). Run [data.sql](./data.sql) to populate the new tables

Continue from **exercise 2**

## Exercises
### 1. Create a Songs Table
This table should be called `songs` and have four properties with these exact names.
1. `id`: An integer that is the primary key, and auto increments (`IDENTITY`)
2. `name`: A string that cannot be null.
3. `length`: A float that represents the length of the song in minutes that cannot be null.
4. `album_id`: An integer that is a foreign key referencing the albums table that cannot be null.

[Solution](solutions/1.sql)

**Go back to Setup ==> 4).** 

### 2. Select only the Names of all the Bands
Change the name of the column the data returns to `Band Name`

| Band Name         | 
|-------------------| 
| Seventh Wonder    | 
| Metallica         | 
| The Ocean         | 
| Within Temptation | 
| Death             | 
| Van Canto         | 
| Dream Theater     | 

[Solution](solutions/2.sql)

### 3. Select the Oldest Album

Make sure to only return one result from this query, and that you are not returning any albums that do not have a release year.

hint - use `WHERE <field> IS NOT NULL` to identify empty fields

| id | name                   | release_year | band_id | 
|----|------------------------|--------------|---------| 
| 5  | ...And Justice for All | 1988         | 2       | 

[Solution](solutions/3.sql)

### 4. Get all Bands that have Albums

There are multiple different ways to solve this problem, but they will all involve a join.

Return the band name as `Band Name`.

hint - use `SELECT DISTINCT <table>.<field> FROM ...`

| Band Name         | 
|-------------------| 
| Seventh Wonder    | 
| Metallica         | 
| The Ocean         | 
| Within Temptation | 
| Death             | 
| Van Canto         | 

[Solution](solutions/4.sql)

### 5. Get all Bands that have No Albums

This is very similar to #4 but will require more than just a join.

Return the band name as `Band Name`.

hint:

- use a `LEFT JOIN`
- the final line of the query will be `HAVING COUNT(albums.id) = 0`

| Band Name     | 
|---------------| 
| Dream Theater | 

[Solution](solutions/5.sql)

### 6. Get the Longest Album

This problem sounds a lot like #3 but the solution is quite a bit different. I would recommend looking up the SUM aggregate function.

Return the album name as `Name`, the album release year as `Release Year`, and the album length as `Duration`.

hint:

You will need this line in your query: `GROUP BY songs.album_id, albums.name, albums.release_year`

| Name           | Release Year | Duration          | 
|----------------|--------------|-------------------| 
| Death Magnetic | 2008         | 74.76666593551636 | 

[Solution](solutions/6.sql)

### 7. Update the Release Year of the Album with no Release Year

Set the release year to 1986.

hint: We need to first find the id of that album. We can do that and store the result for later with this query:

```sql
DECLARE @IdToUpdate table(
    id int NOT NULL);
insert into @IdToUpdate(id)
SELECT TOP 1 id 
FROM albums where release_year IS NULL

-- the rest of your query
-- ...

WHERE id = (select id from @IdToUpdate); -- this is how you return the stored result
```

[Solution](solutions/7.sql)

### 8. Insert a record for your favorite Band and one of their Albums

Similar to 7, you need a query to save the `band_id` of the new band you added:

```sql
DECLARE @BandIdToAdd table(
    id int NOT NULL);
insert into @BandIdToAdd(id)
SELECT TOP 1 id 
FROM bands
ORDER by id DESC
```

If you performed this correctly you should be able to now see that band and album in your tables.

[Solution](solutions/8.sql)

### ~~9. Delete the Band and Album you added in #8~~
### 10. Get the Average Length of all Songs
Return the average length as `Average Song Duration`.

| Average Song Duration | 
|-----------------------| 
| 5.352472513259112     | 

[Solution](solutions/10.sql)

### 11. Select the longest Song off each Album

Return the album name as `Album`, the album release year as `Release Year`, and the longest song length as `Duration`.

| Album                       | Release Year | Duration | 
|-----------------------------|--------------|----------| 
| Tiara                       | 2018         | 9.5      | 
| The Great Escape            | 2010         | 30.2333  | 
| Mercy Falls                 | 2008         | 9.48333  | 
| Master of Puppets           | 1986         | 8.58333  | 
| ...And Justice for All      | 1988         | 9.81667  | 
| Death Magnetic              | 2008         | 9.96667  | 
| Heliocentric                | 2010         | 7.48333  | 
| Pelagial                    | 2013         | 9.28333  | 
| Anthropocentric             | 2010         | 9.4      | 
| Resist                      | 2018         | 5.85     | 
| The Unforgiving             | 2011         | 5.66667  | 
| Enter                       | 1997         | 7.25     | 
| The Sound of Perseverance   | 1998         | 8.43333  | 
| Individual Thought Patterns | 1993         | 4.81667  | 
| Human                       | 1991         | 4.65     | 
| A Storm to Come             | 2006         | 5.21667  | 
| Break the Silence           | 2011         | 6.15     | 
| Tribe of Force              | 2010         | 8.38333  | 

[Solution](solutions/11.sql)

### 12. Get the number of Songs for each Band

This is one of the toughest question on the list. It will require you to chain together two joins instead of just one.

Return the band name as `Band`, the number of songs as `Number of Songs`.

| Band              | Number of Songs | 
|-------------------|-----------------| 
| Seventh Wonder    | 35              | 
| Metallica         | 27              | 
| The Ocean         | 31              | 
| Within Temptation | 30              | 
| Death             | 27              | 
| Van Canto         | 32              | 

[Solution](solutions/12.sql)
