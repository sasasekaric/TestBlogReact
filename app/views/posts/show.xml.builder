xml.instruct!
xml.post do
  xml.id @post.id
  xml.title @post.title
  xml.body @post.body
  xml.created_at @post.created_at.strftime("%Y/%m/%d %H:%M")
  xml.created_by @post.user.name
  xml.url post_url(@post, format: :xml)
end
