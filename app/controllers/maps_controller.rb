class MapsController < ActionController::Base

	def show
		
	end

	def create
	end

	def edit
	end

	def index

		# def searchify_string(input)
		# 	@map = input.gsub(/ /, '%20') 
		# end

		search_input="307 lake street"

		@map = Map.searchify_string(search_input)

		# @address = 




		# @map="Chipotle%20Mexican%20Grill%2C%20West%20Lake%20Street"
	end

	def script

		# def distance_between_coordinates(first_coord, second_coord)
		# 	#coord are an array of two numbers, [lat, long]
		# 	lat_difference = first_coord[0] - second_coord[0]
		# 	long_difference = first_coord[1] - second_coord[1] 
			
		# 	distance_squared = (lat_difference**2) + (long_difference**2)

		# 	Math.sqrt(distance_squared)
		# end



		 @square = Map.directions_from_address_json("351 w hubbard st chicago, il","307 w lake street chicago, il")
	end

	def new
	end

	def update
	end
end