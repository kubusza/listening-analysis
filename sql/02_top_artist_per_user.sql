WITH user_artist AS (
  SELECT l.user_id, a.artist, COUNT(*) AS n
  FROM listens l
  JOIN tracks t ON l.track_id = t.track_id
  JOIN artists a ON t.artist_id = a.artist_id
  GROUP BY l.user_id, a.artist
)
SELECT user_id, artist, n
FROM (SELECT *, RANK() OVER (PARTITION BY user_id ORDER BY n DESC) AS rnk
      FROM user_artist)
WHERE rnk <= 3
ORDER BY user_id, rnk;