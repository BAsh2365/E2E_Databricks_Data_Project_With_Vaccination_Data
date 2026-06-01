-- AstraZeneca
WITH astra_avg AS (
  SELECT
    AVG(CAST(astra1 AS INT)) AS avg_astra1,
    AVG(CAST(astra2 AS INT)) AS avg_astra2,
    AVG(CAST(astra3 AS INT)) AS avg_astra3,
    AVG(CAST(astra4 AS INT)) AS avg_astra4
  FROM
    bronze_vax_malaysia AS b
  WHERE
    b.date BETWEEN '2021-01-01' AND '2023-12-31'
)
SELECT
  '1st Dose' AS dose,
  avg_astra1 AS avg_count
FROM
  astra_avg
UNION ALL
SELECT
  '2nd Dose' AS dose,
  avg_astra2 AS avg_count
FROM
  astra_avg
UNION ALL
SELECT
  '3rd Dose' AS dose,
  avg_astra3 AS avg_count
FROM
  astra_avg
UNION ALL
SELECT
  '4th Dose' AS dose,
  avg_astra4 AS avg_count
FROM
  astra_avg

-- Pfizer

WITH pfizer_avg AS (
  SELECT
    AVG(CAST(pfizer1 AS INT)) AS avg_pfizer1,
    AVG(CAST(pfizer2 AS INT)) AS avg_pfizer2,
    AVG(CAST(pfizer3 AS INT)) AS avg_pfizer3,
    AVG(CAST(pfizer4 AS INT)) AS avg_pfizer4
  FROM
    bronze_vax_malaysia AS b
  WHERE
    b.date BETWEEN '2021-01-01' AND '2023-12-31'
)
SELECT
  '1st Dose' AS dose,
  avg_pfizer1 AS avg_count
FROM
  pfizer_avg
UNION ALL
SELECT
  '2nd Dose' AS dose,
  avg_pfizer2 AS avg_count
FROM
  pfizer_avg
UNION ALL
SELECT
  '3rd Dose' AS dose,
  avg_pfizer3 AS avg_count
FROM
  pfizer_avg
UNION ALL
SELECT
  '4th Dose' AS dose,
  avg_pfizer4 AS avg_count
FROM
  pfizer_avg


-- Sinovac

WITH sinovac_avg AS (
  SELECT
    AVG(CAST(sinovac1 AS INT)) AS avg_sinovac1,
    AVG(CAST(sinovac2 AS INT)) AS avg_sinovac2,
    AVG(CAST(sinovac3 AS INT)) AS avg_sinovac3,
    AVG(CAST(sinovac4 AS INT)) AS avg_sinovac4
  FROM
    bronze_vax_malaysia AS b
  WHERE
    b.date BETWEEN '2021-01-01' AND '2023-12-31'
)
SELECT
  '1st Dose' AS dose,
  avg_sinovac1 AS avg_count
FROM
  sinovac_avg
UNION ALL
SELECT
  '2nd Dose' AS dose,
  avg_sinovac2 AS avg_count
FROM
  sinovac_avg
UNION ALL
SELECT
  '3rd Dose' AS dose,
  avg_sinovac3 AS avg_count
FROM
  sinovac_avg
UNION ALL
SELECT
  '4th Dose' AS dose,
  avg_sinovac4 AS avg_count
FROM
  sinovac_avg
