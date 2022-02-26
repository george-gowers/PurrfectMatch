class AddDefaultValueToChatrooms < ActiveRecord::Migration[6.1]
  def change
    change_column :chatrooms, :status, :integer, default: 0
  end
end
