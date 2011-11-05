class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def auth_required
   if current_user
     @current_user
   else
     redirect_to login_path, :alert => "Login required!"
   end
  end

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
