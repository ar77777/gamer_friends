class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:message][:room_id])
    if RoomUser.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      if @message.save
        @message = Message.new
        gets_all_messages
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end

  def gets_all_messages
    @messages = @room.messages.includes(:user)
    @room_users = @room.room_users
  end
end