json.extract! user, :id, :first_name, :second_name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
