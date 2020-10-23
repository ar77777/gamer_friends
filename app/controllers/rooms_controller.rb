class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @currentrooms = current_user.room_users
    myRoomIds = []
    @currentrooms.each do |entry|
      myRoomIds << entry.room_id
    end

    @anotherrooms = RoomUser.where(room_id: myRoomIds).where.not(user_id: current_user)
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
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def roomuser2_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end