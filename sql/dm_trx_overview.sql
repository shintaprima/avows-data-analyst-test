select count(distinct client_id) as total_user_active, count(distinct id) as total_transaction
from avo_transactions_data atd 