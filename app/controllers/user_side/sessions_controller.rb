# frozen_string_literal: true

class UserSide::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.hex(10) # ゲスト用のパスワード
      user.name = "ゲストユーザー"  # Nicknameを設定
      user.nickname = "ゲストユーザー"  # Nicknameを設定
      user.height = 170                # 身長（例: 170cm）
      user.current_weight = 60         # 現在の体重（例: 60kg）
      user.ideal_weight = 55           # 理想体重（例: 55kg）
    end
    sign_in(user)
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if customer.nil?
    return unless user.valid_password?(params[:user][:password])
    return if user.is_active == true
    redirect_to new_user_registration_path
  end

end
