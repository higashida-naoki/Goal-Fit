class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_side_top_path
    when User
      user_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    about_path
  end

end