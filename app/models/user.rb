class User < ActiveRecord::Base
	has_many :places
	has_many :votes
	has_many :reviews


	def self.create_or_find_user_from_oauth(oauth_hash)
	  user = self.find_by_email(oauth_hash.email)
	  unless user
	    user = self.create(name: oauth_hash.name,
	                       gravatar: oauth_hash.gravatar,
	                       email: oauth_hash.email)
	  end
	  user
	end
	
end
