class Payment < Event
  belongs_to :account
  belongs_to :payee

  attr_accessor :payee_name
  attr_reader :category_id
  
  validates :payee_name, :presence => {:on => :create}

  def build_transactions(opts = {})
    # credit transaction
    credit = {
      :memo => opts[:memo],
      :operation_date => opts[:operation_date],
      :credit_amount => opts[:amount],
      :debit_amount => 0.ones,
      :account_id => opts[:payee].id,
      :category_id => opts[:category_id]
    }
    self.transactions.new credit
    
    # debit transaction
    debit = credit.merge({
      :credit_amount => 0.ones,
      :debit_amount => opts[:amount],
      :account_id => opts[:account_id]
    })
    self.transactions.new debit
  end
end