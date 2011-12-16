class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  
  :name

  auto_increment :id

  has_and_belongs_to_many :article
end
