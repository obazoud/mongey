class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name, :type => String
  field :opening_date, :type => Date
  field :opening_balance, :type => BigDecimal, :default => 0.0
  field :balance, :type => BigDecimal, :default => 0.0

  validates_presence_of :name, :opening_date

  has_many :transactions
  belongs_to :user
  belongs_to :currency

  validates_associated :currency

  attr_reader :currency_id
end
