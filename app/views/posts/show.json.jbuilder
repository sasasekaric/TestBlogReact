json.extract! @post, :id, :title, :body
json.created_at @post.created_at.strftime("%Y/%m/%d %H:%M")
json.created_by @post.user.name
json.url post_url(@post, format: :json)
