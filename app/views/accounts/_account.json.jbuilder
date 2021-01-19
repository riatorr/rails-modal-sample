json.extract! account, :id, :name, :login, :email, :created_at, :updated_at
json.url account_url(account, format: :json)
