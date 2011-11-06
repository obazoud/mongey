class Transaction
  include Mongoid::Document

  field :memo, :type => String
  field :credit, :type => BigDecimal
  field :debit, :type => BigDecimal

  belongs_to :account
  belongs_to :category
  belongs_to :event

  validates_presence_of :credit, :debit
  validates_numericality_of :credit, :debit

  validates_presence_of :account, :category, :event
end
