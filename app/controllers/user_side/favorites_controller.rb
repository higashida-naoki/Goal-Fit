class UserSide::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post_id: @post.id)
    if @favorite.save
      @favorites_count = @post.favorites.count
      @favorited_by_user = true
      render 'replace_btn'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    if @favorite.destroy
      @faorites_count = @post.favorites.count
      @favorites_by_user = false
      render 'replace_btn'
    end
  end
end
