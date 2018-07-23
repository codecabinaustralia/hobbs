json.extract! client, :id, :user_id, :full_name, :full_name_2, :phone, :phone_2, :address, :city, :state, :postcode, :created_at, :updated_at
json.url client_url(client, format: :json)
