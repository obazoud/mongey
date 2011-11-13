require 'spec_helper'

describe Event do
  describe 'document' do
    it { should have_fields( :operation_date ).of_type(Date) } 
    it { should have_fields( :memo ).of_type(String) }
    it { should belong_to(:user).of_type(User) }
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
