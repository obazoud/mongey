class Transaction
  include Mongoid::Document
  field :memo, :type => String
  field :credit, :type => Float
  field :debit, :type => Float
  belongs_to :account
  belongs_to :category
  belongs_to :event
end
