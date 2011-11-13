require 'spec_helper'

describe Account do
  describe 'document' do
    it { should have_fields( :name ).of_type(String) }
    it { should have_fields( :opening_date ).of_type(Date) }
    it { should have_fields( :opening_balance ).of_type(BigDecimal).with_default_value_of(0.0) }
    it { should have_fields(:balance ).of_type(BigDecimal).with_default_value_of(0.0) }
    it { should be_timestamped_document }
    it { should be_paranoid_document }
  end

  describe 'validation' do
    it 'should validate presence of name and opening_date' do
      should validate_presence_of(:name)
      should validate_presence_of(:opening_date)
    end
  end
end
