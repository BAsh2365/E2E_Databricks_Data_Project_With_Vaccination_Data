FROM fact_vaccination as f
SELECT 
  PERCENTILE(cumul_full / cumul_total, 0.5) * 100 AS national_coverage_percentile
