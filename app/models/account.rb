class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name
  field :opening_date, :type => Date
  field :opening_balance, :type => Float
  field :balance, :type => Float

  validates_presence_of :name, :opening_date

  has_many :transactions
  belongs_to :currency

  validates_associated :currency

  attr_reader :currency_id
end
