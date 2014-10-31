class Map < ActiveRecord::Base
	has_many :places


	def self.searchify_string(input)
		# URI::escape(input)
		input.gsub(/ /, '%20')
	end

	def self.address_to_coordinates(address)
		address_json = JSON.parse(Net::HTTP.get(URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{URI::escape(address)}")))
		address_json["results"][0]["geometry"]["location"]
	end

	def self.distance_json_coord(first_coord, second_coord)
	  uri = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{URI::escape(first_coord)}&destinations=#{URI::escape(second_coord)}&key=AIzaSyBOE5A3JBjh3Ho8FJ4pcddwSgl3rHE-fQs&avoid=highways&mode=walking")
	  JSON.parse(Net::HTTP.get(uri))
	end

	def self.distance_json_address(first_address, second_address)
	  start_location = "#{first_address["lat"]},#{first_address["lng"]}"
	  destinations_url = "#{self.address_to_coordinates(second_address)}"
	  uri = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{URI::escape(start_location)}&destinations=#{URI::escape(destinations_url)}&key=AIzaSyBOE5A3JBjh3Ho8FJ4pcddwSgl3rHE-fQs&avoid=highways&mode=walking")
	  JSON.parse(Net::HTTP.get(uri))
	end

	def self.directions_from_address_json(start_address, end_address, mode = "walking")
	  uri = URI("https://maps.googleapis.com/maps/api/directions/json?origin=#{URI::escape(start_address)}&destination=#{URI::escape(end_address)}&key=AIzaSyBOE5A3JBjh3Ho8FJ4pcddwSgl3rHE-fQs&avoid=highways&mode=#{mode}")
	  JSON.parse(Net::HTTP.get(uri))
	end

end