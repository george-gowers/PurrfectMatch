class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :description, :text
    add_column :users, :breed, :string
    add_column :users, :location, :string
    add_column :users, :owner_name, :string
    add_column :users, :owner_description, :text
  end
end
