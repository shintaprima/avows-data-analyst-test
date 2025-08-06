SELECT card_type, sum(cast(replace(amount,'$','') as signed)) as total_amount
from avo_cards_data acd 
left join avo_transactions_data atd on acd.client_id = atd.client_id 
group by 1