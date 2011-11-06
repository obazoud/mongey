require 'spec_helper'

describe User do
  describe 'fields' do
    it 'include username, email, password_hash & password_salt' do
      should have_fields(:username, :email, :password_hash, :password_salt).of_type(String)
    end
  
    it 'include admin with default value false' do
      should have_fields(:admin).of_type(Boolean).with_default_value_of(false)
    end
  end

  describe 'validation' do
    it 'validate presence of username and email' do
      should validate_presence_of( :username )
      should validate_presence_of( :email )
    end

    it 'validate uniqueness of username and email' do
      should validate_uniqueness_of( :username )
      should validate_uniqueness_of( :email )
    end

    it 'validate presence of password' do
      should validate_presence_of( :password )
    end

    it 'validate presence of currency' do
      should validate_presence_of( :currency )
    end
  end

  describe 'document' do
    it 'is timestamped' do
      should be_timestamped_document
    end
    it 'is paranoid' do
      should be_paranoid_document
    end
  end

  describe 'authentication' do
    it 'authenticate with matching username and password' do
      user = Factory(:user, :username => 'b1', :password => 'verysecret')
      User.authenticate('b1', 'verysecret').should == user
    end

    it 'does not authenticate with incorrect password' do
      user = Factory(:user, :username => 'b2', :password => 'extremlysecret')
      User.authenticate('b2', 'verysecret').should be_nil
    end
  end
end
