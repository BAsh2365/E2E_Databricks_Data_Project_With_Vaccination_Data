FROM fact_vaccination AS f
JOIN dim_date AS d ON f.date_key = d.date_key
SELECT 
  d.year,
  AVG((f.cumul_partial * 1.0) / f.cumul_total) * 100 AS avg_partial_pct,
  AVG((f.cumul_full * 1.0) / f.cumul_total) * 100 AS avg_full_pct
GROUP BY d.year
ORDER BY d.year DESC
LIMIT 3
