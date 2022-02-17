class Chatroom < ApplicationRecord
  belongs_to :engager, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
