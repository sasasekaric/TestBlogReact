json.extract! @post, :id, :title, :body
json.created_at time_ago_in_words(@post.created_at)
json.created_by @post.user.name
json.url post_url(@post, format: :json)
