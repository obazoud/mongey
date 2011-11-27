class PaymentsController < ApplicationController

  def index
  end

  def show

  end

  def new
    @payment = current_user.payments.new
  end

  def create
    @payment = current_user.build_payment(params[:payment])

    respond_to do |format|
      if @payment.save
        # payment validates transactions, so it should be safe to save them
        @payment.transactions.each { |t| t.save! }

        current_user.process_event(@payment)

        format.html { redirect_to bankaccount_path(@payment.account), :notice => "Payment created" }
        format.js # create.js.erb
      else
        flash.now.alert = "Payment could not be saved!"
        format.html { render "new" }
        format.js { render "new" }
      end
    end
  end
end
