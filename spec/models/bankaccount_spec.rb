require 'spec_helper'

describe Bankaccount do
  describe 'document' do
    it { should have_fields( :number, :bank ).of_type(String) }
    it { should have_fields( :interest_rate, :credit_limit ).of_type(BigDecimal) }
  end
end
