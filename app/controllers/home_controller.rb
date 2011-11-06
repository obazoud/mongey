class HomeController < ApplicationController

  before_filter :auth_required

  def index
    @bankaccounts = current_user.bankaccounts.all
    @events = current_user.events.all
  end
end
