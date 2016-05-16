class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def user_not_authorized
    redirect_to request.headers["Referer"] || root_path #referer not working properly yet
  end

  def after_sign_in_path_for(resource)
    projects_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end
