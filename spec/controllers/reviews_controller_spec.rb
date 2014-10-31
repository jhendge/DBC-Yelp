require "rails_helper"

describe ReviewsController do

	describe 'GET#new' do
	  it 'should show the create review form' do
	  	get :new
	  	expect(subject).to render_template(:"reviews/new")
	  end
	end

	describe 'POST#create' do
		it 'should save add a review to the database' do
			@user = User.find(1)
			@place = Place.find(1)
			expect do 
				post :create, {:description => "great place"}
			end.to change{Review.count}.by(1)
		end
	end



	     #  t.text :description
      # t.belongs_to :user
      # t.belongs_to :place

end