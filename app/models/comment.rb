class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :body

  auto_increment :id

  embedded_in :article
end
