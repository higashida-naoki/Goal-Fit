class UserSide::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(7)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @posts = @post.user.posts
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tags = Vision.get_image_data(post_params[:breakfast_image])
    tags = Vision.get_image_data(post_params[:lunch_image])
    tags = Vision.get_image_data(post_params[:dinner_image])

    if @post.save
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to post_path(@post), notice: "投稿が完了しました！"
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @user = @post.user
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿が更新されました！"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  private

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path, alert: "権限がありません。"
    end
  end

  def post_params
    params.require(:post).permit(
      :calorie_intake, :calories_consumed, :total_calories, :progress, 
      :weight, :body, :effort_point, 
      :breakfast_image, :lunch_image, :dinner_image, 
      :breakfast, :lunch, :dinner, 
      :breakfast_calories, :lunch_calories, :dinner_calories
    )
  end
end
