class HomeController < ApplicationController
  def index
    @bankaccounts = Bankaccount.all
    @events = Event.all

  end

end
