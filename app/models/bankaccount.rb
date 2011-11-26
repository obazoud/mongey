class Bankaccount < Account
  field :number, :type => String
  field :bank, :type => String
  field :interest_rate, :type => Float
  field :credit_limit, :type => Money
end
