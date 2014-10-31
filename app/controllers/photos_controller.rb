class PhotosController < ApplicationController

  def index
    @place = Place.find(params[:place_id])
    @photos = @place.photos
    @photos = Photo.order(created_at: :desc)
  end

  def show
    @place = Place.find(params[:place_id])
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    render(:"photos/form")
  end

  def create
    @photo = Photo.new(params_photo)
    if @photo.save
      redirect_to place_path(params[:place_id])
    else
      @error = "Photo not saved"
      render :"photos/form"
    end
  end

  def update
    @place = Place.find(params[:place_id])
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params_photo)
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:place_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to place_path(@place)
  end

  private

  def params_photo
    params.require(:photo).permit(:place_id, :url, :description)
  end
end