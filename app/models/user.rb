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
  has_many :events
  belongs_to :currency

  validates_presence_of :username, :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_uniqueness_of :username, :email

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
