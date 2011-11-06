class Payment < Event
  belongs_to :account
  belongs_to :payee

  attr_reader :payee_name
  attr_reader :amount
  attr_reader :category_id
end
