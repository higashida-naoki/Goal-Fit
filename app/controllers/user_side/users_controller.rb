class UserSide::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @post = Post.new  
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @y_dates = @user.posts.where("created_at >= ?", 1.week.ago).map do  |post|
      #体重を減らしたい人、増やしたい人どちらも使えるように絶対値を参照するようにしている
      ideal_weight = @user.ideal_weight
      100 * (ideal_weight - (post.weight - ideal_weight).abs) / ideal_weight
    end
    @x_dates =  @user.posts.where("created_at >= ?", 1.week.ago).map {| post | post.created_at.strftime("%Y年%m月%d日")}
  end

  def edit
    @user = current_user
  end

   def favorites
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "user_side/users/edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to new_user_registration_path
  end

  private

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end


  def user_params
    params.require(:user).permit(:name, :nickname, :introduction, :height, :current_weight, :ideal_weight, :target_calorie_intake, :target_calories_consumed, :email, :is_active)
  end

end
