WITH totals AS (
  SELECT
    AVG(CAST(pfizer1 AS INT))
      + AVG(CAST(pfizer2 AS INT))
      + AVG(CAST(pfizer3 AS INT))
      + AVG(CAST(pfizer4 AS INT)) AS avg_total_pfizer,
    AVG(CAST(sinovac1 AS INT))
      + AVG(CAST(sinovac2 AS INT))
      + AVG(CAST(sinovac3 AS INT))
      + AVG(CAST(sinovac4 AS INT)) AS avg_total_sinovac,
    AVG(CAST(astra1 AS INT))
      + AVG(CAST(astra2 AS INT))
      + AVG(CAST(astra3 AS INT))
      + AVG(CAST(astra4 AS INT)) AS avg_total_astra
  FROM
    bronze_vax_malaysia AS b
  WHERE
    b.date BETWEEN '2021-01-01' AND '2023-12-31'
)
SELECT
  'Pfizer' AS brand,
  avg_total_pfizer AS total_vaccinations
FROM
  totals
UNION ALL
SELECT
  'Sinovac' AS brand,
  avg_total_sinovac AS total_vaccinations
FROM
  totals
UNION ALL
SELECT
  'AstraZeneca' AS brand,
  avg_total_astra AS total_vaccinations
FROM
  totals
ORDER BY
  total_vaccinations DESC
