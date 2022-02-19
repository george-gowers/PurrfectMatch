class Chatroom < ApplicationRecord
  belongs_to :engager, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages

  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }
end
