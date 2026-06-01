
SELECT d.year, AVG(f.daily_total) as avg_daily_total
FROM fact_vaccination as f
JOIN dim_date as d ON f.date_key = d.date_key
GROUP BY d.year
ORDER BY avg_daily_total DESC
LIMIT 3
