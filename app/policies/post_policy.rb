class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    my_post? && not_featured?
  end

  def create?
    true
  end

  def update?
    my_post? && not_featured?
  end

  def destroy?
    my_post? && not_featured?
  end


  private

  def not_featured?
    !post.featured
  end

  def my_post?
    user == post.user
  end

end
