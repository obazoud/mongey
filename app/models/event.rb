class Event
  include Mongoid::Document
  field :operation_date, :type => Date
  field :memo, :type => String
  has_many :transactions
end
