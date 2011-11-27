require 'spec_helper'

describe DepositsController do
  before do
    @user = FactoryGirl.create(:user)
    log_in @user

    @user.accounts << FactoryGirl.create(:account)
    @user.payees << FactoryGirl.create(:payee)
  end

  describe "#new" do
    it "assigns a new deposit as @deposit that belongs to the current user" do
      get :new
      assigns(:deposit).should be_a_new(Deposit)
      assigns(:deposit).user.should eq(@user)
    end
  end

  describe "#create" do
    describe "with valid params" do
      it "creates a new deposit and transactions with existing payer" do
        p = FactoryGirl.attributes_for(:deposit, 
          :payer_name => @user.payees.first.name,
          :account_id => @user.accounts.first.id,
          :amount => 123.45, 
          :category_id => FactoryGirl.create(:category).id)
        post :create, :deposit => p
        assigns(:deposit).should be_a(Deposit)
        assigns(:deposit).transactions.count == 2
        assigns(:deposit).user.should eq(@user)
        assigns(:deposit).transactions.first.should be_persisted
        assigns(:deposit).transactions.last.should be_persisted
        assigns(:deposit).payer.should eq(@user.payees.first)
      end

      it "creates new deposit, transactions and payee with non-existing payer" do
        p = FactoryGirl.attributes_for(:deposit,
          :payer_name => "New Payer",
          :account_id => @user.accounts.first.id,
          :amount => 123.45,
          :category_id => FactoryGirl.create(:category).id)
        post :create, :deposit => p
        assigns(:deposit).should be_a(Deposit)
        assigns(:deposit).transactions.count == 2
        assigns(:deposit).transactions.first.should be_persisted
        assigns(:deposit).transactions.last.should be_persisted
        assigns(:deposit).user.should eq(@user)
        assigns(:deposit).payer.name.should  == "New Payer"
        assigns(:deposit).payer.should be_persisted
      end
    end
  end
end
