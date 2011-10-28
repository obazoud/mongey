require 'spec_helper'

describe "Accounts" do
  describe "GET /accounts" do
    it "displays accounts" do
      Account.create!(:name => "Bank account")
      visit accounts_path
      page.should have_content("Bank account")
    end
  end

  describe "POST /accounts" do
    it "create account" do
      visit new_account_path
      fill_in "New Account", :with => "Bank account"
      click_button "Create account"
      response.body.should include("Successfully created account")
      response.body.should include("Bank account")
    end
  end
end
