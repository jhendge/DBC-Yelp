class VotesController < ApplicationController
  include SessionsHelper

  def create
    p "_____________________"
    #p session[:user_id]
    if session[:user_id] == nil
      p "____________________________"
      p session[:user_id]
      p "in seession nil"
      return redirect_to signin_path
    else
      @user = current_user
      @vote = Vote.new(vote_params)
      @vote.user_id = @user
      @vote.save
      redirect_to root_url
    end
  end

  private

  def vote_params

  	params.require(:vote).permit(:upvote?, :voteable_id, :voteable_type)
  end

end
