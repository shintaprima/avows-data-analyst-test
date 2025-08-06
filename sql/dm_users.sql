SELECT
  id AS user_id,
  gender,
  birth_year,
  current_age,
  CASE
    WHEN birth_year BETWEEN 1901 AND 1924 THEN 'greatest generation'
    WHEN birth_year BETWEEN 1925 AND 1945 THEN 'silent generation'
    WHEN birth_year BETWEEN 1946 AND 1964 THEN 'baby boomer'
    WHEN birth_year BETWEEN 1965 AND 1979 THEN 'gen X'
    WHEN birth_year BETWEEN 1980 AND 1994 THEN 'millennials'
    WHEN birth_year BETWEEN 1995 AND 2012 THEN 'gen Z'
    ELSE 'gen alpha'
  END AS generation_age,
  cast(replace(yearly_income,'$','') as signed) yearly_income,
  credit_score,
  CASE
    WHEN credit_score BETWEEN 300 AND 579 THEN 'poor'
    WHEN credit_score BETWEEN 580 AND 669 THEN 'fair'
    WHEN credit_score BETWEEN 670 AND 739 THEN 'good'
    WHEN credit_score BETWEEN 740 AND 799 THEN 'very good'
    ELSE 'excellent'
  END AS credit_score_group,
  latitude,
  longitude
FROM avo_users_data