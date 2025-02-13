class AdminSide::UsersController < ApplicationController
  before_action :authenticate_admin! 

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_side_user_path(@user)
    else
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:image, :name, :nickname, :introduction, :height, :current_weight, :ideal_weight, :target_calorie_intake, :target_calories_consumed, :email, :is_active)
  end
end
