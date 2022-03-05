class SendWeeklyEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    users = User.near(user.location, 100)
  end
end
