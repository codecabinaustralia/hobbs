json.extract! project_document, :id, :title, :description, :created_at, :updated_at
json.url project_document_url(project_document, format: :json)
