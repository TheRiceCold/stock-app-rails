class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_balance

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :balance])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :balance])
  end

  def set_balance
    @balance = current_user.wallet if user_signed_in?
  end
end
