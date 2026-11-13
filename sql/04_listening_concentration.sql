WITH user_artist AS (
  SELECT l.user_id, t.artist_id, COUNT(*) AS n
  FROM listens l
  JOIN tracks t ON l.track_id = t.track_id
  GROUP BY l.user_id, t.artist_id
),
ranked AS (
  SELECT user_id, n,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY n DESC) AS rn,
         SUM(n) OVER (PARTITION BY user_id) AS total
  FROM user_artist
)
SELECT user_id,
       ROUND(100.0 * SUM(n) / MAX(total), 1) AS top10_share_pct
FROM ranked
WHERE rn <= 10
GROUP BY user_id
ORDER BY top10_share_pct DESC;