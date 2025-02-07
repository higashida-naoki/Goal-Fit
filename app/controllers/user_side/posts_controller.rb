class UserSide::PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created book successfully."
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
  end

  private

  def post_params
    params.require(:post).permit(:breakfast, :lunch, :dinner, :dessert, :calorie_intake, :calories_consumed, :total_calories, :progress, :weight, :body, :effort_point)
  end

end
