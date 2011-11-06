require 'spec_helper'

describe Payee do
  describe 'fields' do
    it 'include String customer_number and notes' do
      should have_fields( :customer_number, :notes ).of_type(String)
    end
  end
end
