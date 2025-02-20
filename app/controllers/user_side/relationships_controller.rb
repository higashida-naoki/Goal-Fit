class UserSide::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:followings, :followers]

  def followings
    @followings = @user.followings
  end

  def followers
    @followers = @user.followers
  end

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
