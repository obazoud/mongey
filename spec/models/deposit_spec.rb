require 'spec_helper'

describe Deposit do
  describe 'fields' do
  end

  describe 'relations' do
    it 'belongs to payer' do
      should belong_to(:payer).of_type(Payee)
    end

    it 'belongs to account' do
      should belong_to(:account).of_type(Account)
    end
  end

  describe 'validation' do
  end
end


