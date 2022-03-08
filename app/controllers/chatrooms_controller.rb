class ChatroomsController < ApplicationController
  def index
    @pending_incoming_chats = Chatroom.pending_incoming_chats(current_user)
    @pending_sent_chats = Chatroom.pending_sent_chats(current_user)
    @approved_chats = Chatroom.approved_chats(current_user)
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

  def accept
    @chatroom = Chatroom.find(params[:id])
    @chatroom.status = "approved"
    @chatroom.save
    redirect_to chatrooms_path
  end

end
