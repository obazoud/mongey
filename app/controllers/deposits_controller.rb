class DepositsController < ApplicationController

  def index
  end

  def show

  end

  def new
    @deposit = current_user.deposits.new
  end

  def create
    @deposit = current_user.build_deposit(params[:deposit])

    respond_to do |format|
      if @deposit.save
        # deposit validates transactions, so it should be safe to save them
        @deposit.transactions.each { |t| t.save! }

        current_user.process_event(@deposit)
      
        format.html { redirect_to bankaccount_path(@deposit.account), :notice => "Deposit created" }
        format.js # create.js.erb
      else
        flash.now.alert = "Deposit could not be saved!"
        format.html { render "new" }
        format.js { render "new" }
      end
    end
  end
end
