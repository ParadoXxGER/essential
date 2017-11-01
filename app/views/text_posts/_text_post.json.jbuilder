json.extract! text_post, :id, :created_at, :updated_at
json.url text_post_url(text_post, format: :json)
