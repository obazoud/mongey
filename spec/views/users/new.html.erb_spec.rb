require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :username => "",
      :email => "",
      :admin => "",
      :password_hash => "",
      :password_salt => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_admin", :name => "user[admin]"
      assert_select "input#user_password_hash", :name => "user[password_hash]"
      assert_select "input#user_password_salt", :name => "user[password_salt]"
    end
  end
end
