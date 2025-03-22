class AdminSide::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
    @user = @post.user
    if @post.update(post_params)
      redirect_to admin_side_post_path, notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
     redirect_to admin_side_posts_path, notice: "successfully delete post!"
  end

  private

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
