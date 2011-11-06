require 'spec_helper'

describe Transaction do
  describe 'fields' do
    it 'include memo' do
      should have_fields( :memo ).of_type(String)
    end

    it 'include credit and debit' do
      should have_fields( :credit, :debit ).of_type(BigDecimal)
    end
  end

  describe 'validation' do
    it 'validates presence of credit and debit' do
      should validate_presence_of(:credit)
      should validate_presence_of(:debit)
    end

    it 'validates numericality of credit and debit' do
      should validate_numericality_of(:credit)
      should validate_numericality_of(:debit)
    end

    it 'validates presence of event' do
      should validate_presence_of(:event)
    end

    it 'validates presence of category' do
      should validate_presence_of(:event)
    end

    it 'validates presence of account' do
      should validate_presence_of(:event)
    end
  end
end
