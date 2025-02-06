class UserSide::UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @users = User.all
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    #@posts = @user.posts
    #@post = Post.new
  end

  def edit
    @user = User.find(params[:id])
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
