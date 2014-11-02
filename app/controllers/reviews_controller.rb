class ReviewsController < ApplicationController
  include SessionsHelper

	def index #don't really need this
		@place = Place.find(params[:place_id])
		@review = Review.new
	end

	def new
		@place = Place.find(params[:place_id])
		@review = Review.new
	end

	def create
		# if request.xhr?
		  @user = current_user
		  @place = Place.find(params[:place_id])
			@review = Review.new(review_params)
			@review.place_id = @place.id
			@review.user_id = @user.id
			if @review.save
				redirect_to place_path(params[:place_id])

				# return @review.to_json
			else
				redirect_to place_path(categories_path)#idk where to redirect to
			end
		# else
		# 	redirect_to place_path(@review.place)
		# end
	end

	def edit
		@review = Review.find(params[:id])
		if @review.user_id != session[:user_id]
		  redirect_to place_path(@review.place)
		end
	end

	def update
		@review = Review.find(params[:id])
		if request.xhr?
		  @review.update_attribute(review_params)
		  return @review.to_json
		else
			redirect_to place_path(@review.place)
		end
	end

	private

	def review_params
		params.require(:review).permit(:description, :user_id, :place_id)
	end
end
