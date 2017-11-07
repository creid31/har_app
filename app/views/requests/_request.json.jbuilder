json.extract! request, :id, :index, :method, :uri, :har_file_id, :created_at, :updated_at
json.url har_file_request_url(id: request.har_file_id, format: :json)
