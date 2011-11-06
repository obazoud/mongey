class DepositsController < ApplicationController
  def new
    @deposit = current_user.deposits.new
  end

  def create
    @deposit = current_user.deposits.new(params[:deposit])
    
    @deposit.payer = payer = Payee.where(name: params[:deposit][:payer_name]).first ||
                     current_user.payees.create!(:name => params[:deposit][:payer_name], :opening_date => Time.now, :balance => 0.0) if payer.nil?

    @deposit.transactions.new(:memo => @deposit[:memo], 
                              :credit => @deposit[:amount].to_f, 
                              :debit => 0, 
                              :account_id => @deposit.account.id,
                              :category_id => @deposit[:category_id])
    @deposit.transactions.new(:memo => @deposit[:memo],
                              :credit => 0,
                              :debit => @deposit[:amount].to_f,
                              :account_id => @deposit.payer.id,
                              :category_id => @deposit[:category_id])

    @deposit.payer.balance -= @deposit[:amount].to_f
    @deposit.account.balance += @deposit[:amount].to_f

    #Save the payment
    @deposit.save!
    @deposit.transactions.each { |t| t.save! }
    
    #Save changes to accounts
    @deposit.payer.save
    @deposit.account.save
  end
end
