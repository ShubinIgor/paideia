json.extract! bokmark, :id, :title, :url, :created_at, :updated_at
json.url bokmark_url(bokmark, format: :json)
