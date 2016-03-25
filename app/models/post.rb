class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title, :body

  scope :featured, -> { where(featured: true).includes(:user) }
  scope :unfeatured, -> { where(featured: false).includes(:user) }
  scope :user_featured, -> (user) { where(featured: true, user: user).includes(:user) }
  scope :user_unfeatured, -> (user) { where(featured: false, user: user).includes(:user) }

  def truncated_body
    return self.body if body.size < 100
    self.body.first(100) + '...'
  end

end
