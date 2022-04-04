json.extract! transaction, :id, :type, :quantity, :price, :user_id, :stock_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
