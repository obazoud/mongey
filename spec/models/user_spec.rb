require 'spec_helper'

describe User do
  describe 'fields' do
    it 'should include username, email, password_hash & password_salt' do
      should have_fields(:username, :email, :password_hash, :password_salt).of_type(String)
    end
  end

  describe 'validation' do
    it 'should validate presence of username and email' do
      should validate_presence_of(:username)
      should validate_presence_of(:email)
    end

    it 'should validate presence of password' do
      should validate_presence_of(:password)
    end
  end

  describe 'document' do
    it 'should be timestamped' do
      should be_timestamped_document
    end
  end

  describe 'authentication' do
    it 'should authenticate with matching username and password' do
      user = Factory(:user, :username => 'b1', :password => 'verysecret')
      User.authenticate('b1', 'verysecret').should == user
    end

    it 'should not authenticate with incorrect password' do
      user = Factory(:user, :username => 'b2', :password => 'extremlysecret')
      User.authenticate('b2', 'verysecret').should be_nil
    end
  end
end
