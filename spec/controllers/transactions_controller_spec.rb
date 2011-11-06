require 'spec_helper'

describe TransactionsController do

  before do
    Transaction.delete_all
  end

  # This should return the minimal set of attributes required to create a valid
  # Transaction. As you add validations to Transaction, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.attributes_for(:transaction)
  end

  describe "GET index" do
    it "assigns all transactions as @transactions" do
      transaction = FactoryGirl.create(:transaction)
      get :index
      assigns(:transactions).should eq([transaction])
    end
  end

  describe "GET show" do
    it "assigns the requested transaction as @transaction" do
      transaction = FactoryGirl.create(:transaction)
      get :show, :id => transaction.id
      assigns(:transaction).should eq(transaction)
    end
  end

end
