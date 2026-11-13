SELECT user_id,
       COUNT(*) AS plays,
       ROUND(100.0 * AVG(is_weekend), 1) AS weekend_pct
FROM listens
GROUP BY user_id
ORDER BY weekend_pct DESC;