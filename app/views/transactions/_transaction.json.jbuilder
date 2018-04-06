json.extract! transaction, :id, :txref, :type, :asset, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
