class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(params[:deposit])
    
    @to_account = Account.find(params[:deposit][:to_account_id])
    @payer = Payee.where(name: params[:deposit][:payer]).first
    if @payer
    else
      @payer = Payee.create(:name => params[:deposit][:payer], :balance => 0.0)
    end

    @credit_transaction = @deposit.transactions.new(:memo => @deposit[:memo], 
                                                    :credit => @deposit[:amount].to_f, 
                                                    :debit => 0, 
                                                    :account_id => @deposit[:to_account_id],
                                                    :category_id => @deposit[:category_id])
    @debit_transaction = @deposit.transactions.new(:memo => @deposit[:memo],
                                                   :credit => 0,
                                                   :debit => @deposit[:amount].to_f,
                                                   :account_id => @payer.id,
                                                   :category_id => @deposit[:category_id])

    @payer.balance -= @deposit[:amount].to_f
    @to_account.balance += @deposit[:amount].to_f

    #Save the payment
    @deposit.save
    @credit_transaction.save
    @debit_transaction.save
    
    #Save changes to accounts
    @payer.save
    @to_account.save

  end


end
