class Payment < Event
  attr_reader :from_account_id
  attr_reader :payee
  attr_reader :payee_id
  attr_reader :amount
  attr_reader :category_id
end
