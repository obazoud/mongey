require 'spec_helper'

describe "currencies/new.html.erb" do
  before(:each) do
    assign(:currency, stub_model(Currency,
      :code => "MyString",
      :prefix => "MyString",
      :suffix => "MyString",
      :thousand_separator => "MyString",
      :decimal_point => "MyString"
    ).as_new_record)
  end

  it "renders new currency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => currencies_path, :method => "post" do
      assert_select "input#currency_code", :name => "currency[code]"
      assert_select "input#currency_prefix", :name => "currency[prefix]"
      assert_select "input#currency_suffix", :name => "currency[suffix]"
      assert_select "input#currency_thousand_separator", :name => "currency[thousand_separator]"
      assert_select "input#currency_decimal_point", :name => "currency[decimal_point]"
    end
  end
end
