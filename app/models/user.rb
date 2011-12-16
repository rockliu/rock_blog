class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :username
  field :password
  field :email

  auto_increment :id
end
