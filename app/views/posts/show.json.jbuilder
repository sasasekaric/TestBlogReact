json.extract! @post, :title, :truncated_body

json.user do
  json.name @post.user.name
end
