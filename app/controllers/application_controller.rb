class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    redirect_to root_path, alert: 'ゲストユーザーの編集・削除は出来ません' if email == 'guest@gmail.com'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :gender_id, :age_id])
  end
end
