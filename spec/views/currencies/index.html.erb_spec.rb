require 'spec_helper'

describe "currencies/index.html.erb" do
  before(:each) do
    assign(:currencies, [
      stub_model(Currency,
        :code => "Code",
        :prefix => "Prefix",
        :suffix => "Suffix",
        :thousand_separator => "Thousand Separator",
        :decimal_point => "Decimal Point"
      ),
      stub_model(Currency,
        :code => "Code",
        :prefix => "Prefix",
        :suffix => "Suffix",
        :thousand_separator => "Thousand Separator",
        :decimal_point => "Decimal Point"
      )
    ])
  end

  it "renders a list of currencies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prefix".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Suffix".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Thousand Separator".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Decimal Point".to_s, :count => 2
  end
end
