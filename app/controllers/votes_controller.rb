class VotesController < ApplicationController
  include SessionsHelper
  before_filter :check_session

  def make
    if request.xhr?
      @user = current_user
      @vote = Vote.new(vote_params)
      @vote.user = @user
      @vote.save
      return render json: @vote.voteable.score.to_json, content_type: :json
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
