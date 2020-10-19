class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.includes(:user)
  end

  def create
    @post = Post.new(post_params)
    @post.save
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:game_title, :platform, :time_zone, :text, :call).merge(user_id: current_user.id)
  end
end
