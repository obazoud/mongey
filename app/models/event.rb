class Event
  include Mongoid::Document

  field :operation_date, :type => Date
  field :memo, :type => String

  attr_accessor :amount

  has_many :transactions
  belongs_to :user

  validates :operation_date, :presence => true
  validates :user, :presence => true
  validates :amount, :presence => {:on => :create},
                     :numericality => true
end
