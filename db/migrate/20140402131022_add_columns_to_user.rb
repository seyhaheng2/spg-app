class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :telephone, :integer
    add_column :users, :birthday, :date
    add_column :users, :image, :string
  end
end
