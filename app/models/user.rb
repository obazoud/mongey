class User
  include Mongoid::Document

  field :username, :type => String
  field :email, :type => String
  field :admin, :type => Boolean
  field :password_hash, :type => String
  field :password_salt, :type => String
end
