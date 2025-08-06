SELECT
  id AS transaction_id,
  client_id,
  cast(replace(amount,'$','') as signed)  amount,
  date AS transaction_date
FROM avo_transactions_data