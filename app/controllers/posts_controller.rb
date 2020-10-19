class PostsController < ApplicationController

  PER = 18

  def index
    @post = Post.new
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(PER)
  end

  def create
    @post = Post.new(post_params)
    @post.save
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:game_title, :platform, :time_zone, :text, :call).merge(user_id: current_user.id)
  end
end
