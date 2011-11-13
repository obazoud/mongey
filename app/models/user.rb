class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :username, :type => String
  field :email, :type => String
  field :admin, :type => Boolean, :default => false
  field :password_hash, :type => String
  field :password_salt, :type => String

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
                       :uniqueness => true
  validates :email,    :presence => true,
                       :uniqueness => true,
                       :format => { :with => email_regex }

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_presence_of :currency
  
  scope :admins, where(:admin => false).asc(:username)

  def self.authenticate(username, password)
    user = where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
