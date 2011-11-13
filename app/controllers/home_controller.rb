class HomeController < ApplicationController

  def index
    if current_user
      @bankaccounts = current_user.bankaccounts.all
      @events = current_user.events.all
      render "user_home"
    else
      @user = User.new
    end
  end

end
