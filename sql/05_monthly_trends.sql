WITH monthly AS (
  SELECT year, month, COUNT(*) AS n
  FROM listens
  GROUP BY year, month
)
SELECT year, month, n,
       n - LAG(n) OVER (ORDER BY year, month) AS change
FROM monthly
ORDER BY year, month;