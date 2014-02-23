class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.reverse
  end

  def index
    @posts = Post.all.sort_by { |p| Math.log10(p.votes.sum(:vote_type)) }.reverse
    # sort_by_algorithm
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      Vote.create(post: @post, user_id: @post.user_id, vote_type: 1)
      redirect_to '/posts'
    else
      render :new
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end