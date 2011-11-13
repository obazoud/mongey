require 'spec_helper'

describe HomeController do

  describe "#index" do
    context "user signed in" do
      before do
        user = FactoryGirl.create(:user)
        log_in user
      end

      it "returns http success" do
        get :index
        response.should be_success
      end
    end

    context "user signed out" do
      before do
        log_out
      end

      it "returns http success" do
        get :index
        response.should be_success
      end
    end
  end
end
