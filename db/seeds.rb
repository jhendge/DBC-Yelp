# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


################ Sample Places ################
chipotle = Place.create!(description: "\"It's pronounced 'Chip-po-tlay'.\"", 
						 user_id: 1, 
						 name: "Chipotle", 
						 address: "233 W Lake St, Chicago, IL, 60606", 
						 phone: "(312) 263-6230", 
						 website: "http://chipotle.com"
						 )

blackwood = Place.create!(name: "Blackwood", 
						  user_id: 3, 
						  address: "305 W Lake Street, Chicago, IL, 60606",
						  phone: "(312) 621-9663",
						  website: "http://blackwoodbbq.com",
						  description: "That mac 'n cheese tho.")

cosi = Place.create!(name: "Cosi",
					 user_id: 3,
					 address: "203 North LaSalle Street, Chicago, IL, 60601",
					 phone: "(312) 368-4400",
					 website: "https://getcosi.com/",
					 description: "Expensive sandwiches")

subway = Place.create!(name: "Subway",
					   user_id: 3,
					   address: "414 N Orleans St, Chicago, IL, 60654",
					   phone: "0000000000",
					   website: "http://www.subway.com",
					   description: "5 dollar foot-long")

mexican = Category.create!(name: "Mexican")
bbq = Category.create!(name: "BBQ")
sammich = Category.create!(name: "Sandwiches")
pizza = Category.create!(name: "Pizza")
burg = Category.create!(name: "Burgers")
coffee = Category.create!(name: "Coffee")

sammich.places << cosi
sammich.places << subway

burrito = Photo.create!(place_id: 1, url: "http://www.fizzgrid.com/wp-content/uploads/2014/03/double-wrap.jpg", description: "a delicious, savory meal within the confines of a flour tortilla")
tacos = Photo.create!(place_id: 1, url: "http://www.mjandhungryman.com/wp-content/uploads/2013/05/Chipotle-Marinated-Chicken-blog1.jpg", description: "unlike burritos, tacos are meant to be served in multiples of three...")
chinchilla = Photo.create!(place_id: 1, url: "http://smilingpaws.files.wordpress.com/2014/01/chinchilla-baby-drinking-milk1.jpg", description: "not quite a chimichanga... it's a chinchilla")
patrons = Photo.create!(place_id: 1, url: "http://static3.businessinsider.com/image/5356555a6da8117c6a198ea3-480/chipotle.jpg", description: "weirdos.")
################## peeps ######################
shomari = User.create!(name: "shomari")

