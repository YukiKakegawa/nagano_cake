class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  def after_sign_out_path_for(resources)
    if resources == :admin
      #flash[:success] = "Signed out successfully."
      new_admin_session_path
    else
      customers_sign_in_path
    end
  end


end
