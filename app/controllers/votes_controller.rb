class VotesController < ApplicationController
  include SessionsHelper

  def create
    if session[:user_id] == nil
      return redirect_to signin_path
    else
      @user = current_user
      @vote = Vote.new(vote_params)
      @vote.user = @user
      @vote.save
      redirect_to root_url
    end
  end

  private

  def vote_params

  	params.require(:vote).permit(:upvote?, :voteable_id, :voteable_type)
  end

end
