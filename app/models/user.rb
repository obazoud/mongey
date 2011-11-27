class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :username, :type => String
  field :email, :type => String
  field :admin, :type => Boolean, :default => false
  field :password_hash, :type => String

  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessible :currency_id
  attr_accessor :password

  before_save :encrypt_password

  has_many :accounts
  has_many :bankaccounts
  has_many :payees

  has_many :events
  has_many :payments
  has_many :deposits

  belongs_to :currency

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, :presence => true,
                       :uniqueness => true,
                       :length => { :within => 2..50 }

  validates :email,    :presence => true,
                       :uniqueness => { :case_sensitive => false },
                       :format => { :with => email_regex }

  validates :password, :presence => { :on => :create },
                       :confirmation => true,
                       :length => { :minimum => 6 }

  validates_presence_of :currency

  def has_password?(submitted_password)
    password_hash == BCrypt::Engine.hash_secret(submitted_password, password_hash)
  end

  def self.authenticate(username, password)
    user = where(username: username).first
    if user && user.has_password?(password)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_hash = BCrypt::Engine.hash_secret(password, BCrypt::Engine.generate_salt)
    end
  end
  
  def build_payment(opts = {})
    opts[:user_id] = self.id
    opts[:payee] = self.payees.where(name: opts[:payee_name]).first ||
                   self.payees.create!(:name => opts[:payee_name], 
                                       :opening_date => Time.now, 
                                       :initial_balance => 0.0)

    new_payment = Payment.new(opts)
    new_payment.build_transactions(opts)
    new_payment
  end

  def process_event(event)
    event.transactions.each do |t|
      a = t.account
      a.process_transaction(t)
    end
  end
end
