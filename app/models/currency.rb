class Currency
  include Mongoid::Document
  include Mongoid::Paranoia

  field :code, :type => String
  field :prefix, :type => String
  field :suffix, :type => String
  field :thousand_separator, :type => String
  field :decimal_point, :type => String

  has_many :accounts
  has_many :users

  def format(amount)
    a = '%.2f' % amount
    "#{prefix}#{a}#{suffix}"    
  end
end
