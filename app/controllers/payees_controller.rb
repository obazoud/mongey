class PayeesController < ApplicationController

  def index
    @payees = Payee.all
  end

  def show
    @payee = Payee.find(params[:id])
  end

  def new
    @payee = Payee.new
  end

  def create
    @payee = Payee.new(params[:payee])

    if @payee.save
      redirect_to @payee, notice: 'Payee was successfully created.'
    else
      render action: "new"
    end
  end

  def autocomplete
    if params[:term]
      regex = /#{params[:term]}/i
      payees = Payee.where(name: regex)
    else
      payees = Payee.all
    end
    list = payees.map {|p| Hash[id: p.id, label: p.name, name: p.name]}
    render json: list
  end
end
