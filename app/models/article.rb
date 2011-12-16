class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :body

  auto_increment :id

  has_and_belongs_to_many :tags
  embeds_many :comments
  belongs_to :catalog
end
