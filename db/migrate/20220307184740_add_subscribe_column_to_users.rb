class AddSubscribeColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscribe, :boolean
  end
end
