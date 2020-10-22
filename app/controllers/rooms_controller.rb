class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms.order("updated_at DESC")
  end

  def create
    @room = Room.create
    @roomuser1 = RoomUser.create(room_id: @room.id, user_id: current_user.id)
    @roomuser2 = RoomUser.create(roomuser2_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if RoomUser.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @room_users = @room.room_users
    end
  end

  private
  def roomuser2_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end