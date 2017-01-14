class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :location_id, :custom_location, :email, :password, :password_confirmation, :current_password)
  end

  def after_sign_up_path_for(resource)
    new_profile_path
  end

end