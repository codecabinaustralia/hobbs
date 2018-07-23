json.extract! post_reply, :id, :content, :post_id, :created_at, :updated_at
json.url post_reply_url(post_reply, format: :json)
