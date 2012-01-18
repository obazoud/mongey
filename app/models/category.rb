class Category
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String

  belongs_to :parent, class_name: "Category", inverse_of: :children
  has_many :children, class_name: "Category", inverse_of: :parent

  scope :parents, where(parent_id: nil)
  validates_presence_of :name
 
  has_many :transactions
end
