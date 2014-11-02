class CategoriesController < ApplicationController

    # show one category and all of its places
  def show
    @category = Category.find(params[:id])
    @places = @category.places
  end

  def filter
  	category = Category.find_by_name(params[:by])
  	p category
  	p params
  	p params[:by]
  	@places = category.places
  	@categories = Category.all
  	render :"places/index"
  end
  
end
