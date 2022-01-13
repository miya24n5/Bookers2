class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sing_in_path_for(resource)
    
  end

  # def after_sing_out_path_for(resource)
    # '/users/sing_in'
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
