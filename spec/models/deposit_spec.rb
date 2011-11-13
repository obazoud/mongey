require 'spec_helper'

describe Deposit do
  describe 'document' do
    it { should belong_to(:payer).of_type(Payee) }
    it { should belong_to(:account).of_type(Account) }
  end
end


