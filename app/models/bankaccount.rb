class Bankaccount < Account
  field :number
  field :bank  
  field :interest_rate, :type => Float
  field :credit_limit, :type => Float
end
