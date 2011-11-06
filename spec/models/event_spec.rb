require 'spec_helper'

describe Event do
  describe 'fields' do
    it 'include Date operation_date' do
      should have_fields( :operation_date ).of_type(Date)
    end

    it 'include String memo' do
      should have_fields( :memo ).of_type(String)
    end
  end

  describe 'validation' do
    it 'validates presence of operation_date' do
      should validate_presence_of( :operation_date )
    end

    it 'validates presence of user' do
      should validate_presence_of( :user )
    end
  end
end
