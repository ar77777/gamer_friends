class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:show]

  def index
    @post = Post.new
    @posts = Post.includes(:user).page(params[:page]).per(20).order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.save
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    
    @currentuser = RoomUser.where(user_id:current_user.id)
    @postuser = RoomUser.where(user_id:@post.user.id)

    unless @post.id == current_user.id
      @currentuser.each do |cu|
        @postuser.each do |pu|
          if cu.room_id == pu.room_id then
            @isroom = true
            @roomid = cu.room_id
          end
        end
      end

      unless @isroom
        @room = Room.new
        @roomuser = RoomUser.new
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:game_title, :platform, :time_zone, :text, :call).merge(user_id: current_user.id)
  end
end
