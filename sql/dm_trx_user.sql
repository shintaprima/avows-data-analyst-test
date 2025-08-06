select distinct(aud.id) as user_id, atd.client_id,
	sum(cast(replace(amount,'$','') as signed)) as total_amount,
	CASE
    WHEN birth_year BETWEEN 1901 AND 1924 THEN 'greatest generation'
    WHEN birth_year BETWEEN 1925 AND 1945 THEN 'silent generation'
    WHEN birth_year BETWEEN 1946 AND 1964 THEN 'baby boomer'
    WHEN birth_year BETWEEN 1965 AND 1979 THEN 'gen X'
    WHEN birth_year BETWEEN 1980 AND 1994 THEN 'millennials'
    WHEN birth_year BETWEEN 1995 AND 2012 THEN 'gen Z'
    ELSE 'gen alpha'
  END AS generation_age,
  gender, latitude, longitude,
  credit_score,
  CASE
    WHEN credit_score BETWEEN 300 AND 579 THEN 'poor'
    WHEN credit_score BETWEEN 580 AND 669 THEN 'fair'
    WHEN credit_score BETWEEN 670 AND 739 THEN 'good'
    WHEN credit_score BETWEEN 740 AND 799 THEN 'very good'
    ELSE 'excellent'
  END AS credit_score_group
from avo_users_data aud 
left join avo_transactions_data atd on aud.id = atd.client_id
group by 1,2,4,5,6,7,8,9