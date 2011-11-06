require 'spec_helper'

describe Currency do
  describe "fields" do
    it "include Strings: code, prefix, suffix, thousand_separator and decimal_point" do
      should have_fields( :code, :prefix, :suffix, :thousand_separator, :decimal_point).of_type(String)
    end
  end

  describe "validation" do
    it "validate presence and uniqueness of code" do
      should validate_presence_of(:code)
      should validate_uniqueness_of(:code)
    end
  end

  describe "document" do
    it "is paranoid" do
      should be_paranoid_document
    end

    pending "should maybe be timestamped?" do
      should be_timestamped_document
    end
  end
end
