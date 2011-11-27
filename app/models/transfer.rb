class Transfer < Event
  belongs_to :from_account, :class_name => "Account"
  belongs_to :to_account, :class_name => "Account"

  def build_transactions(opts = {})
    # credit transaction
    credit = {
      :memo => opts[:memo],
      :operation_date => opts[:operation_date],
      :credit_amount => opts[:amount],
      :debit_amount => 0.ones,
      :account_id => opts[:to_account_id]
    }
    self.transactions.new credit
    
    # debit transaction
    debit = credit.merge({
      :credit_amount => 0.ones,
      :debit_amount => opts[:amount],
      :account_id => opts[:from_account_id]
    })
    self.transactions.new debit
  end
end
