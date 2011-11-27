class TransfersController < ApplicationController

  def index
  end

  def show

  end

  def new
    @transfer = current_user.transfers.new
  end

  def create
    @transfer = current_user.build_transfer(params[:transfer])

    respond_to do |format|
      if @transfer.save
        # payment validates transactions, so it should be safe to save them
        @transfer.transactions.each { |t| t.save! }

        current_user.process_event(@transfer)

        format.html { redirect_to bankaccount_path(@transfer.from_account), :notice => "Transfer created" }
        format.js # create.js.erb
      else
        flash.now.alert = "Transfer could not be saved!"
        format.html { render "new" }
        format.js { render "new" }
      end
    end
  end
end
