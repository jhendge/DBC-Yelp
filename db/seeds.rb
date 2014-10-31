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
						 address: "233 W Lake St", 
						 phone: "(312) 263-6230", 
						 website: "http://chipotle.com"
						 )

burrito = Photo.create!(place_id: 1, url: "http://www.fizzgrid.com/wp-content/uploads/2014/03/double-wrap.jpg", description: "a delicious, savory meal within the confines of a flour tortilla")
tacos = Photo.create!(place_id: 1, url: "http://www.mjandhungryman.com/wp-content/uploads/2013/05/Chipotle-Marinated-Chicken-blog1.jpg", description: "unlike burritos, tacos are meant to be served in multiples of three...")
chinchilla = Photo.create!(place_id: 1, url: "http://smilingpaws.files.wordpress.com/2014/01/chinchilla-baby-drinking-milk1.jpg", description: "not quite a chimichanga... it's a chinchilla")
patrons = Photo.create!(place_id: 1, url: "http://static3.businessinsider.com/image/5356555a6da8117c6a198ea3-480/chipotle.jpg", description: "weirdos.")
>>>>>>> a5b513ed7258f43dcc458b7c7b5100955455e831
