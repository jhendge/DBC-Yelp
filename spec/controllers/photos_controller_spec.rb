require 'rails_helper'

RSpec.describe PhotosController do
  let(:chipotle) {Place.new(chipotle_params)}
  let(:chipotle_params) {{name: "Chipotle",
            category_id: 1,
            user_id: 1,
            address: "233 W. Lake Street",
            phone: "(312) 263-6230",
            website: "http://chipotle.com",
            description: "9.5/10 it's okay."}}
  let(:valid_params) {{place_id: 1, 
            url: "http://www.fizzgrid.com/wp-content/uploads/2014/03/double-wrap.jpg",
            description: "a delicious, savory meal within the confines of a flour tortilla"}}
  let(:burrito) {Photo.new(valid_params)}
  let(:update_params) {{place_id: 1, 
            url: "http://www.fizzgrid.com/wp-content/uploads/2014/03/double-wrap.jpg",
            description: "a delicious, savory meal within the confines of a corn OR flour tortilla"}}
  let(:invalid_params) {{place_id: 3, 
            url: "http://www.fizzgrid.com/wp-content/uploads/2014/03/double-wrap.jpg",
            description: "a delicious, savory meal within the confines of a flour tortilla"}}


  describe "GET #index" do
  end

  describe "GET #show" do 

    before(:each) do
      burrito.save
      chipotle.save
    end
    
    it "should show a particular, single photo" do
      get :show, id: burrito.id, place_id: chipotle.id
      expect(subject).to render_template(:"photos/show")
    end
  end

  describe "GET #new" do

    before(:each) do
      burrito.save
      chipotle.save
    end

    it "should render a form to create (add) a new photo" do
      get :new, id: burrito.id, place_id: chipotle.id
      expect(subject).to render_template(:"photos/form")
    end
  end

  describe "POST #create" do 

    before(:each) do
      controller.stub(:current_user).and_return(double("user", id: 1))
      chipotle.save
    end

    it "should save a photo to the DBC and redirect to the place associated with it" do 
      post :create, photo: valid_params, place_id: chipotle.id
      expect(assigns(:photo).valid?).to be_truthy
      expect(subject).to redirect_to place_path(chipotle.id)
    end
  end

  describe "PUT #update" do 

    before(:each) do
      burrito.save
      chipotle.save
    end

    it "should update the photo in the DB" do
      put "update", photo: update_params, id: burrito.id, place_id: chipotle.id
      expect(assigns(:photo).description).to eq("a delicious, savory meal within the confines of a corn OR flour tortilla")
    end

  end

  describe "DELETE #destroy" do
    it "should redirect back to the place page associated with that photo" do 
      burrito.save
      chipotle.save
      delete :destroy, id: burrito.id, place_id: chipotle.id
      expect{Photo.find(burrito.id)}.to raise_error(ActiveRecord::RecordNotFound)
      expect(subject).to redirect_to place_path(chipotle.id)
    end
  end

end
