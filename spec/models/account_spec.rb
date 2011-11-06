require 'spec_helper'

describe Account do

  describe 'fields' do
    it 'should include String name, opening_balance and balance' do
      should have_fields( :name ).of_type(String)
    end
  
    it 'inlude Date opening_date' do
      should have_fields( :opening_date ).of_type(Date)
    end

    it 'include BigDecimal opening_balance and balance with default value of 0.0' do
      should have_fields( :opening_balance, :balance).of_type(BigDecimal).with_default_value_of(0.0)
    end
  end

  describe 'validation' do
    it 'should validate presence of name and opening_date' do
      should validate_presence_of(:name)
      should validate_presence_of(:opening_date)
    end
  end

  describe 'document' do
    it 'should be timestamped' do
      should be_timestamped_document
    end

    it 'should be paranoid' do
      should be_paranoid_document
    end
  end
end
