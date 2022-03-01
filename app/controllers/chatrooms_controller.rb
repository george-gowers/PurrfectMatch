class ChatroomsController < ApplicationController
  def index
    @chatrooms = []
    all_chatrooms = Chatroom.all
    all_chatrooms.each do |chatroom|
      @chatrooms << chatroom if (current_user.id == chatroom.engager_id || current_user.id == chatroom.receiver_id)
    end
  end

  def show
    chat = Chatroom.find(params[:id])
    if (current_user.id == chat.engager_id || current_user.id == chat.receiver_id)
      @message = Message.new
      @chatroom = chat
    else
      redirect_to chatrooms_path
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy

    redirect_to chatrooms_path
  end
end
