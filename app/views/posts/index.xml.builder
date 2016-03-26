page = params[:page] || 1
before_page = page.to_i - 1
next_page = page.to_i + 1
xml.instruct!
xml.posts do
  xml.metadata do
    xml.location posts_url(format: :xml, page: page)
    xml.next_page posts_url(format: :xml, page: next_page)
    xml.before_page posts_url(format: :xml, page: before_page) if before_page != 0
  end
  @posts.each do |post|
    xml.post do
      xml.id post.id
      xml.title post.title
      xml.truncated_body post.truncated_body
      xml.created_at post.created_at.strftime("%Y/%m/%d %H:%M")
      xml.created_by post.user.name
      xml.url post_url(post, format: :xml)
    end
  end
end
