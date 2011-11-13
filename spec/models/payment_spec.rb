require 'spec_helper'

describe Payment do
  describe 'document' do
    it { should belong_to(:payee).of_type(Payee) }
    it { should belong_to(:account).of_type(Account) }
  end
end


