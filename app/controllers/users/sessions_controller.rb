# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: user_params[:email])
    if user.present? && user.active_for_authentication? &&
       user.valid_password?(user_params[:password])
      sign_in user
      render json: user, status: :created
    else
      render json: { error: 'Auth error' }, status: :unprocessable_entity
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out current_user
    render json: current_user, status: :created
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def user_params
    params.require(:session).permit(:email, :password)
  end
end
