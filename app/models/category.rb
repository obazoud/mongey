class Category
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String

  validates_presence_of :name
 
  has_many :transactions
end
