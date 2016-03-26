class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title, :body

  # Paginate 9 per page
  self.per_page = 9

  # return only featured posts
  scope :featured, -> { where(featured: true).includes(:user) }
  # return only unfeatured posts
  scope :unfeatured, -> { where(featured: false).includes(:user) }
  # return user featured posts
  scope :user_featured, -> (user) { where(featured: true, user: user).includes(:user) }
  # return user unfeatured posts
  scope :user_unfeatured, -> (user) { where(featured: false, user: user).includes(:user) }

  # truncate body so we display only first 100 chars on index page
  def truncated_body
    return self.body if body.size < 100
    self.body.first(100) + '...'
  end

  # search post with field and query
  def self.search(field, query)
    where("#{field} LIKE ? AND featured IS false", "%#{query}%")
  end

end
