class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :image, :text
    add_column :users, :role, :string
    add_column :users, :rating, :float
  end
end
