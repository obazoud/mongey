class BankaccountsController < ApplicationController
  def index
  end

  def new
    @bankaccount = Bankaccount.new

  end

end
