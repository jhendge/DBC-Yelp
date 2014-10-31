class VotesController < ApplicationController
  
  def create
  	if request.xhr? && !Vote.exists?(vote_params) #not sure how to pass in params
  		@vote = Vote.new(vote_params)
  		if @vote.save
  			return @vote.to_json
  		else
  			redirect_to places_path(params[:review_id])#can I do this? url should have review id params
  		end
  	else
  		redirect_to places_path(params[:review_id])
  	end
  end



  private

  def vote_params
  	params.require(:vote).permit(:upvote?, :voteable_id, :voteable_type )
  end

end