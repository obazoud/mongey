class Transaction
  include Mongoid::Document

  field :memo, :type => String
  field :credit, :type => Money
  field :debit, :type => Money
  field :operation_date, :type => Date
  
  attr_accessor :credit_amount, :debit_amount

  belongs_to :account
  belongs_to :category
  belongs_to :event

  validates :operation_date, :presence => true
  validates :credit_amount,  :presence => {:on => :create},
                             :numericality => {:on => :create}
  validates :debit_amount,   :presence => {:on => :create},
                             :numericality => {:on => :create}

  validates_presence_of :account, :event
  
  before_save :setup_amounts
  
  def setup_amounts
    self.credit = Money.new_from_ones(credit_amount.to_f) if credit_amount.present?
    self.debit = Money.new_from_ones(debit_amount.to_f) if debit_amount.present?
  end
end
