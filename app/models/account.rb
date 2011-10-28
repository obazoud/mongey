class Account
  include Mongoid::Document
  field :name
  field :opening_date, :type => Date
  field :opening_balance, :type => Float
  field :balance, :type => Float
  validates_presence_of :name
  has_many :transactions
end
