require 'spec_helper'

describe Bankaccount do
  describe 'fields' do
    it 'include Strings: number and bank' do
      should have_fields( :number, :bank ).of_type(String)
    end

    it 'include Floats: interest_rate and credit_limit' do   
      should have_fields( :interest_rate, :credit_limit ).of_type(BigDecimal)
    end
  end

  describe 'validation' do

  end

end
