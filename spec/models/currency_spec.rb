require 'spec_helper'

describe Currency do
  describe 'document' do
    it { should have_fields( :code, :prefix, :suffix ).of_type(String) }
    it { should have_fields( :thousand_separator, :decimal_point ).of_type(String) }
    it { should be_paranoid_document }
  end

  describe "validation" do
    it "validate presence and uniqueness of code" do
      should validate_presence_of(:code)
      should validate_uniqueness_of(:code)
    end
  end
end
