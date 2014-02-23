class CommentsController < ApplicationController

  before_action :authorize

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post_id}"
    else
      render :new
    end
  end

private

  def comment_params
    params.require(:comment).permit(:post_id, :body, :user_id)
  end

end