require 'spec_helper'

describe Payment do
  describe 'fields' do
  end

  describe 'relations' do
    it 'belongs to payee' do
      should belong_to(:payee).of_type(Payee)
    end

    it 'belongs to account' do
      should belong_to(:account).of_type(Account)
    end
  end

  describe 'validation' do
  end
end


