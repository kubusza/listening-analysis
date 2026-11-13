SELECT a.artist,
       COUNT(DISTINCT l.user_id) AS unique_listeners,
       COUNT(*) AS total_plays
FROM listens l
JOIN tracks t ON l.track_id = t.track_id
JOIN artists a ON t.artist_id = a.artist_id
GROUP BY a.artist
ORDER BY unique_listeners DESC, total_plays DESC
LIMIT 15;