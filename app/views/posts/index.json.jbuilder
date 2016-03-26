json.array!(@posts) do |post|
  json.extract! post, :id, :title, :truncated_body
  json.created_at post.created_at.strftime("%Y/%m/%d %H:%M")
  json.created_by post.user.name
  json.url post_url(post, format: :json)
end
