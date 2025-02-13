class ApplicationController < ActionController::Base
  before_action :authenticate_admin_or_user!

  def authenticate_admin_or_user!
    if admin_controller?
      authenticate_admin! # Admin 用の認証
    else
      authenticate_user!  # User 用の認証
    end
  end

  def admin_controller?
    params[:controller].start_with?("admin_side/")
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_side_top_path
    when User
      user_path(current_user)
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    about_path
  end

  private

  def admin_controller?
    params[:controller].start_with?("admin_side/")
  end

end