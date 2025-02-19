# app/controllers/admin/comments_controller.rb
class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post
  before_action :set_comment, only: [:destroy]

  def destroy
    @comment.destroy
    redirect_to admin_post_path(@post), notice: 'コメントが削除されました。'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.post_comments.find(params[:id])
  end
end
