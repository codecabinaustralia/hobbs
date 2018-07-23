json.extract! project, :id, :category_id, :client_id, :title, :address, :city, :state, :postcode, :created_at, :updated_at
json.url project_url(project, format: :json)
