class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name, :type => String
  field :opening_date, :type => Date
  field :opening_balance, :type => Money, :default => 0.ones
  field :balance, :type => Money, :default => 0.ones

  attr_accessor :redis_balance
  attr_reader :currency_id

  validates_presence_of :name, :opening_date

  has_many :transactions
  belongs_to :user
  belongs_to :currency

  validates_associated :currency

  after_create :create_redis_record
private

  def save_redis
    if redis_balance.present?
      $rn.set redis_key(:balance), redis_balance
    end
  end
  
  def create_redis_record
    
  end

  def redis_key(key)
    key = key.to_s if key.is_a? Symbol
    "account:#{self.id}:#{key}"
  end
end
