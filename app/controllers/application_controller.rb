class ApplicationController < ActionController::Base

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

end