json.extract! transcation, :id, :transcation_type, :transaction_id, :transcation_date, :created_at, :updated_at
json.url transcation_url(transcation, format: :json)