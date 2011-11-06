require 'spec_helper'

describe Category do
  describe 'fields' do
    it 'include String name and description' do
      should have_fields( :name, :description ).of_type(String)
    end
  end

  describe 'validation' do
    it 'validate presence of name' do
      should validate_presence_of( :name )
    end
  end
end
