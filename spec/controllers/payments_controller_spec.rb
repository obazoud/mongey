require 'spec_helper'

describe PaymentsController do
  before do
    @user = FactoryGirl.create(:user)
    log_in @user

    @user.accounts << FactoryGirl.create(:account)
    @user.payees << FactoryGirl.create(:payee)
  end

  describe "#new" do
    it "assigns a new payment as @payment that belongs to the current user" do
      get :new
      assigns(:payment).should be_a_new(Payment)
      assigns(:payment).user.should eq(@user)
    end
  end

  describe "#create" do
    describe "with valid params" do
      it "creates a new payment and transactions with existing payee" do
        p = FactoryGirl.attributes_for(:payment, 
          :payee_name => @user.payees.first.name,
          :account_id => @user.accounts.first.id,
          :amount => 123.45, 
          :category_id => FactoryGirl.create(:category).id)
        post :create, :payment => p
        assigns(:payment).should be_a(Payment)
        assigns(:payment).transactions.count == 2
        assigns(:payment).user.should eq(@user)
        assigns(:payment).transactions.first.should be_persisted
        assigns(:payment).transactions.last.should be_persisted
        assigns(:payment).payee.should eq(@user.payees.first)
      end

      it "creates new payment, transactions and payee with non-existing payee" do
        p = FactoryGirl.attributes_for(:payment,
          :payee_name => "New Payee",
          :account_id => @user.accounts.first.id,
          :amount => 123.45,
          :category_id => FactoryGirl.create(:category).id)
        post :create, :payment => p
        assigns(:payment).should be_a(Payment)
        assigns(:payment).transactions.count == 2
        assigns(:payment).transactions.first.should be_persisted
        assigns(:payment).transactions.last.should be_persisted
        assigns(:payment).user.should eq(@user)
        assigns(:payment).payee.name.should  == "New Payee"
        assigns(:payment).payee.should be_persisted
      end
    end
  end
end
