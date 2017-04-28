class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  def current_profile
    current_user && current_user.profile
  end
  helper_method :current_profile

end
