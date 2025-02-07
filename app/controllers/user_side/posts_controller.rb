class UserSide::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @posts = @post.user.posts
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "投稿が完了しました！"
    else
      @posts = Post.all
      render 'index'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
     redirect_to posts_path, notice: "successfully delete book!"
  end

  private

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:breakfast, :lunch, :dinner, :dessert, :calorie_intake, :calories_consumed, :total_calories, :progress, :weight, :body, :effort_point)
  end

end
