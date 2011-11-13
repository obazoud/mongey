require 'spec_helper'

describe Payee do
  describe 'document' do
    it { should have_fields( :customer_number, :notes ).of_type(String) }
  end
end
