json.posts(@posts) do |post|
  json.extract! post, :id, :title, :truncated_body
  json.created_at time_ago_in_words(post.created_at)
  json.created_by post.user.name
  json.url post_url(post, format: :json)
end
