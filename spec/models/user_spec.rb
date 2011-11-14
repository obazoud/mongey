require 'spec_helper'

describe User do
  def valid_attributes
    FactoryGirl.attributes_for(:user, :currency_id => FactoryGirl.create(:currency).id)
  end

  describe 'document' do
    it { should have_fields(:username, :email, :password_hash).of_type(String) }
    it { should have_fields(:admin).of_type(Boolean).with_default_value_of(false) }

    it { should belong_to(:currency).of_type(Currency) }
    it { should have_many(:accounts).of_type(Account) }
    it { should have_many(:bankaccounts).of_type(Bankaccount) }
    it { should have_many(:payees).of_type(Payee) }
    it { should have_many(:events).of_type(Event) }
    it { should have_many(:payments).of_type(Payment) }
    it { should have_many(:deposits).of_type(Deposit) }

    it { should be_timestamped_document }
    it { should be_paranoid_document }
  end

  it 'creates a new instance given valid_attributes' do
    User.create!(valid_attributes)
  end

  it 'requires a username' do
    no_username_user = User.new(valid_attributes.merge(:username => ""))
    no_username_user.should_not be_valid
  end

  it 'requires a email' do
    no_email_user = User.new(valid_attributes.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it 'rejects already existing username' do
    User.create!(valid_attributes.merge(:username => 'philip'))
    invalid_user = User.new(valid_attributes.merge(:username => 'philip'))
    invalid_user.should_not be_valid
  end

  it 'rejects usernames that are to long' do
    long_username = "a" * 51
    long_username_user = User.new(valid_attributes.merge(:username => long_username))
    long_username_user.should_not be_valid
  end

  it 'rejects usernames that are to short' do
    short_username_user = User.new(valid_attributes.merge(:username => "a"))
    short_username_user.should_not be_valid
  end

  it 'rejects already existing email' do
    User.create!(valid_attributes.merge(:email => 'philip@example.com'))
    invalid_user = User.new(valid_attributes.merge(:email => 'philip@example.com'))
    invalid_user.should_not be_valid
  end

  it 'rejects email addresses identical up to case' do
    email = 'philippa@example.com'
    User.create!(valid_attributes.merge(:email => email))
    invalid_user = User.new(valid_attributes.merge(:email => email.upcase))
    invalid_user.should_not be_valid
  end

  it 'accept valid email addresses' do
    addresses = %w[user@foo.com THE_USER@foo.bar.com first.last@foo.jp usr@some.museum]
    addresses.each do |address|
      valid_user = User.new(valid_attributes.merge(:email => address))
      valid_user.should be_valid
    end
  end

  it 'rejects invalid email addresses' do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_user = User.new(valid_attributes.merge(:email => address))
      invalid_user.should_not be_valid
    end
  end

  it 'requires a password' do
    user = User.new(valid_attributes.merge(:password => "", :password_confirmation => ""))
    user.should_not be_valid
  end

  it 'requires a matching password confirmation' do
    user = User.new(valid_attributes.merge(:password_confirmation => "invalidconfirmation"))
    user.should_not be_valid
  end

  it 'rejects short passwords' do
    short = "a" * 5
    attr = valid_attributes.merge(:password => short, :password_confirmation => short)
    user = User.new(attr)
    user.should_not be_valid
  end
  
  describe 'password encryption' do
    before(:each) do
      @user = User.create!(valid_attributes)
    end
    
    it 'should have a password_hash attribute' do
      @user.should respond_to(:password_hash)
    end
    
    it 'should set the password_hash' do
      @user.password_hash.should_not be_blank
    end
    
    describe 'has_password? method' do
      it 'should return true if the passwords match' do
        @user.has_password?(valid_attributes[:password]).should be_true
      end
      
      it 'should return false if the passwords dont match' do
        @user.has_password?("invalid").should be_false
      end
    end
  end

  it 'validate presence of currency' do
    should validate_presence_of( :currency )
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
