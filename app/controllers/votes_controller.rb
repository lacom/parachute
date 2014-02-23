class VotesController < ApplicationController

  def upvote
    post_id = params[:post_id]
    user_id = current_user.id

    @vote = Vote.where(post_id: post_id, user_id: user_id).first_or_initialize

    @vote.update(vote_type: 1)
      
    redirect_to "/posts/#{@vote.post_id}"

  end

  def unvote
    post_id = params[:post_id]
    user_id = current_user.id

    @vote = Vote.where(post_id: post_id, user_id: user_id).first_or_initialize

    @vote.update(vote_type: 0)
      
    redirect_to "/posts/#{@vote.post_id}"
  end
end