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
    
    @payment.payee = Payee.where(name: params[:payment][:payee_name]).first ||
                     current_user.payees.create!(:name => params[:payment][:payee_name], :opening_date => Time.now, :balance => 0.0)

    @payment.transactions.new(:memo => @payment[:memo], 
                                  :credit => @payment[:amount].to_f, 
                                  :debit => 0, 
                                  :account_id => @payment.payee.id,
                                  :category_id => @payment[:category_id])
    @payment.transactions.new(:memo => @payment[:memo],
                                  :credit => 0,
                                  :debit => @payment[:amount].to_f,
                                  :account_id => @payment.account.id,
                                  :category_id => @payment[:category_id])

    @payment.payee.balance += @payment[:amount].to_f
    @payment.account.balance -= @payment[:amount].to_f

    #Save the payment
    @payment.save!
    @payment.transactions.each { |t| t.save! }
    
    #Save changes to accounts
    @payment.payee.save
    @payment.account.save

  end

end
