json.extract! archivedpost, :id, :title, :body, :user_id, :created_at, :updated_at
json.url archivedpost_url(archivedpost, format: :json)
