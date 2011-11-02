require 'spec_helper'

describe "Accounts" do
  describe "GET /accounts" do
    it "displays accounts" do
      Account.create!(:name => 'Wishing well', :opening_date => '2011-01-01')
      visit accounts_path
      page.should have_content("Wishing well")
    end
  end

  describe "GET /accounts/new" do
    it "let's you choose account type" do
      visit new_account_path
      page.should have_content("Choose type")
    end
  end
end
