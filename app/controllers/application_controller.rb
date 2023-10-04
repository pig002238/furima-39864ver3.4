class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :show]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :kana_last_name, :kana_first_name, :date_of_birth])
  end
end
