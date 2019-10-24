json.extract! user, :id, :user_name, :first_name, :last_name, :picture, :pass, :bio, :sport_type, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
