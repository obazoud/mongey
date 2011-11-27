require 'spec_helper'

describe Transaction do
  describe 'document' do
    it { should have_fields( :memo ).of_type(String) }
    it { should have_fields( :credit, :debit ).of_type(Money) }
  end

  describe 'validation' do
    it 'validates presence of credit_amount and debit_amount' do
      should validate_presence_of(:credit_amount)
      should validate_presence_of(:debit_amount)
    end

    it 'validates numericality of credit_amount and debit_amount' do
      should validate_numericality_of(:credit_amount)
      should validate_numericality_of(:debit_amount)
    end

    it 'validates presence of event' do
      should validate_presence_of(:event)
    end

    it 'validates presence of account' do
      should validate_presence_of(:account)
    end
  end
end
