class RemoveSubscribeColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :subscribe
  end
end
