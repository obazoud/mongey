class PaymentsController < ApplicationController

  def index
  end

  def show

  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(params[:payment])
    
    @from_account = Account.find(params[:payment][:from_account_id])
    @payee = Payee.where(name: params[:payment][:payee]).first
    if @payee
    else
      @payee = Payee.create(:name => params[:payment][:payee], :balance => 0.0)
    end

    @credit_transaction = @payment.transactions.new(:memo => @payment[:memo], 
                                                    :credit => @payment[:amount].to_f, 
                                                    :debit => 0, 
                                                    :account_id => @payee.id,
                                                    :category_id => @payment[:category_id])
    @debit_transaction = @payment.transactions.new(:memo => @payment[:memo],
                                                   :credit => 0,
                                                   :debit => @payment[:amount].to_f,
                                                   :account_id => @payment[:from_account_id],
                                                   :category_id => @payment[:category_id])

    @payee.balance += @payment[:amount].to_f
    @from_account.balance -= @payment[:amount].to_f

    #Save the payment
    @payment.save
    @credit_transaction.save
    @debit_transaction.save
    
    #Save changes to accounts
    @payee.save
    @from_account.save

  end

end
