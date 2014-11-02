class Vote < ActiveRecord::Base

    validates_uniqueness_of :user_id, scope: [:voteable_id, :voteable_type], message: "There can only be one!!!"

	belongs_to :voteable, polymorphic: true
	belongs_to :user
end
