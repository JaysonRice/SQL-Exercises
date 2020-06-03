--Query all of the entries in the Genre table

SELECT
    Id,
    Label
FROM Genre;

--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

SELECT
    Id,
    ArtistName,
    YearEstablished
FROM Artist
ORDER BY Artist.ArtistName;

--Write a SELECT query that lists all the songs in the Song table and include the Artist name

SELECT
    song.Id,
    song.Title,
    artist.ArtistName
FROM Song song
JOIN Artist artist ON song.ArtistId = artist.id;

--Write a SELECT query that lists all the Artists that have a Rock Album

SELECT
    artist.Id,
    artist.ArtistName,
    album.Title AS 'Album Title',
    genre.Label
FROM Artist artist
JOIN Album album ON album.ArtistId = artist.id
JOIN Genre genre ON album.GenreId = genre.id
WHERE GenreId = 2;


--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

SELECT
    artist.Id,
    artist.ArtistName,
    album.Title AS 'Album Title',
    genre.Label
FROM Artist artist
JOIN Album album ON album.ArtistId = artist.id
JOIN Genre genre ON album.GenreId = genre.id
WHERE GenreId = 2 OR GenreId = 4;

--Write a SELECT statement that lists the Albums with no songs

SELECT
    album.Id AS 'Album Id',
    album.Title AS 'Album Title'
FROM Album album
LEFT JOIN Song song ON song.AlbumId = album.id
WHERE song.Id IS NULL;

--Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Lamb of God', 1994);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('As the Palaces Burn', '05/06/2003', 2362, 'Prosthetic ', 28, 5);
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Ashes of the Wake', '08/30/2004', 2860, 'Prosthetic ', 28, 5);

--Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Laid to Rest', 230, '08/30/2004', 5, 28, 24);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('What I''ve Become', 209, '08/30/2004', 5, 28, 24);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('For Your Malice', 222, '05/06/2003', 5, 28, 23);

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT
    song.Id,
    song.Title,
    album.Title AS 'Album Title',
    artist.ArtistName
FROM Song song
JOIN Artist artist ON song.ArtistId = artist.Id
JOIN Album album ON song.AlbumId = album.Id
WHERE artist.Id = 28;


--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT 
    album.Title AS 'Album Title',
    COUNT(song.Id) AS 'Song Count' 
FROM Album album
INNER JOIN Song song ON song.AlbumId = album.Id
GROUP BY (album.Title)
ORDER BY COUNT(song.Id) DESC;


--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT 
    artist.ArtistName,
    COUNT(song.Id) AS 'Song Count' 
FROM Artist artist
INNER JOIN Song song ON song.ArtistId = artist.Id
GROUP BY (artist.ArtistName)
ORDER BY COUNT(song.Id) DESC;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT 
    genre.Label, 
    COUNT(song.Id) AS 'Song Count' 
FROM Genre genre
INNER JOIN Song song ON song.GenreId = genre.Id
GROUP BY (genre.Label)
ORDER BY COUNT(song.Id) DESC;

--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

SELECT
    artist.ArtistName,
    album.Label,
    COUNT(album.Label)
FROM Artist artist
JOIN Album album ON artist.Id = album.ArtistId
GROUP BY artist.ArtistName, album.Label
HAVING COUNT(album.Label) > 1;


--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

--Modify the previous query to also display the title of the album.