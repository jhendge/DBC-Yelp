require 'rails_helper'

describe Place do 
	let(:chipotle) { chipotle = Place.create!( 
						 description: "\"It's pronounced 'Chip-po-tlay'.\"", 
						 user_id: 1, 
						 name: "Chipotle", 
						 address: "233 W Lake St", 
						 phone: "(312) 263-6230", 
						 website: "http://chipotle.com"
						 )
					}

    it {should belong_to(:user)}
    it {should belong_to(:category)}
    it {should have_many(:votes)}
    it {should have_many(:photos)}
    it {should have_many(:reviews)}

	describe "#score" do
		
		it "should calculate its score based off its votes" do
			v1 = double("vote", :upvote? => true)
			v2 = double("vote", :upvote? => false)
			v3 = double("vote", :upvote? => true)
			v4 = double("vote", :upvote? => true)
			allow(chipotle).to receive(:votes).and_return([v1,v2,v3,v4])
			expect(chipotle.score).to eq(2)
		end

	end


end