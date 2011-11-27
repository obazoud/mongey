class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name, :type => String
  field :opening_date, :type => Date
  field :opening_balance, :type => Money, :default => 0.ones
  field :balance, :type => Money, :default => 0.ones

  attr_accessor :initial_balance
  attr_reader :currency_id

  validates :name, :presence => true
  validates :opening_date, :presence => true
  validates :initial_balance, :presence => {:on => :create},
                              :numericality => {:on => :create}

  has_many :transactions
  belongs_to :user
  belongs_to :currency

  validates_associated :currency

  before_save :set_balance
  
  def process_transaction(transaction)
    balance = self.balance + transaction.credit - transaction.debit
    update_attributes(:balance => balance)
  end

private
  def set_balance
    if initial_balance.present?
      self.opening_balance = Money.new_from_ones(initial_balance.to_f)
      self.balance = Money.new_from_ones(initial_balance.to_f)
    end
  end
end
