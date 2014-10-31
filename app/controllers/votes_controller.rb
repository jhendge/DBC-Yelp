class VotesController < ApplicationController
  
  def create

  end

  private

  def vote_params
  	params.require(:vote).permit(:upvote?)
  end

end