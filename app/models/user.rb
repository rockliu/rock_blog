class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String 
  field :name, type: String
  field :email, type: String

  attr_accessible :provider,:uid,:name,:email

  self.create_with_omniauth(auth)
  	create! do |user|
  		user.provider = auth['provider']
  		user.uid = auth['uid']
  		if auth['info']
  			user.name = auth['info']['name'] || auth['info']['nickname'] ||""
  			user.email = auth['info']['email'] || ""
  		end
  	end
  end
end