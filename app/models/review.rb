class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	has_many :votes, as: :voteable

	def score
		self.votes.inject(0) {|sum, vote| vote.upvote? ? sum + 1 : sum - 1 }
	end
end
