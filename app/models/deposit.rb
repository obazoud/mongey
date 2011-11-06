class Deposit < Event
  belongs_to :account
  belongs_to :payer, :class_name => 'Payee'

  attr_reader :payer_name
  attr_reader :amount
  attr_reader :category_id
end
