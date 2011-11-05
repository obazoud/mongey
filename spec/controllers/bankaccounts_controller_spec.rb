require 'spec_helper'

describe BankaccountsController do

  describe "#index" do
    context 'user signed in' do
      before do
        user = FactoryGirl.create(:user)
        log_in user
      end

      it "succeeds" do
        get 'index'
        response.should be_success
      end
    end

    context 'user signed out' do
      before do
        log_out
      end

      it "does not succeed" do
        get 'index'
        response.should_not be_success
      end
    end
  end

  describe "#show" do
    context 'user signed in' do
      before do
        user = FactoryGirl.create(:user)
        log_in user
      end
        
      it "succeeds" do
        get 'index'
        response.should be_success
      end
    end

    context 'user signed out' do
      before do
        log_out
      end

      it "does not succeed" do
        get 'index'
        response.should_not be_success
      end
    end
  end
end
