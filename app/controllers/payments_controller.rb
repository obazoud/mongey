class PaymentsController < ApplicationController

  def index
  end

  def show

  end

  def new
    @payment = current_user.payments.new
  end

  def create
    @payment = current_user.payments.new(params[:payment])
    
    account = @payment.account

    payee = Payee.where(name: params[:payment][:payee_name]).first
    payee = current_user.payees.create!(:name => params[:payment][:payee_name], :opening_date => Time.now, :balance => 0.0) if payee.nil?
    @payment.payee = payee

    credit_transaction = @payment.transactions.new(:memo => @payment[:memo], 
                                                   :credit => @payment[:amount].to_f, 
                                                   :debit => 0, 
                                                   :account_id => payee.id,
                                                   :category_id => @payment[:category_id])
    debit_transaction = @payment.transactions.new(:memo => @payment[:memo],
                                                  :credit => 0,
                                                  :debit => @payment[:amount].to_f,
                                                  :account_id => account.id,
                                                  :category_id => @payment[:category_id])

    payee.balance += @payment[:amount].to_f
    account.balance -= @payment[:amount].to_f

    #Save the payment
    @payment.save
    credit_transaction.save
    debit_transaction.save
    
    #Save changes to accounts
    payee.save
    account.save

  end

end
