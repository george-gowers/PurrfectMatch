class ChatroomsController < ApplicationController
  def index
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
  end

  def create
  end

  def destroy
  end
end
