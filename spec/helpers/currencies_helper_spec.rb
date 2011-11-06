require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CurrenciesHelper. For example:
#
# describe CurrenciesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end

describe CurrenciesHelper do
  describe "#format_currency" do
    it 'formats a value with provided currency' do
      value = 1234.56
      currency = Factory.build(:complete_currency)
      helper.format_currency(value, currency).should == currency.format(value)
    end

    it 'formats to 2 decimals if no currency is given' do
      value = 1234.567
      helper.format_currency(value, nil).should == "1234.57"
    end

    it 'return "0.00" if value is nil' do
      helper.format_currency(nil, nil).should == "0.00"
    end
  end
end
