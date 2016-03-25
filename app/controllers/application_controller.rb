class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  protected

  def not_authorized
    redirect_to root_path, notice: "Can't access this page."
  end

  def devise_parameter_sanitizer
    if resource_class == User
      UserParamsSanitizer.new(User, :user, params)
    else
      super
    end
  end

end
