class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :auth_required

  before_filter :create_dummy_transactions
private

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def auth_required
   if current_user
     @_current_user
   else
     redirect_to login_path, :alert => "Login required!"
   end
  end

  def create_dummy_transactions
    if current_user
      @_payment = @_current_user.payments.new
      @_deposit = @_current_user.deposits.new
    end
  end
end
