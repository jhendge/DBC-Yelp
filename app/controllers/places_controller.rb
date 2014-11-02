class PlacesController < ApplicationController
	include SessionsHelper

	def index
		@places = Place.all
		@vote = Vote.new
	end


	def show
		@place = Place.find(params[:id])
		render :show, :layout => false
	end

	def create
		@place = Place.new(params_place)
		@place.user_id = current_user.id # UserHelper method
		if request.xhr?
			# Return some JSON stuff
		else
			if @place.valid?
				@place.save
				return redirect_to place_path(@place)
			else
				@error = "That don't be right."
				#return render :"places/form"
			end
		end
	end

	def edit
		# should only get called if JS is disabled
		@place = Place.find(params[:id])
		#return redirect_to edit_place_path(@place)
	end


	def new
		@place = Place.new

	end

	# def update
	# 	@place = Place.find(params[:id])
	# 	if request.xhr?
	# 		# AJAX stuff
	# 	else
	# 		if @place.update_attributes(params_place)
	# 			return redirect_to place_path(@place)
	# 		end
	# 	end
	# end

	def destroy
		place = Place.find(params[:id])
		place.destroy
		return redirect_to root_url
	end

	def update
		@place = Place.find(params[:place_id])
		@place.incremenet(:votes)
		@place.save
		redirect_to place_path
	end

	private

	def params_place
		params.require(:place).permit(:category, :name, :address, :city, :state, :zipcode, :phone, :website, :description)
	end
end
