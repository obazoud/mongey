class Event
  include Mongoid::Document

  field :operation_date, :type => Date
  field :memo, :type => String

  has_many :transactions
  belongs_to :user

  validates_presence_of :operation_date
  validates_presence_of :user
end
