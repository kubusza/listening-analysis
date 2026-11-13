SELECT a.artist, COUNT(*) AS listens
FROM listens l
JOIN tracks t ON l.track_id = t.track_id
JOIN artists a ON t.artist_id = a.artist_id
GROUP BY a.artist
ORDER BY listens DESC
LIMIT 10;