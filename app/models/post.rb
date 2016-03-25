class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title, :body

  scope :featured, -> { where(featured: true).includes(:user).first }
  scope :unfeatured, -> { where(featured: false).includes(:user) }

  def truncated_body
    return self.body if body.size < 100
    self.body.first(100) + '...'
  end

end
