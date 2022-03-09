class Chatroom < ApplicationRecord
  belongs_to :engager, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages

  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }

  def self.pending_incoming_chats(user)
    chatrooms = current_chats(user)
    pending_incoming_chats = []
    chatrooms.each do |chatroom|
      pending_incoming_chats << chatroom if (chatroom.status == "pending" && user.id == chatroom.receiver_id)
    end
    return pending_incoming_chats
  end

  def self.pending_sent_chats(user)
    chatrooms = current_chats(user)
    pending_sent_chats = []
    chatrooms.each do |chatroom|
      pending_sent_chats << chatroom if (chatroom.status == "pending" && user.id == chatroom.engager_id )
    end
    return pending_sent_chats
  end

  def self.approved_chats(user)
    chatrooms = current_chats(user)
    approved_chats = []
    chatrooms.each do |chatroom|
      approved_chats << chatroom if (chatroom.status == "approved")
    end
    return approved_chats
  end

  private

  def self.current_chats(user)
    chatrooms = []
    all_chatrooms = Chatroom.all
    all_chatrooms.each do |chatroom|
    chatrooms << chatroom if (user.id == chatroom.engager_id || user.id == chatroom.receiver_id)
    end
    return chatrooms
  end

end
