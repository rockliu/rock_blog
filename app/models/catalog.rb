class Catalog
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name

  auto_increment :id

  has_many :articles
end
