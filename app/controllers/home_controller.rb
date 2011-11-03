class HomeController < ApplicationController
  def index
    redirect_to login_path unless current_user

    @bankaccounts = Bankaccount.all
    @events = Event.all
  end
end
