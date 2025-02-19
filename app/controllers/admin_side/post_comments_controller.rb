# app/controllers/admin_side/post_comments_controller.rb
class AdminSide::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_side_post_path(@post_comment.post_id)
  end
end
