require 'spec_helper'

describe "currencies/show.html.erb" do
  before(:each) do
    @currency = assign(:currency, stub_model(Currency,
      :code => "Code",
      :prefix => "Prefix",
      :suffix => "Suffix",
      :thousand_separator => "Thousand Separator",
      :decimal_point => "Decimal Point"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prefix/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Suffix/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Thousand Separator/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Decimal Point/)
  end
end
