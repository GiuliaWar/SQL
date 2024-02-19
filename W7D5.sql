-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce
SELECT
  GenreId,
  COUNT(GenreId) AS num_tracks
FROM
  track
  GROUP BY
  genreid
HAVING
  num_tracks >= 10
ORDER BY
  num_tracks DESC;
  
  -- Trovate le tre canzoni più costose
SELECT 
    *
FROM
    track
ORDER BY unitprice DESC
LIMIT 3;

-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti
SELECT 
    Composer
FROM
    track
WHERE
    Milliseconds > 360000;
    
-- Individuate la durata media delle tracce per ogni genere
SELECT 
    AVG(Milliseconds), MediaTypeId
FROM
    track
GROUP BY
	MediaTypeId;

-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome
SELECT 
    *
FROM
    track
WHERE
    Name LIKE '%love%'
ORDER BY GenreId , Name ASC;

-- Trovate il costo medio per ogni tipologia di media
SELECT 
    MediaTypeId as Media_Id, AVG(UnitPrice) AS avg_price
FROM
    mediatype mt
        JOIN
    track t ON mt.MediaId = t.TrackId
GROUP BY MediaTypeId
ORDER BY avg_price DESC;

-- Individuate il genere con più tracce
SELECT 
    GenreId, MAX(trackId) AS MaxTrack
FROM
    track
GROUP BY GenreId
ORDER BY MaxTrack ASC;

-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones

SELECT 
    ArtistId, Name
FROM
    artist
WHERE
    Name = 'The Rolling Stones';
    
SELECT 
    count(Title) AS TOT_Album, ArtistId
FROM
    album
WHERE
    ArtistId = 142;
    
SELECT 
    ArtistId
FROM
    album
WHERE
   COUNT(AlbumId) = 3;
    
-- trovate l'artista con il brano più costoso

SELECT 
    Composer, MAX(Unitprice) AS MaxPrice
FROM
    track
GROUP BY Composer
ORDER BY MAXPrice DESC;