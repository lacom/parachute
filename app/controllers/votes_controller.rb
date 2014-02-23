class VotesController < ApplicationController
  
  before_action :authorize

  def upvote
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    user_id = current_user.id

    @vote = Vote.where(post_id: @post_id, user_id: user_id).first_or_initialize

    @vote.update(vote_type: 1)
    
  end

  def unvote
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    user_id = current_user.id

    @vote = Vote.where(post_id: @post_id, user_id: user_id).first_or_initialize

    @vote.update(vote_type: 0)
  end
end