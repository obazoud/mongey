class Bankaccount < Account
  field :number, :type => String
  field :bank, :type => String
  field :interest_rate, :type => BigDecimal
  field :credit_limit, :type => BigDecimal
end
