class UserSide::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    #グラフは昇順（古い順）
    posts_for_graph = @user.posts.where("created_at >= ?", 1.week.ago).order(created_at: :asc)
    @y_dates = posts_for_graph.map(&:index_progress)
    @x_dates = posts_for_graph.map { |post| post.created_at.strftime("%m/%d") }
    #投稿一覧は降順（新しい順）
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(7)
  end

  def edit
    @user = current_user
  end

  def favorites
    @user = User.find(params[:id])
    favorite_post_ids = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.includes(:post_comments).where(id: favorite_post_ids)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
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
    params.require(:user).permit(:image, :name, :nickname, :introduction, :height, :current_weight, :ideal_weight, :target_calorie_intake, :target_calories_consumed, :email, :is_active)
  end

end
