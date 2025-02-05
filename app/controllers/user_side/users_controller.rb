class UserSide::UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def favorite
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render info_edit_path
    end
  end

  def unsubscribe
  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :introduction, :height, :current_weight, :ideal_weight, :target_calorie_intake, :target_calories_consumed, :email, :is_active)
  end

end
