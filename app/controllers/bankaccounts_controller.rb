class BankaccountsController < ApplicationController
  helper CurrenciesHelper

  def index
  end

  def new
    @bankaccount = Bankaccount.new

  end

  def show
    @bankaccount = Bankaccount.find(params[:id])
  end

  def create
    @bankaccount = Bankaccount.new(params[:bankaccount])

    if @bankaccount.save
      redirect_to @bankaccount, notice: 'Account created successfully.'
    else
      render action: "new"
    end
  end

  def edit
    @bankaccount = Bankaccount.find(params[:id])
  end

  def update
    @bankaccount = Bankaccount.find(params[:id])

    respond_to do |format|
      if @bankaccount.update_attributes(params[:bankaccount])
        format.html { redirect_to @bankaccount, notice: 'Bank account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bankaccount.errors, status: :unprocessable_entity }
      end
    end
  end
end
