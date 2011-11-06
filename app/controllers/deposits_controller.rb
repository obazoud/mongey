class DepositsController < ApplicationController
  def new
    @deposit = current_user.deposits.new
  end

  def create
    @deposit = current_user.deposits.new(params[:deposit])
    
    account = @deposit.account
    payer = Payee.where(name: params[:deposit][:payer_name]).first
    payer = Payee.create!(:name => params[:deposit][:payer_name], :opening_date => Time.now, :balance => 0.0) if payer.nil?
    @deposit.payer = payer

    credit_transaction = @deposit.transactions.new(:memo => @deposit[:memo], 
                                                   :credit => @deposit[:amount].to_f, 
                                                   :debit => 0, 
                                                   :account_id => account.id,
                                                   :category_id => @deposit[:category_id])
    debit_transaction = @deposit.transactions.new(:memo => @deposit[:memo],
                                                  :credit => 0,
                                                  :debit => @deposit[:amount].to_f,
                                                  :account_id => payer.id,
                                                  :category_id => @deposit[:category_id])

    payer.balance -= @deposit[:amount].to_f
    account.balance += @deposit[:amount].to_f

    #Save the payment
    @deposit.save
    credit_transaction.save
    debit_transaction.save
    
    #Save changes to accounts
    payer.save
    account.save

  end


end
