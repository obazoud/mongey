require 'spec_helper'

describe Bankaccount do
  describe 'document' do
    it { should have_fields( :number, :bank ).of_type(String) }
    it { should have_fields( :interest_rate ).of_type(Float) }
    it { should have_fields( :credit_limit ).of_type(Money) }
  end
end
