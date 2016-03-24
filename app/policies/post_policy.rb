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
    my_post?
  end

  def create?
    true
  end

  def update?
    my_post?
  end

  def destroy?
    my_post?
  end


  private

  def my_post?
    user == post.user
  end

end
