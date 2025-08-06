select strftime('%Y',date) as transaction_year, count(distinct client_id) as user_active, sum(cast(replace(amount,'$','') as signed)) as total_amount
from avo_transactions_data atd 
group by 1