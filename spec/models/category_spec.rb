require 'spec_helper'

describe Category do
  describe 'document' do
    it { should have_fields( :name, :description ).of_type(String) }
  end

  describe 'validation' do
    it 'validate presence of name' do
      should validate_presence_of( :name )
    end
  end
end
