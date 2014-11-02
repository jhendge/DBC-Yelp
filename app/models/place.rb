class Place < ActiveRecord::Base

  #### attributes ####
  #  t.belongs_to :user
  #  t.belongs_to :category
  #  t.string :name
  #  t.string :address
  #  t.string :phone
  #  t.string :website
  #  t.text :description

  belongs_to :user
  belongs_to :category
  has_many :votes, as: :voteable
  has_many :photos
  has_many :reviews

  validates :address, presence: true


  def map
  	###### TODO ######
  	"<map goes here>"
  end

  def score
  	self.votes.inject(0) {|sum, vote| vote.upvote? ? sum + 1 : sum - 1 }
  end

  def find_coord
    address_json = JSON.parse(Net::HTTP.get(URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{URI::escape(self.address)}")))
    self.lat = address_json["results"][0]["geometry"]["location"]["lat"]
    self.lng = address_json["results"][0]["geometry"]["location"]["lng"]
  end
end
