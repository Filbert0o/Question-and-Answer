json.extract! user, :id, :username, :email, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)
