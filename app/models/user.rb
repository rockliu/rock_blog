class User
  include Mongoid::Document
  field :username
  field :password
  field :email
  auto_increment :id
end
