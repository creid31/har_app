json.extract! har_file, :id, :name, :description, :content, :created_at, :updated_at
json.url har_file_url(har_file, format: :json)
