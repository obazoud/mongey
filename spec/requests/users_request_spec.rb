require 'spec_helper'

describe "Users request" do
  it "signs user up" do
    currency = Factory(:currency)
    visit signup_path
    fill_in "Email", :with => "foobar@example.com"
    fill_in "Username", :with => "foobar"
    select(currency.code, :from =>  "user_currency_id")
    fill_in "Password", :with => "secret"
    fill_in "Password confirmation", :with => "secret"
    click_button "Create User"
    page.current_path.should eq(login_path)
    page.should have_content("User was successfully created")
  end
end
