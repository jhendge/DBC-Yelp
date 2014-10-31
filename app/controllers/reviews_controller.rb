class ReviewsController < ApplicationController
	def index
		@review = Review.new
	end

	def new
		@review = Review.new
	end

	def edit
		
	end
end