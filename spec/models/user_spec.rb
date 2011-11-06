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

  describe 'relations' do
    it 'belongs to currency' do
      should belong_to(:currency).of_type(Currency)
    end

    it 'has many accounts, bankaccounts and payees' do
      should have_many(:accounts).of_type(Account)
      should have_many(:bankaccounts).of_type(Bankaccount)
      should have_many(:payees).of_type(Payee)
    end

    it 'has many events, payments and deposits' do
      should have_many(:events).of_type(Event)
      should have_many(:payments).of_type(Payment)
      should have_many(:deposits).of_type(Deposit)
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
