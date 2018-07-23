json.extract! supplier, :id, :name, :address, :postcode, :state, :country, :website, :email, :phone, :contact_name, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
